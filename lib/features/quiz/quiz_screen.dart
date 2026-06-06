// lib/features/quiz/quiz_screen.dart
// Quiz Engine - Rule-based, 3 cấp độ

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/study_module.dart';
import '../../data/models/citta_model.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../core/theme/vdp_theme.dart';
import '../../shared/providers/progress_provider.dart';

enum QuizLevel { beginner, intermediate, advanced }

enum QuizQuestionType {
  cetasikaGroup,      // Tâm Sở này thuộc nhóm nào?
  associationType,    // Tâm A có phối hợp với Tâm Sở B không?
  cittaVedana,        // Tâm A có thọ gì?
  conflictDetect,     // Tâm Sở A và B có thể cùng xuất hiện không?
  cittaBhumi,         // Tâm A thuộc cõi nào?
}

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

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.module.colorCode);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Quiz: ${widget.module.title}',
            style: const TextStyle(fontSize: 15)),
        actions: [
          if (_started && !_finished)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  '${_currentIndex + 1}/${_questions.length}',
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

  // ─── Level Selector ───────────────────────────────────────────────────────

  Widget _buildLevelSelector(Color color) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'Chọn Cấp Độ',
            style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: color,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mỗi cấp độ có 10 câu hỏi được tạo tự động',
            style: TextStyle(color: Colors.grey, fontSize: 14),
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

  // ─── Question View ────────────────────────────────────────────────────────

  Widget _buildQuestion(Color color) {
    if (_questions.isEmpty) {
      return const Center(child: Text('Chưa đủ dữ liệu để tạo câu hỏi'));
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
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getTypeName(q.type),
                    style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 14),

                // Question
                Text(
                  q.questionText,
                  style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w600, height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // Options
                ...q.options.asMap().entries.map((e) {
                  final i = e.key;
                  final opt = e.value;
                  return _OptionTile(
                    label: opt,
                    index: i,
                    selected: _selectedOption == i,
                    answered: _answered,
                    isCorrect: i == q.correctIndex,
                    onTap: _answered ? null : () => _selectOption(i),
                  );
                }),

                // Explanation (after answer)
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
                                fontWeight: FontWeight.bold, color: Colors.blue,
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
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  _currentIndex + 1 < _questions.length ? 'Câu tiếp theo' : 'Xem kết quả',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ─── Result View ──────────────────────────────────────────────────────────

  Widget _buildResult(Color color) {
    final pct = (_score / _questions.length * 100).round();
    final passed = pct >= 70;
    final emoji = pct >= 90 ? '🏆' : pct >= 70 ? '✅' : '📚';

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
              '$_score / ${_questions.length} câu đúng',
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
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  child: const Text('Xong', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ─── Quiz Logic ───────────────────────────────────────────────────────────

  void _startQuiz() {
    final dataState = ref.read(vdpRepositoryProvider);
    _questions = _generateQuestions(dataState);
    if (_questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chưa đủ dữ liệu tạo câu hỏi cho module này.')),
      );
      return;
    }
    _questions.shuffle(_rng);
    if (_questions.length > 10) _questions = _questions.sublist(0, 10);
    setState(() {
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
    final correct = _questions[_currentIndex].correctIndex == index;
    setState(() {
      _selectedOption = index;
      _answered = true;
      if (correct) _score++;
    });
  }

  void _nextQuestion() {
    if (_currentIndex + 1 >= _questions.length) {
      // Save progress
      ref.read(progressProvider.notifier).recordQuizScore(
        widget.module.id,
        (_score / _questions.length * 100).round().toDouble(),
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

  List<QuizQuestion> _generateQuestions(VdpDataState data) {
    final questions = <QuizQuestion>[];
    final cetasikas = data.cetasikas;
    final cittas = data.cittas;

    if (cetasikas.isEmpty || cittas.isEmpty) return questions;

    // Q-Type 1: Tâm Sở thuộc nhóm nào?
    for (final cs in cetasikas.take(5)) {
      final correct = _getGroupName(cs.group);
      final wrong = CetasikaGroup.values
          .where((g) => g != cs.group)
          .map(_getGroupName)
          .toList()
        ..shuffle(_rng);
      final opts = [correct, wrong[0], wrong[1], wrong[2]]..shuffle(_rng);
      questions.add(QuizQuestion(
        id: 'q_group_${cs.id}',
        questionText: 'Tâm Sở "${cs.nameVietnamese}" (${cs.namePali}) thuộc nhóm nào?',
        options: opts,
        correctIndex: opts.indexOf(correct),
        type: QuizQuestionType.cetasikaGroup,
        explanation: '"${cs.nameVietnamese}" thuộc ${correct}.\n${cs.descriptionVi}',
      ));
    }

    // Q-Type 2: Tâm có thọ gì?
    for (final citta in cittas.take(5)) {
      final correct = _getVedanaName(citta.vedana);
      final wrong = Vedana.values
          .where((v) => v != citta.vedana)
          .map(_getVedanaName)
          .toList()
        ..shuffle(_rng);
      final opts = [correct, wrong[0], wrong[1]]..shuffle(_rng);
      questions.add(QuizQuestion(
        id: 'q_vedana_${citta.id}',
        questionText: 'Tâm "${citta.nameVietnamese}" có thọ gì?',
        options: opts,
        correctIndex: opts.indexOf(correct),
        type: QuizQuestionType.cittaVedana,
        explanation: '"${citta.nameVietnamese}" có $correct.',
      ));
    }

    // Q-Type 3 (intermediate+): Xung đột Tâm Sở
    if (_level != QuizLevel.beginner) {
      for (final cs in cetasikas.where((c) => c.conflictRules.isNotEmpty).take(3)) {
        final conflictId = cs.conflictRules.first.conflictingIds.first;
        final conflictCs = cetasikas.where((c) => c.id == conflictId).firstOrNull;
        if (conflictCs == null) continue;
        const correct = 'Không — chúng xung đột';
        final opts = [correct, 'Có — luôn cùng nhau', 'Có — đôi khi']..shuffle(_rng);
        questions.add(QuizQuestion(
          id: 'q_conflict_${cs.id}_$conflictId',
          questionText:
              '"${cs.nameVietnamese}" và "${conflictCs.nameVietnamese}" có thể cùng xuất hiện trong một tâm không?',
          options: opts,
          correctIndex: opts.indexOf(correct),
          type: QuizQuestionType.conflictDetect,
          explanation: cs.conflictRules.first.explanation,
        ));
      }
    }

    // Q-Type 4 (advanced): Bhumi
    if (_level == QuizLevel.advanced) {
      for (final citta in cittas.take(3)) {
        final correct = _getBhumiName(citta.bhumiGroup);
        final wrong = BhumiGroup.values
            .where((b) => b != citta.bhumiGroup)
            .map(_getBhumiName)
            .toList()
          ..shuffle(_rng);
        final opts = [correct, wrong[0], wrong[1], wrong[2]]..shuffle(_rng);
        questions.add(QuizQuestion(
          id: 'q_bhumi_${citta.id}',
          questionText: 'Tâm "${citta.nameVietnamese}" thuộc cõi giới nào?',
          options: opts,
          correctIndex: opts.indexOf(correct),
          type: QuizQuestionType.cittaBhumi,
          explanation: '"${citta.nameVietnamese}" thuộc $correct.',
        ));
      }
    }

    return questions;
  }

  String _getGroupName(CetasikaGroup g) {
    switch (g) {
      case CetasikaGroup.sabbacittasadharana: return '7 Biến Hành';
      case CetasikaGroup.pakinnaka: return '6 Biệt Cảnh';
      case CetasikaGroup.akusala: return '14 Bất Thiện';
      case CetasikaGroup.sobhana: return '25 Tịnh Hảo';
    }
  }

  String _getVedanaName(Vedana v) {
    switch (v) {
      case Vedana.pleasant: return 'Lạc thọ';
      case Vedana.unpleasant: return 'Khổ thọ';
      case Vedana.neutral: return 'Xả thọ';
      case Vedana.joy: return 'Hỷ thọ';
    }
  }

  String _getBhumiName(BhumiGroup b) {
    switch (b) {
      case BhumiGroup.akusala: return 'Bất Thiện';
      case BhumiGroup.ahetuka: return 'Vô Nhân';
      case BhumiGroup.sobhanaKamavacara: return 'Tịnh Hảo Dục Giới';
      case BhumiGroup.rupavacara: return 'Sắc Giới';
      case BhumiGroup.arupavacara: return 'Vô Sắc Giới';
      case BhumiGroup.lokuttara: return 'Siêu Thế';
    }
  }

  String _getTypeName(QuizQuestionType t) {
    switch (t) {
      case QuizQuestionType.cetasikaGroup: return 'Phân nhóm';
      case QuizQuestionType.associationType: return 'Phối hợp';
      case QuizQuestionType.cittaVedana: return 'Thọ';
      case QuizQuestionType.conflictDetect: return 'Xung đột';
      case QuizQuestionType.cittaBhumi: return 'Cõi giới';
    }
  }
}

// ─── Option Tile ──────────────────────────────────────────────────────────────

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
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade300;
    Color bgColor = Colors.white;
    Color textColor = VdpColors.onBackground;
    Widget? trailing;

    if (answered) {
      if (isCorrect) {
        borderColor = Colors.green;
        bgColor = Colors.green.shade50;
        trailing = const Icon(Icons.check_circle, color: Colors.green);
      } else if (selected) {
        borderColor = Colors.red;
        bgColor = Colors.red.shade50;
        trailing = const Icon(Icons.cancel, color: Colors.red);
        textColor = Colors.red.shade700;
      }
    } else if (selected) {
      borderColor = VdpColors.primary;
      bgColor = VdpColors.primary.withOpacity(0.06);
    }

    return Semantics(
      label: 'Lựa chọn ${index + 1}: $label',
      button: !answered,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 28, height: 28,
                decoration: BoxDecoration(
                  color: borderColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor),
                ),
                alignment: Alignment.center,
                child: Text(
                  String.fromCharCode(65 + index), // A, B, C, D
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: borderColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 14, color: textColor, height: 1.4),
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Level Card ───────────────────────────────────────────────────────────────

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
    final info = _levelInfo(level);

    return Semantics(
      label: '${info['title']} — ${info['desc']}',
      selected: selected,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selected
                ? (info['color'] as Color).withOpacity(0.1)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? info['color'] as Color
                  : Colors.grey.shade300,
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Text(info['icon'] as String, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info['title'] as String,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: info['color'] as Color,
                      ),
                    ),
                    Text(
                      info['desc'] as String,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              if (selected)
                Icon(Icons.check_circle, color: info['color'] as Color),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _levelInfo(QuizLevel l) {
    switch (l) {
      case QuizLevel.beginner:
        return {
          'title': 'Cơ Bản',
          'desc': 'Nhóm, Thọ, Cõi giới — phù hợp người mới bắt đầu',
          'icon': '🌱',
          'color': Colors.green,
        };
      case QuizLevel.intermediate:
        return {
          'title': 'Trung Cấp',
          'desc': 'Thêm câu hỏi xung đột Tâm Sở',
          'icon': '🌿',
          'color': Colors.blue,
        };
      case QuizLevel.advanced:
        return {
          'title': 'Nâng Cao',
          'desc': 'Toàn bộ — Bhumi, Nghiệp, Nhân Duyên',
          'icon': '🏔️',
          'color': Colors.purple,
        };
    }
  }
}
