// lib/features/quiz/services/quiz_generator.dart
// Quiz Generator Service — Source of Truth: Module IDs only
// Milestone 3 Refactor: Tách khỏi UI layer, enforce module boundary
// Nguyên tắc: Accuracy-First + Offline-First + Safety Guard

import 'dart:math';

import '../../../core/localization/content_catalog.dart';
import '../../../data/models/cetasika_model.dart';
import '../../../data/models/citta_model.dart';
import '../../../data/models/kamma_model.dart';
import '../../../data/models/paticca_model.dart';
import '../../../data/models/rupa_model.dart';
import '../../../data/models/study_module.dart';
import '../../../data/models/vithi_model.dart';
import '../../../data/repositories/vdp_repository.dart';
import '../../../l10n/l10n.dart';
import '../quiz_screen.dart' show QuizLevel, QuizQuestion, QuizQuestionType;

// ─── Constants ────────────────────────────────────────────────────────────────

/// Số item tối thiểu để tạo câu hỏi MCQ 4-option.
/// Cần ít nhất 4 item để có 1 đúng + 3 sai (distractor).
const _kMinItemsForMcq4 = 4;

/// Số item tối thiểu để tạo câu hỏi MCQ 3-option.
const _kMinItemsForMcq3 = 3;

/// Số câu hỏi tối đa mỗi bài quiz.
const _kMaxQuestions = 10;

// ─── Quiz Generator Service ───────────────────────────────────────────────────

/// Service sinh câu hỏi quiz theo nguyên tắc Source of Truth.
///
/// **QUAN TRỌNG — Module Boundary Rule:**
/// Mọi câu hỏi VÀ đáp án nhiễu (distractor) đều chỉ được lấy từ
/// [StudyModule.cittaIds] và [StudyModule.cetasikaIds].
/// Tuyệt đối KHÔNG dùng toàn bộ DB để tránh "knowledge leak".
///
/// **Safety Guard:**
/// - Module < 4 items → bỏ MCQ 4-option, dùng True/False thay thế.
/// - IDs rỗng hoặc không match DB → trả về [] (không fallback DB).
final class QuizGeneratorService {
  const QuizGeneratorService._();

  // ── Public API ─────────────────────────────────────────────────────────────

