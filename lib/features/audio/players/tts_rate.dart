// lib/features/audio/players/tts_rate.dart
//
// Chuẩn hóa tốc độ giữa UI (bội số người dùng, 1.0 = bình thường) và engine TTS
// (plan §6.1). Thang đo gốc khác nhau theo nền tảng:
// `flutter_tts` chuẩn hóa setSpeechRate về khoảng 0.0–1.0 trên các nền tảng;
// 0.5 là tốc độ nói tự nhiên. Truyền trực tiếp 1.0 cho preset 1× khiến Android
// đọc ở tốc độ tối đa, nên mọi nền tảng phải dùng cùng phép đổi này.
// Hàm thuần — test được không cần thiết bị.

/// Chuyển tốc độ người dùng (0.5–2.0) sang thang của engine TTS.
double engineSpeechRate(double speed, {required bool isIOS}) {
  final clamped = speed.clamp(0.5, 2.0).toDouble();
  return (clamped * 0.5).clamp(0.0, 1.0).toDouble();
}
