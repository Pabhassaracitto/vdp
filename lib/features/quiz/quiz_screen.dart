// lib/features/quiz/quiz_screen.dart
// Quiz Engine — Rule-based, 3 cấp độ
// Refactored: safety checks, null-safe, SM-2 tích hợp, 0 warning

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/models/study_module.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../shared/providers/progress_provider.dart';

// ─── Enums ────────────────────────────────────────────────────────────────────

enum QuizLevel { beginner, intermediate, advanced }

enum QuizQuestionType {
  cetasikaGroup, // Tâm Sở này thuộc nhóm nào?
  cittaVedana, // Tâm A có thọ gì?
  conflictDetect, // Tâm Sở A và B có thể cùng xuất hiện không?
  cittaBhumi, // Tâm A thuộc cõi nào?
}

// ─── Model ────────────────────────────────────────────────────────────────────

class QuizQuestion {
  final String id;
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final QuizQuestionType type;
  final String explanation;

  const QuizQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctIndex,
    required this.type,
    required this.explanation,
  });
}

// ─── Minimum data requirements ────────────────────────────────────────────────

/// Số lựa chọn sai tối thiểu để tạo câu hỏi 4-option.
const _kMinWrongOptions4 = 3;

/// Số lựa chọn sai tối thiểu để tạo câu hỏi 3-option.
const _kMinWrongOptions3 = 2;

/// Số câu hỏi tối đa mỗi bài quiz.
const _kMaxQuestions = 10;

// ─── Screen ───────────────────────────────────────────────────────────────────

class QuizScreen extends ConsumerStatefulWidget {
  final StudyModule module;
  const QuizScreen({super.key, required this.module});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  QuizLevel _level = QuizLevel.beginner;
  List<QuizQuestion> _questions = [];
  int _currentIndex = 0;
  int? _selectedOption;
  bool _answered = false;
  int _score = 0;
  bool _started = false;
  bool _finished = false;

