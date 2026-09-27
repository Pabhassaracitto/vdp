// lib/features/audio/widgets/audio_controls_common.dart
//
// Dùng chung cho mini player / playlist sheet / full player sheet: preset tốc độ,
// nhãn lặp, định dạng hiển thị (plan §5–§6).

import 'package:flutter/material.dart' hide RepeatMode; // use audio RepeatMode

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
