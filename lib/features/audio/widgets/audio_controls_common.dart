// lib/features/audio/widgets/audio_controls_common.dart
//
// Dùng chung cho mini player / playlist sheet / full player sheet: preset tốc độ,
// nhãn lặp, định dạng hiển thị (plan §5–§6).

import 'package:flutter/material.dart' hide RepeatMode; // use audio RepeatMode
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/l10n.dart';
import '../models/audio_track.dart';
import '../providers/audio_player_provider.dart';

/// Preset tốc độ bấm được ngay (plan §6.1) — không slider mơ hồ.
const List<double> kSpeedPresets = [0.75, 1.0, 1.25, 1.5, 2.0];

/// Xoay vòng preset cho nút tốc độ một tay trên mini player.
double nextSpeedPreset(double current) {
  for (final preset in kSpeedPresets) {
    if (preset > current + 0.001) return preset;
  }
  return kSpeedPresets.first;
}

/// Định dạng chip tốc độ: `1×`, `1.25×`…
String formatSpeed(double speed) {
  if (speed == speed.roundToDouble()) return '${speed.round()}×';
  final text = speed.toStringAsFixed(2);
  return '${text.replaceFirst(RegExp(r'0$'), '')}×';
}

IconData repeatIcon(RepeatMode mode) => switch (mode) {
      RepeatMode.off => Icons.repeat_rounded,
      RepeatMode.one => Icons.repeat_one_rounded,
      RepeatMode.all => Icons.repeat_rounded,
    };

String repeatLabel(BuildContext context, RepeatMode mode) => switch (mode) {
      RepeatMode.off => context.l10n.repeatOff,
      RepeatMode.one => context.l10n.repeatOne,
      RepeatMode.all => context.l10n.repeatAll,
    };

/// Biểu tượng của chế độ nghe (0.10.3) — dùng ở thanh nghe nổi, playlist,
/// bảng điều khiển và chip "chế độ" của tab Bảng Tương Ưng.
IconData playModeIcon(AudioPlayMode mode) => switch (mode) {
      AudioPlayMode.singleOnce => Icons.looks_one_rounded,
      AudioPlayMode.singleLoop => Icons.repeat_one_rounded,
      AudioPlayMode.sequenceOnce => Icons.playlist_play_rounded,
      AudioPlayMode.sequenceLoop => Icons.repeat_rounded,
    };

/// Tên ngắn của chế độ nghe — đây là chuỗi người dùng đọc trên chip.
String playModeLabel(BuildContext context, AudioPlayMode mode) =>
    switch (mode) {
      AudioPlayMode.singleOnce => context.l10n.playModeOnce,
      AudioPlayMode.singleLoop => context.l10n.repeatOne,
      AudioPlayMode.sequenceOnce => context.l10n.playModeSequence,
      AudioPlayMode.sequenceLoop => context.l10n.repeatAll,
    };

/// Một câu giải thích chế độ nghe đang chọn — chỉ hiện ở nơi có chỗ đọc
/// (playlist sheet / bảng chọn chế độ), không hiện trên thanh nghe nổi.
String playModeHint(BuildContext context, AudioPlayMode mode) =>
    switch (mode) {
      AudioPlayMode.singleOnce => context.l10n.playModeOnceHint,
      AudioPlayMode.singleLoop => context.l10n.playModeRepeatOneHint,
      AudioPlayMode.sequenceOnce => context.l10n.playModeSequenceHint,
      AudioPlayMode.sequenceLoop => context.l10n.playModeRepeatAllHint,
    };

/// Hàng chip chọn chế độ nghe — DÙNG CHUNG cho playlist sheet, bảng điều
/// khiển đầy đủ, tấm chọn chế độ của tab Bảng Tương Ưng và (khi mở rộng)
/// thanh nghe nổi. Một nguồn duy nhất để 4 lựa chọn luôn giống nhau ở mọi nơi.
class PlayModeSelector extends ConsumerWidget {
  const PlayModeSelector({
    super.key,
    required this.color,
    this.showHint = true,
    this.dense = false,
  });

  final Color color;

  /// Hiện thêm một dòng giải thích chế độ đang chọn bên dưới hàng chip.
  final bool showHint;

  /// Bản gọn cho thanh nghe nổi: chip nhỏ hơn, không avatar icon.
  final bool dense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(audioPlayerProvider.select((s) => s.playMode));
    final notifier = ref.read(audioPlayerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            for (final option in AudioPlayMode.values)
              ChoiceChip(
                showCheckmark: false,
                visualDensity:
                    dense ? VisualDensity.compact : VisualDensity.standard,
                avatar: dense
                    ? null
                    : Icon(
                        playModeIcon(option),
                        size: 16,
                        color: option == mode ? color : null,
                      ),
                label: Text(
                  playModeLabel(context, option),
                  style: TextStyle(fontSize: dense ? 11.5 : 12.5),
                ),
                selected: option == mode,
                selectedColor: color.withOpacity(0.2),
                onSelected: (_) => notifier.setPlayMode(option),
              ),
          ],
        ),
        if (showHint) ...[
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(playModeIcon(mode), size: 13, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  playModeHint(context, mode),
                  style: TextStyle(
                    fontSize: 11.5,
                    height: 1.25,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

/// Nhãn thời lượng playlist: luôn "≈" — TTS không có đồng hồ thật (plan §13).
String estimateLabel(BuildContext context, AudioTrack track, double speed) {
  final duration = track.estimatedDuration(speed);
  final minutes = (duration.inSeconds / 60).ceil().clamp(1, 999);
  return '≈ $minutes ${context.l10n.minutesShort}';
}

/// Thông báo lỗi engine → chuỗi đã dịch.
String? audioErrorText(BuildContext context, AudioErrorKind error) => switch (error) {
      AudioErrorKind.none => null,
      AudioErrorKind.engineUnavailable => context.l10n.ttsUnavailable,
      AudioErrorKind.voiceUnavailable => context.l10n.ttsUnavailable,
    };