  /// Sinh danh sách câu hỏi cho [module] tại [level].
  ///
  /// Trả về `[]` nếu:
  /// - [module.cittaIds] và [module.cetasikaIds] đều rỗng.
  /// - Không tìm thấy item nào trong DB khớp với IDs của module.
  ///
  /// Caller nên xử lý list rỗng bằng cách hiển thị thông báo,
  /// KHÔNG được fallback về toàn bộ DB.
  static List<QuizQuestion> generate({
    required StudyModule module,
    required VdpDataState dataState,
    required QuizLevel level,
    required AppLocalizations l10n,
    required ContentCatalog contentCatalog,
    Random? random,
  }) {
    final rng = random ?? Random();
    final text = _QuizText(l10n, contentCatalog);

    final genericItems = _genericItemsForModule(
      module: module,
      dataState: dataState,
      text: text,
    );

    // ── Safety Guard: module không có bất kỳ item nào ──────────────────
    final hasIds = module.cittaIds.isNotEmpty || module.cetasikaIds.isNotEmpty;
    if (!hasIds && genericItems.isEmpty) {
      // Trả về rỗng, không fallback DB
      return const [];
    }

    // ── SOURCE OF TRUTH: Chỉ lấy items thuộc module này ───────────────
    // Lọc từ DB theo đúng ID list của module — không lấy thêm bất kỳ item nào khác
    final moduleCittas = _filterCittasByIds(
      allCittas: dataState.cittas,
      ids: module.cittaIds,
    );
    final moduleCetasikas = _filterCetasikasByIds(
      allCetasikas: dataState.cetasikas,
      ids: module.cetasikaIds,
    );

    // ── Safety Guard: Không tìm thấy trong DB ─────────────────────────
    if (moduleCittas.isEmpty &&
        moduleCetasikas.isEmpty &&
        genericItems.isEmpty) {
      // IDs có nhưng không match DB → trả về rỗng
      return const [];
    }

    // Tổng số item module có
    final totalItems =
        moduleCittas.length + moduleCetasikas.length + genericItems.length;

    // ── Safety Guard: Quyết định loại câu hỏi theo số lượng item ──────
    final canUseMcq4 = totalItems >= _kMinItemsForMcq4;
    final canUseMcq3 = totalItems >= _kMinItemsForMcq3;

    final questions = <QuizQuestion>[];

    // ── Sinh từng loại câu hỏi ─────────────────────────────────────────

    // Q-Type 1: Cetasika thuộc nhóm nào? (Beginner+)
    if (moduleCetasikas.isNotEmpty) {
      if (canUseMcq4) {
        questions.addAll(
          _generateCetasikaGroupMcq(
            moduleCetasikas: moduleCetasikas,
            rng: rng,
            maxCount: 5,
            text: text,
          ),
        );
      } else {
        // Safety Guard: < 4 items → dùng True/False thay MCQ
        questions.addAll(
          _generateCetasikaGroupTrueFalse(
            moduleCetasikas: moduleCetasikas,
            rng: rng,
            maxCount: 5,
            text: text,
          ),
        );
      }
    }

    // Q-Type 2: Citta có thọ gì? (Beginner+)
    if (moduleCittas.isNotEmpty) {
      if (canUseMcq3) {
        questions.addAll(
          _generateCittaVedanaMcq(
            moduleCittas: moduleCittas,
            rng: rng,
            maxCount: 5,
            text: text,
          ),
        );
      } else {
        // Safety Guard: < 3 items → True/False
        questions.addAll(
          _generateCittaVedanaTrueFalse(
            moduleCittas: moduleCittas,
            rng: rng,
            maxCount: 5,
            text: text,
          ),
        );
      }
    }

    // Q-Type 3: Conflict Detection (Intermediate+)
    // Distractor cũng chỉ lấy từ moduleCetasikas
    if (level != QuizLevel.beginner && moduleCetasikas.length >= 2) {
      questions.addAll(
        _generateConflictQuestions(
          moduleCetasikas: moduleCetasikas,
          rng: rng,
          maxCount: 3,
          text: text,
        ),
      );
    }

    // Q-Type 4: Citta thuộc cõi nào? (Advanced)
    // Distractor lấy từ moduleCittas
    if (level == QuizLevel.advanced && moduleCittas.isNotEmpty) {
      if (canUseMcq4) {
        questions.addAll(
          _generateCittaBhumiMcq(
            moduleCittas: moduleCittas,
            rng: rng,
            maxCount: 3,
            text: text,
          ),
        );
      } else {
        questions.addAll(
          _generateCittaBhumiTrueFalse(
            moduleCittas: moduleCittas,
            rng: rng,
            maxCount: 3,
            text: text,
          ),
        );
      }
    }

    // Q-Type 5: Generic module content for M6/M8/M9/M10.
    // Các câu hỏi vẫn lấy option trong chính module, không dùng toàn DB ngoài module.
    if (genericItems.isNotEmpty) {
      questions.addAll(
        _generateGenericContentMcq(
          items: genericItems,
          rng: rng,
          maxCount: _kMaxQuestions,
          text: text,
        ),
      );
    }

    // ── Shuffle + giới hạn ─────────────────────────────────────────────
    questions.shuffle(rng);
    return questions.length > _kMaxQuestions
        ? questions.sublist(0, _kMaxQuestions)
        : questions;
  }

  // ── Filter helpers (Source of Truth enforced) ─────────────────────────────

