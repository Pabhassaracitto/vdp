// lib/features/quiz/quiz_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/study_module.dart';
import '../../shared/providers/progress_provider.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/repositories/vdp_repository.dart';

enum QuizLevel { beginner, intermediate, advanced }
enum QuizQuestionType { cetasikaGroup, associationType, cittaVedana }

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
  List<QuizQuestion> _questions = [];
  bool _started = false;
  int _currentQuestionIndex = 0;
  int _score = 0;

  final _rng = Random();

  void _startQuiz() {
    final dataState = ref.read(vdpRepositoryProvider);
    final generated = _generateQuestions(dataState);
    if (generated.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Module này đang được cập nhật thêm nội dung. Hãy thử lại sau.')),
      );
      return;
    }
    setState(() {
      _questions = generated..shuffle(_rng);
      _started = true;
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  List<QuizQuestion> _generateQuestions(VdpDataState data) {
    final questions = <QuizQuestion>[];
    final usedIds = <String>{};

    final moduleCetasikas = data.cetasikas.where((c) => widget.module.cetasikaIds.contains(c.id)).toList();
    final moduleCittas = data.cittas.where((c) => widget.module.cittaIds.contains(c.id)).toList();

    // 1. Cetasika Group Questions
    for (final cs in moduleCetasikas.take(10)) {
      final id = 'q_group_${cs.id}';
      if (usedIds.contains(id)) continue;
      final correct = cs.group.name;
      final allGroups = CetasikaGroup.values.map((e) => e.name).toList()..remove(correct)..shuffle(_rng);
      final opts = ([correct] + allGroups.take(3).toList())..shuffle(_rng);
      questions.add(QuizQuestion(id: id, questionText: 'Tâm sở ${cs.namePali} thuộc nhóm nào?', options: opts, correctIndex: opts.indexOf(correct), type: QuizQuestionType.cetasikaGroup, explanation: 'Tâm sở ${cs.namePali} thuộc nhóm ${cs.group.name}.'));
      usedIds.add(id);
    }

    // 2. Association Questions
    for (final citta in moduleCittas.take(5)) {
      for (final cs in moduleCetasikas.take(5)) {
        // Note: We need a unique ID here, so we use the repository reference if had it, 
        // but here we must rely on the data provided in VdpDataState or helper methods.
        final id = 'q_assoc_${citta.id}_${cs.id}';
        if (usedIds.contains(id)) continue;
        
        final isAssoc = citta.cetasikaAssociations.any((a) => a.cetasikaId == cs.id);
        final correct = isAssoc ? 'Luôn có' : 'Không có';
        
        final opts = ['Luôn có', 'Đôi khi có', 'Không có'];
        questions.add(QuizQuestion(id: id, questionText: 'Tâm ${citta.namePali} có ${cs.namePali} không?', options: opts, correctIndex: opts.indexOf(correct), type: QuizQuestionType.associationType, explanation: 'Tâm ${citta.namePali} có mối liên hệ $correct.'));
        usedIds.add(id);
      }
    }
    return questions..shuffle(_rng);
  }

  @override
  Widget build(BuildContext context) {
    if (!_started) {
      return Scaffold(body: Center(child: ElevatedButton(onPressed: _startQuiz, child: const Text("Start Quiz"))));
    }
    if (_currentQuestionIndex >= _questions.length) {
      final finalScore = (_score / _questions.length) * 100;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(progressProvider.notifier).recordQuizScore(widget.module.id, finalScore);
      });
      return Scaffold(body: Center(child: Text("Hoàn thành! Điểm: ${finalScore.toStringAsFixed(1)}%")));
    }
    
    final q = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text("Câu ${_currentQuestionIndex + 1}/${_questions.length}")),
      body: Column(
        children: [
          Text(q.questionText),
          ...q.options.asMap().entries.map((e) => ElevatedButton(
            onPressed: () {
              if (e.key == q.correctIndex) _score++;
              setState(() => _currentQuestionIndex++);
            },
            child: Text(e.value),
          )),
        ],
      ),
    );
  }
}
