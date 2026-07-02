// lib/features/quiz/quiz_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/study_module.dart';
import '../../data/models/citta_model.dart';
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
    });
  }

  List<QuizQuestion> _generateQuestions(VdpDataState data) {
    final questions = <QuizQuestion>[];
    final usedIds = <String>{};

    final moduleCetasikas = data.cetasikas.where((c) => widget.module.cetasikaIds.contains(c.id)).toList();
    final moduleCittas = data.cittas.where((c) => widget.module.cittaIds.contains(c.id)).toList();

    // 1. Cetasika Group Questions
    for (final cs in moduleCetasikas.take(5)) {
      final id = 'q_group_${cs.id}';
      if (usedIds.contains(id)) continue;
      final correct = cs.group.toString(); // Simplified getter
      final opts = [correct, 'Nhóm A', 'Nhóm B', 'Nhóm C']..shuffle(_rng);
      questions.add(QuizQuestion(id: id, questionText: 'Tâm sở ${cs.namePali} thuộc nhóm nào?', options: opts, correctIndex: opts.indexOf(correct), type: QuizQuestionType.cetasikaGroup, explanation: '...');
      usedIds.add(id);
    }

    // 2. Association Questions
    if (moduleCittas.isNotEmpty && moduleCetasikas.isNotEmpty) {
      for (final citta in moduleCittas.take(3)) {
        for (final cs in moduleCetasikas.take(2)) {
          final id = 'q_assoc_${citta.id}_${cs.id}';
          if (usedIds.contains(id)) continue;
          final isAssoc = citta.cetasikaAssociations.contains(cs.id);
          final correct = isAssoc ? 'Luôn có' : 'Không có';
          final opts = ['Luôn có', 'Đôi khi có', 'Không có'];
          questions.add(QuizQuestion(id: id, questionText: 'Tâm ${citta.namePali} có ${cs.namePali} không?', options: opts, correctIndex: opts.indexOf(correct), type: QuizQuestionType.associationType, explanation: '...'));
          usedIds.add(id);
        }
      }
    }
    return questions;
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: _started ? Text("Quiz") : ElevatedButton(onPressed: _startQuiz, child: Text("Start"))));
}