  /// Lọc cittas theo IDs của module — KHÔNG lấy thêm items ngoài list này.
  static List<CittaModel> _filterCittasByIds({
    required List<CittaModel> allCittas,
    required List<String> ids,
  }) {
    if (ids.isEmpty) return const [];
    final idSet = ids.toSet();
    return allCittas.where((c) => idSet.contains(c.id)).toList();
  }

  /// Lọc cetasikas theo IDs của module — KHÔNG lấy thêm items ngoài list này.
  static List<CetasikaModel> _filterCetasikasByIds({
    required List<CetasikaModel> allCetasikas,
    required List<String> ids,
  }) {
    if (ids.isEmpty) return const [];
    final idSet = ids.toSet();
    return allCetasikas.where((c) => idSet.contains(c.id)).toList();
  }

  /// Nội dung generic cho các module hiện không dùng cittaIds/cetasikaIds.
  /// Vẫn giữ boundary theo module: M6 chỉ lấy kammas, M8 chỉ lấy paticcas, ...
  static List<_GenericQuizItem> _genericItemsForModule({
    required StudyModule module,
    required VdpDataState dataState,
    required _QuizText text,
  }) {
    switch (module.id) {
      case 'M6_NGHIEP':
        final items = List<KammaModel>.from(dataState.kammas)
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
        return items
            .map((item) => _GenericQuizItem(
                  id: item.id,
                  name: text.kammaName(item),
                  pali: item.namePali,
                  description: text.kammaDescription(item),
                ))
            .toList(growable: false);
      case 'M8_NHAN_DUYEN':
        final items = List<PaticcaModel>.from(dataState.paticcas)
          ..sort((a, b) => a.order.compareTo(b.order));
        return items
            .map((item) => _GenericQuizItem(
                  id: item.id,
                  name: text.paticcaName(item),
                  pali: item.namePali,
                  description: text.paticcaDescription(item),
                ))
            .toList(growable: false);
      case 'M9_SAC_PHAP':
        final items = List<RupaModel>.from(dataState.rupas)
          ..sort((a, b) => a.traditionalOrder.compareTo(b.traditionalOrder));
        return items
            .map((item) => _GenericQuizItem(
                  id: item.id,
                  name: text.rupaName(item),
                  pali: item.namePali,
                  description: text.rupaDescription(item),
                ))
            .toList(growable: false);
      case 'M10_LO_TRINH':
        final items = List<VithiModel>.from(dataState.vithis)
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
        return items
            .map((item) => _GenericQuizItem(
                  id: item.id,
                  name: text.vithiName(item),
                  pali: item.namePali,
                  description: text.vithiDescription(item),
                ))
            .toList(growable: false);
      default:
        return const [];
    }
  }

  // ── Q-Type 1a: Cetasika Group — MCQ 4 options ─────────────────────────────

