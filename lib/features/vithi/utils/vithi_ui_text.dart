import 'package:flutter/material.dart';

import '../../../data/models/vithi_model.dart';

/// Small interface copy used only by the Mind Process player.
///
/// Entity content remains in the offline content catalog. This helper keeps
/// the player usable while the project has only Vietnamese and English
/// editorial copy for this new interaction; non-Vietnamese locales safely use
/// English rather than falling back to Vietnamese.
class VithiUiText {
  const VithiUiText._();

  static bool _isVietnamese(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'vi';

  static String processPicker(BuildContext context) => _isVietnamese(context)
      ? 'Chọn loại lộ trình'
      : 'Choose a cognitive process';

  static String processLabel(BuildContext context, VithiModel vithi) {
    final vietnamese = _isVietnamese(context);
    return switch (vithi.vithiType) {
      VithiType.atimahanta => vietnamese ? 'Cảnh rất lớn' : 'Very great object',
      VithiType.mahanta => vietnamese ? 'Cảnh lớn' : 'Great object',
      VithiType.manoVithi => vietnamese ? 'Ý môn' : 'Mind door',
      VithiType.vithimutta => vietnamese ? 'Ngoài lộ' : 'Process-free',
      VithiType.paritta => vietnamese ? 'Cảnh nhỏ' : 'Small object',
      VithiType.atiparitta => vietnamese ? 'Cảnh rất nhỏ' : 'Very small object',
      VithiType.appana => vietnamese ? 'Đắc thiền' : 'Absorption',
      VithiType.lokuttara => vietnamese ? 'Siêu thế' : 'Supramundane',
    };
  }

  static String doorLabel(BuildContext context, VithiModel vithi) {
    final vietnamese = _isVietnamese(context);
    return switch (vithi.dvara) {
      VithiDvara.panca => vietnamese ? 'Ngũ môn' : 'Five-door',
      VithiDvara.mano => vietnamese ? 'Ý môn' : 'Mind-door',
      VithiDvara.vithimutta => vietnamese ? 'Ngoài lộ' : 'Process-free',
    };
  }

  static String momentCount(BuildContext context, int count) =>
      _isVietnamese(context) ? '$count sát-na minh họa' : '$count illustrated moments';

  static String timelineTitle(BuildContext context) =>
      _isVietnamese(context) ? 'Diễn tiến sát-na' : 'Sequence of moments';

  static String timelineInstruction(BuildContext context) => _isVietnamese(context)
      ? 'Chạm một ô để xem phận sự; vuốt ngang để theo dõi toàn lộ.'
      : 'Tap a tile to study its function; swipe sideways to follow the whole process.';

  static String momentProgress(BuildContext context, int position, int total) =>
      _isVietnamese(context) ? 'Sát-na $position / $total' : 'Moment $position / $total';

  static String currentMoment(BuildContext context) =>
      _isVietnamese(context) ? 'Sát-na đang xem' : 'Current moment';

  static String repeatLabel(BuildContext context, int occurrence, int total) =>
      _isVietnamese(context)
          ? 'Lần $occurrence trong $total'
          : 'Occurrence $occurrence of $total';

  static String optional(BuildContext context) =>
      _isVietnamese(context) ? 'Tùy chọn' : 'Optional';

  static String possibleCittas(BuildContext context, int count) =>
      _isVietnamese(context)
          ? 'Tâm có thể sanh ($count)'
          : 'Possible cittas ($count)';

  static String doctrinalNote(BuildContext context) =>
      _isVietnamese(context) ? 'Ghi chú giáo lý' : 'Doctrinal note';

  static String backgroundTitle(BuildContext context) =>
      _isVietnamese(context) ? 'Bối cảnh của lộ trình' : 'Process context';

  static String arisingCondition(BuildContext context) =>
      _isVietnamese(context) ? 'Điều kiện phát sinh' : 'Arising condition';

  static String significance(BuildContext context) =>
      _isVietnamese(context) ? 'Điểm then chốt' : 'Key point';

  static String noCittaMapping(BuildContext context) => _isVietnamese(context)
      ? 'Dữ liệu chưa nêu tâm cụ thể cho sát-na này.'
      : 'No specific citta is listed for this moment.';

  static String continuation(BuildContext context) => _isVietnamese(context)
      ? 'Trở về dòng Hộ Kiếp — tiếp diễn'
      : 'Returns to the Bhavaṅga stream — continuing';

  static String play(BuildContext context) =>
      _isVietnamese(context) ? 'Tự động trình diễn' : 'Play sequence';

  static String pause(BuildContext context) =>
      _isVietnamese(context) ? 'Tạm dừng trình diễn' : 'Pause sequence';

  static String previous(BuildContext context) =>
      _isVietnamese(context) ? 'Sát-na trước' : 'Previous moment';

  static String next(BuildContext context) =>
      _isVietnamese(context) ? 'Sát-na tiếp theo' : 'Next moment';

  static String reset(BuildContext context) =>
      _isVietnamese(context) ? 'Về đầu lộ' : 'Restart sequence';

  static String timelineSemantics(
    BuildContext context,
    int count,
    String processName,
  ) => _isVietnamese(context)
      ? 'Lộ trình $processName gồm $count sát-na minh họa. Vuốt ngang để xem toàn bộ.'
      : '$processName has $count illustrated moments. Swipe sideways to view the full sequence.';

  static String momentSemantics(
    BuildContext context, {
    required int position,
    required int total,
    required String name,
    required bool isSelected,
    required bool isOptional,
    required String occurrenceLabel,
  }) {
    final selected = isSelected
        ? (_isVietnamese(context) ? ' Đang được chọn.' : ' Selected.')
        : '';
    final optional = isOptional
        ? (_isVietnamese(context) ? ' Tùy chọn.' : ' Optional.')
        : '';
    final occurrence = occurrenceLabel.isEmpty
        ? ''
        : (_isVietnamese(context)
            ? ' $occurrenceLabel.'
            : ' $occurrenceLabel.');
    return '${momentProgress(context, position, total)}: $name.$occurrence$optional$selected';
  }
}
