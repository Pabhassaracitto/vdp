// lib/features/audio/players/tts_rate.dart
//
// Chuẩn hóa tốc độ giữa UI (bội số người dùng, 1.0 = bình thường) và engine TTS
// (plan §6.1). Thang đo gốc khác nhau theo nền tảng:
//   * Android (TextToSpeech.setSpeechRate): 1.0 = bình thường, 2.0 = gấp đôi.
//   * iOS (AVSpeechUtterance.rate):         0.5 = bình thường, 1.0 = tối đa.
// Hàm thuần — test được không cần thiết bị.

/// Chuyển tốc độ người dùng (0.5–2.0) sang thang của engine TTS.
double engineSpeechRate(double speed, {required bool isIOS}) {
  final clamped = speed.clamp(0.5, 2.0).toDouble();
  if (isIOS) return (clamped * 0.5).clamp(0.0, 1.0).toDouble();
  return clamped;
}