  static List<QuizQuestion> _generateCetasikaGroupMcq({
    required List<CetasikaModel> moduleCetasikas,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    final questions = <QuizQuestion>[];

    // Pool câu hỏi = chính moduleCetasikas (Source of Truth)
    final pool = List<CetasikaModel>.from(moduleCetasikas)..shuffle(rng);

    // Lấy tất cả nhóm có trong MODULE (không phải toàn DB)
    final moduleGroups = moduleCetasikas.map((c) => c.group).toSet().toList();

    for (final cs in pool.take(maxCount)) {
      final correctLabel = text.groupName(cs.group);

      // Distractor = nhóm khác CÓ TRONG MODULE — không dùng nhóm ngoài module
      // Nếu module chỉ có 1 nhóm, bổ sung nhóm cố định từ Pāli canon
      final wrongGroups = moduleGroups.where((g) => g != cs.group).toList();

      // Nếu không đủ 3 wrong options từ module → bổ sung từ canonical list
      // nhưng vẫn đảm bảo correctLabel là của module item
      final allGroups = CetasikaGroup.values;
      final fallbackGroups =
          allGroups.where((g) => g != cs.group && !wrongGroups.contains(g));

      final distractors = [
        ...wrongGroups.map(text.groupName),
        ...fallbackGroups.map(text.groupName),
      ]..shuffle(rng);

      // Cần ít nhất 3 distractors cho 4-option MCQ
      if (distractors.length < 3) continue;

      final opts = <String>[
        correctLabel,
        distractors[0],
        distractors[1],
        distractors[2],
      ]..shuffle(rng);

      questions.add(QuizQuestion(
        id: 'q_group_${cs.id}',
        questionText: text.l10n.quizCetasikaGroupQuestion(
          text.cetasikaName(cs),
          cs.namePali,
        ),
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.cetasikaGroup,
        explanation: text.l10n.quizCetasikaGroupExplanation(
          text.cetasikaName(cs),
          text.groupName(cs.group),
          text.cetasikaDescription(cs),
        ),
      ));
    }

    return questions;
  }

  // ── Q-Type 1b: Cetasika Group — True/False (Safety Guard) ─────────────────

  static List<QuizQuestion> _generateCetasikaGroupTrueFalse({
    required List<CetasikaModel> moduleCetasikas,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CetasikaModel>.from(moduleCetasikas)..shuffle(rng);

    for (final cs in pool.take(maxCount)) {
      // 50/50 câu đúng / câu sai
      final makeCorrect = rng.nextBool();
      final String claimedGroup;
      final bool isTrue;

      if (makeCorrect) {
        claimedGroup = text.groupName(cs.group);
        isTrue = true;
      } else {
        // Chọn nhóm sai từ canonical list
        final otherGroups = CetasikaGroup.values
            .where((g) => g != cs.group)
            .toList()
          ..shuffle(rng);
        if (otherGroups.isEmpty) continue;
        claimedGroup = text.groupName(otherGroups.first);
        isTrue = false;
      }

      final opts = [text.l10n.trueLabel, text.l10n.falseLabel];

      questions.add(QuizQuestion(
        id: 'q_tf_group_${cs.id}',
        questionText: text.l10n.quizCetasikaClaim(
          text.cetasikaName(cs),
          cs.namePali,
          claimedGroup,
        ),
        options: opts,
        correctIndex: isTrue ? 0 : 1, // 0=Đúng, 1=Sai
        type: QuizQuestionType.cetasikaGroup,
        explanation: text.l10n.quizCetasikaGroupExplanation(
          text.cetasikaName(cs),
          text.groupName(cs.group),
          text.cetasikaDescription(cs),
        ),
      ));
    }

    return questions;
  }

  // ── Q-Type 2a: Citta Vedana — MCQ 3 options ───────────────────────────────

  static List<QuizQuestion> _generateCittaVedanaMcq({
    required List<CittaModel> moduleCittas,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    // Lấy các vedana có trong module
    final moduleVedanas = moduleCittas.map((c) => c.vedana).toSet().toList();

    for (final citta in pool.take(maxCount)) {
      final correctLabel = text.vedanaName(citta.vedana);

      // Distractor từ vedana có trong module trước
      final wrongVedanas =
          moduleVedanas.where((v) => v != citta.vedana).toList();
      // Bổ sung từ canonical nếu cần
      final allVedanas = Vedana.values;
      final fallbackVedanas = allVedanas
          .where((v) => v != citta.vedana && !wrongVedanas.contains(v));

      final distractors = [
        ...wrongVedanas.map(text.vedanaName),
        ...fallbackVedanas.map(text.vedanaName),
      ]..shuffle(rng);

      if (distractors.isEmpty) continue;

      // 3-option: 1 đúng + tối đa 2 sai
      final opts = <String>[
        correctLabel,
        distractors[0],
        if (distractors.length >= 2) distractors[1],
      ]..shuffle(rng);

      questions.add(QuizQuestion(
        id: 'q_vedana_${citta.id}',
        questionText: text.l10n.quizCittaFeelingQuestion(
          text.cittaName(citta),
        ),
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.cittaVedana,
        explanation: text.l10n.quizCittaFeelingExplanation(
          text.cittaName(citta),
          text.vedanaName(citta.vedana),
        ),
      ));
    }

    return questions;
  }

  // ── Q-Type 2b: Citta Vedana — True/False (Safety Guard) ───────────────────

  static List<QuizQuestion> _generateCittaVedanaTrueFalse({
    required List<CittaModel> moduleCittas,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    for (final citta in pool.take(maxCount)) {
      final makeCorrect = rng.nextBool();
      final String claimedVedana;
      final bool isTrue;

      if (makeCorrect) {
        claimedVedana = text.vedanaName(citta.vedana);
        isTrue = true;
      } else {
        final others = Vedana.values.where((v) => v != citta.vedana).toList()
          ..shuffle(rng);
        if (others.isEmpty) continue;
        claimedVedana = text.vedanaName(others.first);
        isTrue = false;
      }

      final opts = [text.l10n.trueLabel, text.l10n.falseLabel];

      questions.add(QuizQuestion(
        id: 'q_tf_vedana_${citta.id}',
        questionText: text.l10n.quizCittaFeelingClaim(
          text.cittaName(citta),
          claimedVedana,
        ),
        options: opts,
        correctIndex: isTrue ? 0 : 1,
        type: QuizQuestionType.cittaVedana,
        explanation: text.l10n.quizCittaFeelingExplanation(
          text.cittaName(citta),
          text.vedanaName(citta.vedana),
        ),
      ));
    }

    return questions;
  }

  // ── Q-Type 3: Conflict Detection (Intermediate+) ─────────────────────────

  /// Distractor: chỉ dùng cetasikas trong module để tạo cặp conflict.
  static List<QuizQuestion> _generateConflictQuestions({
    required List<CetasikaModel> moduleCetasikas,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    final questions = <QuizQuestion>[];

    // Chỉ xét conflict trong phạm vi module
    final moduleIdSet = moduleCetasikas.map((c) => c.id).toSet();

    // Lọc những cetasika có conflict VÀ conflict partner cũng nằm trong module
    final conflictPool = moduleCetasikas.where((c) {
      return c.conflictRules.any(
        (rule) => rule.conflictingIds.any((id) => moduleIdSet.contains(id)),
      );
    }).toList()
      ..shuffle(rng);

    for (final cs in conflictPool.take(maxCount)) {
      // Tìm rule có conflict partner trong module
      ConflictRule? validRule;
      String? conflictPartnerId;

      for (final rule in cs.conflictRules) {
        final partnerInModule = rule.conflictingIds
            .where((id) => moduleIdSet.contains(id))
            .toList();
        if (partnerInModule.isNotEmpty) {
          validRule = rule;
          partnerInModule.shuffle(rng);
          conflictPartnerId = partnerInModule.first;
          break;
        }
      }

      if (validRule == null || conflictPartnerId == null) continue;

      final conflictCs =
          moduleCetasikas.where((c) => c.id == conflictPartnerId).firstOrNull;
      if (conflictCs == null) continue;

      final correctLabel = text.l10n.conflictNo;
      final opts = <String>[
        correctLabel,
        text.l10n.conflictAlwaysYes,
        text.l10n.conflictSometimesYes,
      ]..shuffle(rng);

      questions.add(QuizQuestion(
        id: 'q_conflict_${cs.id}_$conflictPartnerId',
        questionText: text.l10n.quizConflictQuestion(
          text.cetasikaName(cs),
          text.cetasikaName(conflictCs),
        ),
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.conflictDetect,
        explanation: text.conflictExplanation(validRule),
      ));
    }

    return questions;
  }

  // ── Q-Type 4a: Citta Bhumi — MCQ 4 options (Advanced) ────────────────────

  /// Distractor = bhumiGroup khác trong module.
  static List<QuizQuestion> _generateCittaBhumiMcq({
    required List<CittaModel> moduleCittas,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    final moduleBhumis = moduleCittas.map((c) => c.bhumiGroup).toSet().toList();

    for (final citta in pool.take(maxCount)) {
      final correctLabel = text.bhumiName(citta.bhumiGroup);

      final wrongBhumis =
          moduleBhumis.where((b) => b != citta.bhumiGroup).toList();
      // Bổ sung từ canonical nếu cần
      final allBhumis = BhumiGroup.values;
      final fallbackBhumis = allBhumis
          .where((b) => b != citta.bhumiGroup && !wrongBhumis.contains(b));

      final distractors = [
        ...wrongBhumis.map(text.bhumiName),
        ...fallbackBhumis.map(text.bhumiName),
      ]..shuffle(rng);

      if (distractors.length < 3) continue;

      final opts = <String>[
        correctLabel,
        distractors[0],
        distractors[1],
        distractors[2],
      ]..shuffle(rng);

      questions.add(QuizQuestion(
        id: 'q_bhumi_${citta.id}',
        questionText: text.l10n.quizSphereQuestion(text.cittaName(citta)),
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.cittaBhumi,
        explanation: text.l10n.quizSphereExplanation(
          text.cittaName(citta),
          text.bhumiName(citta.bhumiGroup),
        ),
      ));
    }

    return questions;
  }

  // ── Q-Type 4b: Citta Bhumi — True/False (Safety Guard) ───────────────────

  static List<QuizQuestion> _generateCittaBhumiTrueFalse({
    required List<CittaModel> moduleCittas,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    for (final citta in pool.take(maxCount)) {
      final makeCorrect = rng.nextBool();
      final String claimedBhumi;
      final bool isTrue;

      if (makeCorrect) {
        claimedBhumi = text.bhumiName(citta.bhumiGroup);
        isTrue = true;
      } else {
        final others = BhumiGroup.values
            .where((b) => b != citta.bhumiGroup)
            .toList()
          ..shuffle(rng);
        if (others.isEmpty) continue;
        claimedBhumi = text.bhumiName(others.first);
        isTrue = false;
      }

      final opts = [text.l10n.trueLabel, text.l10n.falseLabel];

      questions.add(QuizQuestion(
        id: 'q_tf_bhumi_${citta.id}',
        questionText: text.l10n.quizSphereClaim(
          text.cittaName(citta),
          claimedBhumi,
        ),
        options: opts,
        correctIndex: isTrue ? 0 : 1,
        type: QuizQuestionType.cittaBhumi,
        explanation: text.l10n.quizSphereExplanation(
          text.cittaName(citta),
          text.bhumiName(citta.bhumiGroup),
        ),
      ));
    }

    return questions;
  }

  // ── Q-Type 5: Generic Content — MCQ 4 options ────────────────────────────

  static List<QuizQuestion> _generateGenericContentMcq({
    required List<_GenericQuizItem> items,
    required Random rng,
    required int maxCount,
    required _QuizText text,
  }) {
    if (items.length < _kMinItemsForMcq4) return const [];

    final questions = <QuizQuestion>[];
    final pool = List<_GenericQuizItem>.from(items)..shuffle(rng);

    for (final item in pool.take(maxCount)) {
      final distractors = items
          .where((candidate) => candidate.id != item.id)
          .map((candidate) => candidate.name)
          .toSet()
          .toList()
        ..shuffle(rng);

      if (distractors.length < 3) continue;

      final opts = <String>[
        item.name,
        distractors[0],
        distractors[1],
        distractors[2],
      ]..shuffle(rng);

      questions.add(QuizQuestion(
        id: 'q_content_${item.id}',
        questionText: text.genericContentQuestion(item.description),
        options: opts,
        correctIndex: opts.indexOf(item.name),
        type: QuizQuestionType.moduleContent,
        explanation: text.genericContentExplanation(item),
      ));
    }

    return questions;
  }
}

class _GenericQuizItem {
  final String id;
  final String name;
  final String pali;
  final String description;

  const _GenericQuizItem({
    required this.id,
    required this.name,
    required this.pali,
    required this.description,
  });
}


class _QuizText {
  final AppLocalizations l10n;
  final ContentCatalog catalog;

  const _QuizText(this.l10n, this.catalog);

  String cittaName(CittaModel citta) => catalog.text(
        'cittas',
        citta.id,
        'name',
        citta.nameVietnamese,
      );

  String cetasikaName(CetasikaModel cetasika) => catalog.text(
        'cetasikas',
        cetasika.id,
        'name',
        cetasika.nameVietnamese,
      );

  String cetasikaDescription(CetasikaModel cetasika) => catalog.text(
        'cetasikas',
        cetasika.id,
        'description',
        cetasika.descriptionVi,
      );

  String kammaName(KammaModel item) => catalog.text(
        'kammas',
        item.id,
        'name',
        item.nameVietnamese,
      );

  String kammaDescription(KammaModel item) => catalog.text(
        'kammas',
        item.id,
        'description',
        item.descriptionVi,
      );

  String paticcaName(PaticcaModel item) => catalog.text(
        'paticcas',
        item.id,
        'name',
        item.nameVietnamese,
      );

  String paticcaDescription(PaticcaModel item) => catalog.text(
        'paticcas',
        item.id,
        'description',
        item.descriptionVi,
      );

  String rupaName(RupaModel item) => catalog.text(
        'rupas',
        item.id,
        'name',
        item.nameVietnamese,
      );

  String rupaDescription(RupaModel item) => catalog.text(
        'rupas',
        item.id,
        'description',
        item.descriptionVi,
      );

  String vithiName(VithiModel item) => catalog.text(
        'vithis',
        item.id,
        'name',
        item.nameVietnamese,
      );

  String vithiDescription(VithiModel item) => catalog.text(
        'vithis',
        item.id,
        'description',
        item.descriptionVi,
      );

  String genericContentQuestion(String description) {
    if (catalog.locale == 'en') {
      return 'Which item matches this description?\n\n$description';
    }
    return 'Mô tả sau ứng với mục nào?\n\n$description';
  }

  String genericContentExplanation(_GenericQuizItem item) {
    final prefix = item.pali.isEmpty ? item.name : '${item.name} (${item.pali})';
    return '$prefix: ${item.description}';
  }

  String groupName(CetasikaGroup group) => switch (group) {
        CetasikaGroup.sabbacittasadharana => l10n.universalCetasikas,
        CetasikaGroup.pakinnaka => l10n.occasionalCetasikas,
        CetasikaGroup.akusala => l10n.unwholesomeCetasikas,
        CetasikaGroup.sobhana => l10n.beautifulCetasikas,
      };

  String vedanaName(Vedana feeling) => switch (feeling) {
        Vedana.pleasant => l10n.pleasantFeeling,
        Vedana.unpleasant => l10n.unpleasantFeeling,
        Vedana.neutral => l10n.neutralFeeling,
        Vedana.joy => l10n.joyfulFeeling,
      };

  String bhumiName(BhumiGroup sphere) => switch (sphere) {
        BhumiGroup.akusala => l10n.unwholesome,
        BhumiGroup.ahetuka => l10n.rootless,
        BhumiGroup.sobhanaKamavacara => l10n.senseSphereBeautiful,
        BhumiGroup.rupavacara => l10n.formSphere,
        BhumiGroup.arupavacara => l10n.formlessSphere,
        BhumiGroup.lokuttara => l10n.supramundane,
      };

  String conflictExplanation(ConflictRule rule) {
    if (catalog.locale == 'en') {
      return rule.explanationPali ?? l10n.doctrinalConflicts;
    }
    return rule.explanation;
  }
}
