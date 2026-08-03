// lib/features/quiz/services/quiz_generator.dart
// Quiz Generator Service — Source of Truth: Module IDs only
// Milestone 3 Refactor: Tách khỏi UI layer, enforce module boundary
// Nguyên tắc: Accuracy-First + Offline-First + Safety Guard

import 'dart:math';

import '../../../data/models/cetasika_model.dart';
import '../../../data/models/citta_model.dart';
import '../../../data/models/kamma_model.dart';
import '../../../data/models/rupa_model.dart';
import '../../../data/models/study_module.dart';
import '../../../data/repositories/vdp_repository.dart';
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
    Random? random,
  }) {
    final rng = random ?? Random();

    // ── Safety Guard: IDs rỗng ─────────────────────────────────────────
    final hasIds = module.cittaIds.isNotEmpty ||
        module.cetasikaIds.isNotEmpty ||
        module.kammaIds.isNotEmpty ||
        module.paticcaIds.isNotEmpty ||
        module.rupaIds.isNotEmpty ||
        module.vithiIds.isNotEmpty;
    if (!hasIds) {
      return const [];
    }

    // ── SOURCE OF TRUTH: Chỉ lấy items thuộc module này ───────────────
    final moduleCittas = _filterCittasByIds(
      allCittas: dataState.cittas,
      ids: module.cittaIds,
    );
    final moduleCetasikas = _filterCetasikasByIds(
      allCetasikas: dataState.cetasikas,
      ids: module.cetasikaIds,
    );

    // Nếu module chỉ có Kamma/Rupa/Vithi/Paticca mà không có citta/cetasika,
    // vẫn cho phép sinh quiz dạng generic từ citta đã bổ sung,
    // hoặc fallback tạo câu hỏi về chính loại đó nếu có.
    if (moduleCittas.isEmpty && moduleCetasikas.isEmpty) {
      // Trường hợp module có kammaIds/rupaIds... nhưng chưa có citta → thử sinh câu hỏi generic
      // Nếu dataState có rupa/paticca... thì vẫn trả về câu hỏi mặc định để tránh lỗi "chưa đủ dữ liệu"
      // Ở đây ta cho phép trả về câu hỏi True/False placeholder từ nội dung module khác nếu cần
      // Để đơn giản, nếu có kamma/rupa/paticca/vithi thì không coi là rỗng — tạo 1 câu hỏi mẫu
      // Caller sẽ thấy có dữ liệu, UI học vẫn hiển thị đầy đủ.

      // Nếu hoàn toàn không có citta/cetasika nào match DB, trả về rỗng để báo lỗi thực sự
      // Nhưng nếu module có kammaIds etc thì vẫn cho phép quiz rỗng? Ta quyết định:
      // Nếu module có bất kỳ kamma/paticca/rupa/vithi IDs nào → không return [] ngay, để tiếp tục
      // logic bên dưới sẽ thử sinh từ citta/cetasika nếu có, nếu không sẽ fallback sang câu hỏi generic
      if (module.kammaIds.isEmpty &&
          module.paticcaIds.isEmpty &&
          module.rupaIds.isEmpty &&
          module.vithiIds.isEmpty) {
        return const [];
      }
      // Nếu chỉ có kamma/rupa... mà citta rỗng, ta sẽ sinh câu hỏi generic ở cuối hàm
    }

    // Tổng số item module có
    final totalItems = moduleCittas.length + moduleCetasikas.length;

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
          ),
        );
      } else {
        // Safety Guard: < 4 items → dùng True/False thay MCQ
        questions.addAll(
          _generateCetasikaGroupTrueFalse(
            moduleCetasikas: moduleCetasikas,
            rng: rng,
            maxCount: 5,
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
          ),
        );
      } else {
        // Safety Guard: < 3 items → True/False
        questions.addAll(
          _generateCittaVedanaTrueFalse(
            moduleCittas: moduleCittas,
            rng: rng,
            maxCount: 5,
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
          ),
        );
      } else {
        questions.addAll(
          _generateCittaBhumiTrueFalse(
            moduleCittas: moduleCittas,
            rng: rng,
            maxCount: 3,
          ),
        );
      }
    }

    // ── Fallback: Nếu vẫn chưa có câu hỏi nhưng module có kamma/rupa/paticca/vithi
    // thì tạo câu hỏi True/False generic từ các loại đó để tránh báo "chưa đủ dữ liệu"
    if (questions.isEmpty) {
      // Kamma fallback
      if (module.kammaIds.isNotEmpty) {
        final kammaPool = dataState.kammas.where((k) => module.kammaIds.contains(k.id)).toList()..shuffle(rng);
        for (final k in kammaPool.take(5)) {
          final opts = ['Đúng', 'Sai'];
          // Hỏi đơn giản về Hiện Báo để có đáp án rõ ràng
          final isHienBao = k.byTime == KammaByTime.ditthadhammavedaniya;
          questions.add(QuizQuestion(
            id: 'q_km_${k.id}',
            questionText: 'Nghiệp "${k.nameVietnamese}" là Hiện Báo Nghiệp (cho quả ngay kiếp này). Đúng hay Sai?',
            options: opts,
            correctIndex: isHienBao ? 0 : 1,
            type: QuizQuestionType.cetasikaGroup,
            explanation: '${k.nameVietnamese}: ${k.descriptionVi}',
          ));
        }
      }
      // Paticca fallback
      if (questions.isEmpty && module.paticcaIds.isNotEmpty) {
        final paticcaPool = dataState.paticcas.where((p) => module.paticcaIds.contains(p.id)).toList()..shuffle(rng);
        for (final p in paticcaPool.take(5)) {
          final opts = ['Đúng', 'Sai'];
          questions.add(QuizQuestion(
            id: 'q_pd_${p.id}',
            questionText: '"${p.nameVietnamese}" là chi số ${p.order} trong 12 Nhân Duyên. Đúng hay Sai?',
            options: opts,
            correctIndex: 0,
            type: QuizQuestionType.cetasikaGroup,
            explanation: p.descriptionVi,
          ));
        }
      }
      // Rupa fallback
      if (questions.isEmpty && module.rupaIds.isNotEmpty) {
        final rupaPool = dataState.rupas.where((r) => module.rupaIds.contains(r.id)).toList()..shuffle(rng);
        for (final r in rupaPool.take(5)) {
          final opts = ['Đúng', 'Sai'];
          final isTứĐại = r.type == RupaType.mahaBhuta;
          questions.add(QuizQuestion(
            id: 'q_rp_${r.id}',
            questionText: 'Sắc "${r.nameVietnamese}" (${r.namePali}) thuộc Tứ Đại. Đúng hay Sai?',
            options: opts,
            correctIndex: isTứĐại ? 0 : 1,
            type: QuizQuestionType.cetasikaGroup,
            explanation: r.descriptionVi,
          ));
        }
      }
      // Vithi fallback
      if (questions.isEmpty && module.vithiIds.isNotEmpty) {
        final vithiPool = dataState.vithis.where((v) => module.vithiIds.contains(v.id)).toList()..shuffle(rng);
        for (final v in vithiPool.take(3)) {
          final opts = ['Đúng', 'Sai'];
          questions.add(QuizQuestion(
            id: 'q_vt_${v.id}',
            questionText: 'Lộ "${v.nameVietnamese}" có ${v.totalSteps} sát-na. Đúng hay Sai?',
            options: opts,
            correctIndex: 0,
            type: QuizQuestionType.cittaBhumi,
            explanation: v.descriptionVi,
          ));
        }
      }
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

  // ── Q-Type 1a: Cetasika Group — MCQ 4 options ─────────────────────────────

  static List<QuizQuestion> _generateCetasikaGroupMcq({
    required List<CetasikaModel> moduleCetasikas,
    required Random rng,
    required int maxCount,
  }) {
    final questions = <QuizQuestion>[];

    // Pool câu hỏi = chính moduleCetasikas (Source of Truth)
    final pool = List<CetasikaModel>.from(moduleCetasikas)..shuffle(rng);

    // Lấy tất cả nhóm có trong MODULE (không phải toàn DB)
    final moduleGroups = moduleCetasikas.map((c) => c.group).toSet().toList();

    for (final cs in pool.take(maxCount)) {
      final correctLabel = _getGroupName(cs.group);

      // Distractor = nhóm khác CÓ TRONG MODULE — không dùng nhóm ngoài module
      // Nếu module chỉ có 1 nhóm, bổ sung nhóm cố định từ Pāli canon
      final wrongGroups = moduleGroups.where((g) => g != cs.group).toList();

      // Nếu không đủ 3 wrong options từ module → bổ sung từ canonical list
      // nhưng vẫn đảm bảo correctLabel là của module item
      final allGroups = CetasikaGroup.values;
      final fallbackGroups =
          allGroups.where((g) => g != cs.group && !wrongGroups.contains(g));

      final distractors = [
        ...wrongGroups.map(_getGroupName),
        ...fallbackGroups.map(_getGroupName),
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
        questionText:
            'Tâm Sở "${cs.nameVietnamese}" (${cs.namePali}) thuộc nhóm nào?',
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.cetasikaGroup,
        explanation:
            '"${cs.nameVietnamese}" thuộc ${_getGroupName(cs.group)}.\n'
            '${cs.descriptionVi}',
      ));
    }

    return questions;
  }

  // ── Q-Type 1b: Cetasika Group — True/False (Safety Guard) ─────────────────

  static List<QuizQuestion> _generateCetasikaGroupTrueFalse({
    required List<CetasikaModel> moduleCetasikas,
    required Random rng,
    required int maxCount,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CetasikaModel>.from(moduleCetasikas)..shuffle(rng);

    for (final cs in pool.take(maxCount)) {
      // 50/50 câu đúng / câu sai
      final makeCorrect = rng.nextBool();
      final String claimedGroup;
      final bool isTrue;

      if (makeCorrect) {
        claimedGroup = _getGroupName(cs.group);
        isTrue = true;
      } else {
        // Chọn nhóm sai từ canonical list
        final otherGroups = CetasikaGroup.values
            .where((g) => g != cs.group)
            .toList()
          ..shuffle(rng);
        if (otherGroups.isEmpty) continue;
        claimedGroup = _getGroupName(otherGroups.first);
        isTrue = false;
      }

      final opts = ['Đúng', 'Sai'];

      questions.add(QuizQuestion(
        id: 'q_tf_group_${cs.id}',
        questionText:
            '"${cs.nameVietnamese}" (${cs.namePali}) thuộc $claimedGroup. '
            'Đúng hay Sai?',
        options: opts,
        correctIndex: isTrue ? 0 : 1, // 0=Đúng, 1=Sai
        type: QuizQuestionType.cetasikaGroup,
        explanation: '"${cs.nameVietnamese}" thuộc '
            '${_getGroupName(cs.group)}.',
      ));
    }

    return questions;
  }

  // ── Q-Type 2a: Citta Vedana — MCQ 3 options ───────────────────────────────

  static List<QuizQuestion> _generateCittaVedanaMcq({
    required List<CittaModel> moduleCittas,
    required Random rng,
    required int maxCount,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    // Lấy các vedana có trong module
    final moduleVedanas = moduleCittas.map((c) => c.vedana).toSet().toList();

    for (final citta in pool.take(maxCount)) {
      final correctLabel = _getVedanaName(citta.vedana);

      // Distractor từ vedana có trong module trước
      final wrongVedanas =
          moduleVedanas.where((v) => v != citta.vedana).toList();
      // Bổ sung từ canonical nếu cần
      final allVedanas = Vedana.values;
      final fallbackVedanas = allVedanas
          .where((v) => v != citta.vedana && !wrongVedanas.contains(v));

      final distractors = [
        ...wrongVedanas.map(_getVedanaName),
        ...fallbackVedanas.map(_getVedanaName),
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
        questionText: 'Tâm "${citta.nameVietnamese}" có thọ gì?',
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.cittaVedana,
        explanation:
            '"${citta.nameVietnamese}" có ${_getVedanaName(citta.vedana)}.',
      ));
    }

    return questions;
  }

  // ── Q-Type 2b: Citta Vedana — True/False (Safety Guard) ───────────────────

  static List<QuizQuestion> _generateCittaVedanaTrueFalse({
    required List<CittaModel> moduleCittas,
    required Random rng,
    required int maxCount,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    for (final citta in pool.take(maxCount)) {
      final makeCorrect = rng.nextBool();
      final String claimedVedana;
      final bool isTrue;

      if (makeCorrect) {
        claimedVedana = _getVedanaName(citta.vedana);
        isTrue = true;
      } else {
        final others = Vedana.values.where((v) => v != citta.vedana).toList()
          ..shuffle(rng);
        if (others.isEmpty) continue;
        claimedVedana = _getVedanaName(others.first);
        isTrue = false;
      }

      final opts = ['Đúng', 'Sai'];

      questions.add(QuizQuestion(
        id: 'q_tf_vedana_${citta.id}',
        questionText:
            'Tâm "${citta.nameVietnamese}" có $claimedVedana. Đúng hay Sai?',
        options: opts,
        correctIndex: isTrue ? 0 : 1,
        type: QuizQuestionType.cittaVedana,
        explanation:
            '"${citta.nameVietnamese}" có ${_getVedanaName(citta.vedana)}.',
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

      const correctLabel = 'Không — chúng xung đột nhau';
      final opts = <String>[
        correctLabel,
        'Có — luôn xuất hiện cùng nhau',
        'Có — đôi khi cùng xuất hiện',
      ]..shuffle(rng);

      questions.add(QuizQuestion(
        id: 'q_conflict_${cs.id}_$conflictPartnerId',
        questionText: '"${cs.nameVietnamese}" và '
            '"${conflictCs.nameVietnamese}" có thể cùng xuất hiện '
            'trong một tâm không?',
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.conflictDetect,
        explanation: validRule.explanation,
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
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    final moduleBhumis = moduleCittas.map((c) => c.bhumiGroup).toSet().toList();

    for (final citta in pool.take(maxCount)) {
      final correctLabel = _getBhumiName(citta.bhumiGroup);

      final wrongBhumis =
          moduleBhumis.where((b) => b != citta.bhumiGroup).toList();
      // Bổ sung từ canonical nếu cần
      final allBhumis = BhumiGroup.values;
      final fallbackBhumis = allBhumis
          .where((b) => b != citta.bhumiGroup && !wrongBhumis.contains(b));

      final distractors = [
        ...wrongBhumis.map(_getBhumiName),
        ...fallbackBhumis.map(_getBhumiName),
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
        questionText: 'Tâm "${citta.nameVietnamese}" thuộc cõi giới nào?',
        options: opts,
        correctIndex: opts.indexOf(correctLabel),
        type: QuizQuestionType.cittaBhumi,
        explanation:
            '"${citta.nameVietnamese}" thuộc ${_getBhumiName(citta.bhumiGroup)}.',
      ));
    }

    return questions;
  }

  // ── Q-Type 4b: Citta Bhumi — True/False (Safety Guard) ───────────────────

  static List<QuizQuestion> _generateCittaBhumiTrueFalse({
    required List<CittaModel> moduleCittas,
    required Random rng,
    required int maxCount,
  }) {
    final questions = <QuizQuestion>[];
    final pool = List<CittaModel>.from(moduleCittas)..shuffle(rng);

    for (final citta in pool.take(maxCount)) {
      final makeCorrect = rng.nextBool();
      final String claimedBhumi;
      final bool isTrue;

      if (makeCorrect) {
        claimedBhumi = _getBhumiName(citta.bhumiGroup);
        isTrue = true;
      } else {
        final others = BhumiGroup.values
            .where((b) => b != citta.bhumiGroup)
            .toList()
          ..shuffle(rng);
        if (others.isEmpty) continue;
        claimedBhumi = _getBhumiName(others.first);
        isTrue = false;
      }

      final opts = ['Đúng', 'Sai'];

      questions.add(QuizQuestion(
        id: 'q_tf_bhumi_${citta.id}',
        questionText:
            'Tâm "${citta.nameVietnamese}" thuộc $claimedBhumi. Đúng hay Sai?',
        options: opts,
        correctIndex: isTrue ? 0 : 1,
        type: QuizQuestionType.cittaBhumi,
        explanation:
            '"${citta.nameVietnamese}" thuộc ${_getBhumiName(citta.bhumiGroup)}.',
      ));
    }

    return questions;
  }

  // ── Label Helpers (pure, no side-effects) ─────────────────────────────────

  static String _getGroupName(CetasikaGroup g) => switch (g) {
        CetasikaGroup.sabbacittasadharana =>
          '7 Biến Hành (Sabbacittasādhāraṇa)',
        CetasikaGroup.pakinnaka => '6 Biệt Cảnh (Pakiṇṇaka)',
        CetasikaGroup.akusala => '14 Bất Thiện (Akusala)',
        CetasikaGroup.sobhana => '25 Tịnh Hảo (Sobhana)',
      };

  static String _getVedanaName(Vedana v) => switch (v) {
        Vedana.pleasant => 'Lạc thọ (Sukha)',
        Vedana.unpleasant => 'Khổ thọ (Dukkha)',
        Vedana.neutral => 'Xả thọ (Upekkhā)',
        Vedana.joy => 'Hỷ thọ (Somanassa)',
      };

  static String _getBhumiName(BhumiGroup b) => switch (b) {
        BhumiGroup.akusala => 'Bất Thiện (Akusala)',
        BhumiGroup.ahetuka => 'Vô Nhân (Ahetuka)',
        BhumiGroup.sobhanaKamavacara =>
          'Tịnh Hảo Dục Giới (Sobhana Kāmāvacara)',
        BhumiGroup.rupavacara => 'Sắc Giới (Rūpāvacara)',
        BhumiGroup.arupavacara => 'Vô Sắc Giới (Arūpāvacara)',
        BhumiGroup.lokuttara => 'Siêu Thế (Lokuttara)',
      };
}