  final _rng = Random();

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.module.colorCode);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          'Quiz: ${widget.module.title}',
          style: const TextStyle(fontSize: 15),
        ),
        actions: [
          if (_started && !_finished)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  '${_currentIndex + 1} / ${_questions.length}',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ),
        ],
      ),
      body: !_started
          ? _buildLevelSelector(color)
          : _finished
              ? _buildResult(color)
              : _buildQuestion(color),
    );
  }

  // ── Level Selector ─────────────────────────────────────────────────────────

  Widget _buildLevelSelector(Color color) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'Chọn Cấp Độ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mỗi cấp độ có tối đa 10 câu hỏi được tạo tự động',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _LevelCard(
            level: QuizLevel.beginner,
            selected: _level == QuizLevel.beginner,
            onTap: () => setState(() => _level = QuizLevel.beginner),
          ),
          const SizedBox(height: 12),
          _LevelCard(
            level: QuizLevel.intermediate,
            selected: _level == QuizLevel.intermediate,
            onTap: () => setState(() => _level = QuizLevel.intermediate),
          ),
          const SizedBox(height: 12),
          _LevelCard(
            level: QuizLevel.advanced,
            selected: _level == QuizLevel.advanced,
            onTap: () => setState(() => _level = QuizLevel.advanced),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _startQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Bắt đầu', style: TextStyle(fontSize: 17)),
            ),
          ),
        ],
      ),
    );
  }

  // ── Question View ──────────────────────────────────────────────────────────

  Widget _buildQuestion(Color color) {
    if (_questions.isEmpty) {
      return const Center(
        child: Text('Chưa đủ dữ liệu để tạo câu hỏi'),
      );
    }

    final q = _questions[_currentIndex];
    final progress = (_currentIndex + 1) / _questions.length;

    return Column(
      children: [
        // Progress bar
        LinearProgressIndicator(
          value: progress,
          backgroundColor: color.withOpacity(0.15),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 5,
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Type badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getTypeName(q.type),
                    style: TextStyle(
                      fontSize: 11,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Question text
                Text(
                  q.questionText,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // Options
                ...q.options.asMap().entries.map((entry) {
                  final i = entry.key;
                  final opt = entry.value;
                  return _OptionTile(
                    label: opt,
                    index: i,
                    selected: _selectedOption == i,
                    answered: _answered,
                    isCorrect: i == q.correctIndex,
                    onTap: _answered ? null : () => _selectOption(i),
                  );
                }),

                // Explanation
                if (_answered) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.info, color: Colors.blue, size: 16),
                            SizedBox(width: 6),
                            Text(
                              'Giải thích',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          q.explanation,
                          style: const TextStyle(fontSize: 13, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),

        // Next button
        if (_answered)
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _currentIndex + 1 < _questions.length
                      ? 'Câu tiếp theo'
                      : 'Xem kết quả',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ── Result View ────────────────────────────────────────────────────────────

  Widget _buildResult(Color color) {
    final total = _questions.length;
    final pct = total > 0 ? (_score / total * 100).round() : 0;
    final passed = pct >= 70;
    final emoji = pct >= 90
        ? '🏆'
        : pct >= 70
            ? '✅'
            : '📚';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            Text(
              '$pct%',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: passed ? Colors.green : Colors.orange,
              ),
            ),
            Text(
              '$_score / $total câu đúng',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              passed
                  ? 'Xuất sắc! Bạn đã nắm vững module này.'
                  : 'Hãy ôn lại và thử lại nhé!',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: _restartQuiz,
                  child: const Text('Làm lại'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Xong'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── Quiz Logic ─────────────────────────────────────────────────────────────

  void _startQuiz() {
    final dataState = ref.read(vdpRepositoryProvider);
    final generated = _generateQuestions(dataState);

    if (generated.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chưa đủ dữ liệu để tạo câu hỏi cho module này.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    generated.shuffle(_rng);
    final questions = generated.length > _kMaxQuestions
        ? generated.sublist(0, _kMaxQuestions)
        : generated;

    setState(() {
      _questions = questions;
      _started = true;
      _currentIndex = 0;
      _score = 0;
      _answered = false;
      _selectedOption = null;
      _finished = false;
    });
  }

  void _restartQuiz() {
    setState(() {
      _started = false;
      _finished = false;
      _questions = [];
      _currentIndex = 0;
      _score = 0;
      _selectedOption = null;
      _answered = false;
    });
  }

  void _selectOption(int index) {
    if (_answered) return;
    final isCorrect = _questions[_currentIndex].correctIndex == index;
    setState(() {
      _selectedOption = index;
      _answered = true;
      if (isCorrect) _score++;
    });
  }

  void _nextQuestion() {
    if (_currentIndex + 1 >= _questions.length) {
      final pct = (_score / _questions.length * 100).roundToDouble();
      ref.read(progressProvider.notifier).recordQuizScore(
            widget.module.id,
            pct,
          );
      setState(() => _finished = true);
    } else {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        _answered = false;
      });
    }
  }

  // ── Question Generator ─────────────────────────────────────────────────────

  List<QuizQuestion> _generateQuestions(VdpDataState data) {
    final questions = <QuizQuestion>[];
    final cetasikas = data.cetasikas;
    final cittas = data.cittas;

    if (cetasikas.isEmpty || cittas.isEmpty) return questions;

    final allGroups = CetasikaGroup.values;
    final allVedanas = Vedana.values;
    final allBhumis = BhumiGroup.values;

    // ── Q-Type 1: Cetasika thuộc nhóm nào? (4 options) ──────────────────
    if (allGroups.length > _kMinWrongOptions4) {
      final pool = List<CetasikaModel>.from(cetasikas)..shuffle(_rng);

      for (final cs in pool.take(5)) {
        final correctLabel = _getGroupName(cs.group);
        final wrongLabels = allGroups
            .where((g) => g != cs.group)
            .map(_getGroupName)
            .toList()
          ..shuffle(_rng);

        if (wrongLabels.length < _kMinWrongOptions4) continue;

        final opts = <String>[
          correctLabel,
          wrongLabels[0],
          wrongLabels[1],
          wrongLabels[2],
        ]..shuffle(_rng);

        questions.add(QuizQuestion(
          id: 'q_group_${cs.id}',
          questionText:
              'Tâm Sở "${cs.nameVietnamese}" (${cs.namePali}) thuộc nhóm nào?',
          options: opts,
          correctIndex: opts.indexOf(correctLabel),
          type: QuizQuestionType.cetasikaGroup,
          explanation:
              '"${cs.nameVietnamese}" thuộc $correctLabel.\n${cs.descriptionVi}',
        ));
      }
    }

    // ── Q-Type 2: Citta có thọ gì? (3 options) ──────────────────────────
    if (allVedanas.length > _kMinWrongOptions3) {
      final pool = List<CittaModel>.from(cittas)..shuffle(_rng);

      for (final citta in pool.take(5)) {
        final correctLabel = _getVedanaName(citta.vedana);
        final wrongLabels = allVedanas
            .where((v) => v != citta.vedana)
            .map(_getVedanaName)
            .toList()
          ..shuffle(_rng);

        if (wrongLabels.length < _kMinWrongOptions3) continue;

        final opts = <String>[
          correctLabel,
          wrongLabels[0],
          wrongLabels[1],
        ]..shuffle(_rng);

        questions.add(QuizQuestion(
          id: 'q_vedana_${citta.id}',
          questionText: 'Tâm "${citta.nameVietnamese}" có thọ gì?',
          options: opts,
          correctIndex: opts.indexOf(correctLabel),
          type: QuizQuestionType.cittaVedana,
          explanation: '"${citta.nameVietnamese}" có $correctLabel.',
        ));
      }
    }

    // ── Q-Type 3: Conflict (intermediate+) ──────────────────────────────
    if (_level != QuizLevel.beginner) {
      final conflictPool = cetasikas
          .where((c) => c.conflictRules.isNotEmpty)
          .toList()
        ..shuffle(_rng);

      for (final cs in conflictPool.take(3)) {
        final rule = cs.conflictRules.first;
        final conflictIds = rule.conflictingIds;
        if (conflictIds.isEmpty) continue;

        final conflictId = conflictIds.first;
        final conflictCs =
            cetasikas.where((c) => c.id == conflictId).firstOrNull;
        if (conflictCs == null) continue;

        const correctLabel = 'Không — chúng xung đột';
        final opts = <String>[
          correctLabel,
          'Có — luôn cùng nhau',
          'Có — đôi khi',
        ]..shuffle(_rng);

        questions.add(QuizQuestion(
          id: 'q_conflict_${cs.id}_$conflictId',
          questionText:
              '"${cs.nameVietnamese}" và "${conflictCs.nameVietnamese}" '
              'có thể cùng xuất hiện trong một tâm không?',
          options: opts,
          correctIndex: opts.indexOf(correctLabel),
          type: QuizQuestionType.conflictDetect,
          explanation: rule.explanation,
        ));
      }
    }

    // ── Q-Type 4: Bhumi (advanced) ───────────────────────────────────────
    if (_level == QuizLevel.advanced && allBhumis.length > _kMinWrongOptions4) {
      final pool = List<CittaModel>.from(cittas)..shuffle(_rng);

      for (final citta in pool.take(3)) {
        final correctLabel = _getBhumiName(citta.bhumiGroup);
        final wrongLabels = allBhumis
            .where((b) => b != citta.bhumiGroup)
            .map(_getBhumiName)
            .toList()
          ..shuffle(_rng);

        if (wrongLabels.length < _kMinWrongOptions4) continue;

        final opts = <String>[
          correctLabel,
          wrongLabels[0],
          wrongLabels[1],
          wrongLabels[2],
        ]..shuffle(_rng);

        questions.add(QuizQuestion(
          id: 'q_bhumi_${citta.id}',
          questionText: 'Tâm "${citta.nameVietnamese}" thuộc cõi giới nào?',
          options: opts,
          correctIndex: opts.indexOf(correctLabel),
          type: QuizQuestionType.cittaBhumi,
          explanation: '"${citta.nameVietnamese}" thuộc $correctLabel.',
        ));
      }
    }

    return questions;
  }

  // ── Label Helpers ──────────────────────────────────────────────────────────

  String _getGroupName(CetasikaGroup g) {
    switch (g) {
      case CetasikaGroup.sabbacittasadharana:
        return '7 Biến Hành';
      case CetasikaGroup.pakinnaka:
        return '6 Biệt Cảnh';
      case CetasikaGroup.akusala:
        return '14 Bất Thiện';
      case CetasikaGroup.sobhana:
        return '25 Tịnh Hảo';
    }
  }

  String _getVedanaName(Vedana v) {
    switch (v) {
      case Vedana.pleasant:
        return 'Lạc thọ';
      case Vedana.unpleasant:
        return 'Khổ thọ';
      case Vedana.neutral:
        return 'Xả thọ';
      case Vedana.joy:
        return 'Hỷ thọ';
    }
  }

  String _getBhumiName(BhumiGroup b) {
    switch (b) {
      case BhumiGroup.akusala:
        return 'Bất Thiện';
      case BhumiGroup.ahetuka:
        return 'Vô Nhân';
      case BhumiGroup.sobhanaKamavacara:
        return 'Tịnh Hảo Dục Giới';
      case BhumiGroup.rupavacara:
        return 'Sắc Giới';
      case BhumiGroup.arupavacara:
        return 'Vô Sắc Giới';
      case BhumiGroup.lokuttara:
        return 'Siêu Thế';
    }
  }

  String _getTypeName(QuizQuestionType t) {
    switch (t) {
      case QuizQuestionType.cetasikaGroup:
        return 'Phân Loại Tâm Sở';
      case QuizQuestionType.cittaVedana:
        return 'Nhận Diện Thọ';
      case QuizQuestionType.conflictDetect:
        return 'Xung Đột Giáo Lý';
      case QuizQuestionType.cittaBhumi:
        return 'Cõi Giới';
    }
  }
}

// ─── Sub-widgets ──────────────────────────────────────────────────────────────

class _LevelCard extends StatelessWidget {
  final QuizLevel level;
  final bool selected;
  final VoidCallback onTap;

  const _LevelCard({
    required this.level,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final (title, subtitle, icon, color) = switch (level) {
      QuizLevel.beginner => ('Sơ Cấp', 'Nhóm & Thọ cơ bản', '🌱', Colors.green),
      QuizLevel.intermediate => (
          'Trung Cấp',
          '+ Xung đột Tâm Sở',
          '🔥',
          Colors.orange
        ),
      QuizLevel.advanced => (
          'Nâng Cao',
          '+ Cõi Giới & toàn bộ loại',
          '⚡',
          Colors.purple
        ),
    };

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.08) : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? color : Colors.grey.shade200,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: selected ? color : VdpColors.onBackground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded, color: color, size: 22),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String label;
  final int index;
  final bool selected;
  final bool answered;
  final bool isCorrect;
  final VoidCallback? onTap;

  const _OptionTile({
    required this.label,
    required this.index,
    required this.selected,
    required this.answered,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor;
    final Color borderColor;
    final Widget? trailingIcon;

    if (!answered) {
      bgColor = selected ? Colors.blue.shade50 : Colors.white;
      borderColor = selected ? Colors.blue : Colors.grey.shade300;
      trailingIcon = null;
    } else if (isCorrect) {
      bgColor = Colors.green.shade50;
      borderColor = Colors.green;
      trailingIcon =
          const Icon(Icons.check_circle, color: Colors.green, size: 20);
    } else if (selected) {
      bgColor = Colors.red.shade50;
      borderColor = Colors.red;
      trailingIcon = const Icon(Icons.cancel, color: Colors.red, size: 20);
    } else {
      bgColor = Colors.white;
      borderColor = Colors.grey.shade200;
      trailingIcon = null;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: borderColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Text(
                String.fromCharCode(65 + index),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: borderColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
            ),
            if (trailingIcon != null) ...[
              const SizedBox(width: 8),
              trailingIcon,
            ],
          ],
        ),
      ),
    );
  }
}
