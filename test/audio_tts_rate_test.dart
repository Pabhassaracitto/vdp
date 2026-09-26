// test/audio_tts_rate_test.dart
//
// Các hàm thuần của lớp TTS (plan §6.1, §7, §11): chuẩn hóa tốc độ theo nền
// tảng, tách câu, chuỗi giọng đọc theo chuỗi văn bản.

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/features/audio/data/tts_voice_chain.dart';
import 'package:vdp_app/features/audio/players/text_chunking.dart';
import 'package:vdp_app/features/audio/players/tts_rate.dart';

void main() {
  group('engineSpeechRate', () {
    test('Android: 1.0× = 1.0, 2.0× = 2.0 (thang gốc)', () {
      expect(engineSpeechRate(1.0, isIOS: false), 1.0);
      expect(engineSpeechRate(2.0, isIOS: false), 2.0);
      expect(engineSpeechRate(0.75, isIOS: false), 0.75);
    });

    test('iOS: 1.0× = 0.5 (AVSpeechUtteranceDefaultSpeechRate)', () {
      expect(engineSpeechRate(1.0, isIOS: true), 0.5);
      expect(engineSpeechRate(2.0, isIOS: true), 1.0); // trần của iOS
      expect(engineSpeechRate(0.75, isIOS: true), 0.375);
    });

    test('kẹp ngoài khoảng preset (0.5–2.0)', () {
      expect(engineSpeechRate(0.1, isIOS: false), 0.5);
      expect(engineSpeechRate(9.9, isIOS: true), 1.0);
    });
  });

  group('splitSentences', () {
    test('tách theo . ! ? … kèm ký tự đóng ngoặc', () {
      expect(
        splitSentences('Một. Hai! Ba? Bốn…'),
        ['Một.', 'Hai!', 'Ba?', 'Bốn…'],
      );
      expect(splitSentences('Nói vậy (xem thêm). Tiếp'), [
        'Nói vậy (xem thêm).',
        'Tiếp',
      ]);
    });

    test('không tách ở số thập phân; phần còn lại sau dấu ghép vào câu', () {
      // '3.5' không tách (dấu . không theo sau là khoảng trắng).
      // Lưu ý: 'vd. ' vẫn tách — chấp nhận được: TTS đọc liền mạch qua 2 lần
      // speak, chỉ nghỉ nhẹ; tránh heuristic viết tắt dễ sai.
      final result = splitSentences('Xem mục 3.5 trong tài liệu. Đoạn sau.');
      expect(result, [
        'Xem mục 3.5 trong tài liệu.',
        'Đoạn sau.',
      ]);
    });

    test('văn bản không dấu kết câu → 1 câu; rỗng → không có gì', () {
      expect(splitSentences('Chỉ một đoạn không dấu'), [
        'Chỉ một đoạn không dấu',
      ]);
      expect(splitSentences('   '), isEmpty);
    });
  });

  group('speakTimeoutFor', () {
    test('câu dài / tốc độ chậm → timeout dài hơn', () {
      final short = speakTimeoutFor('Một câu.', 1.0);
      final long = speakTimeoutFor(List.filled(40, 'từ').join(' '), 0.5);
      expect(long, greaterThan(short));
    });
  });

  group('ttsVoiceChain', () {
    test('tiếng Việt: giữ vi đầu tiên, fallback en cuối', () {
      expect(ttsVoiceChain('vi'), ['vi', 'en', 'en-US', 'en-GB']);
    });

    test('ngôn ngữ khác: loại vi khỏi chuỗi giọng (khớp chuỗi văn bản)', () {
      expect(ttsVoiceChain('zh_TW'), ['zh-TW', 'zh', 'en', 'en-US', 'en-GB']);
    });
  });

  group('pickTtsLanguage', () {
    test('chọn preferred đầu tiên được hỗ trợ, khớp cả prefix', () {
      expect(
        pickTtsLanguage(
          preferred: ['vi-VN', 'en-US'],
          supported: ['en-US', 'ja-JP'],
        ),
        'en-US',
      );
      expect(
        pickTtsLanguage(
          preferred: ['en-GB'],
          supported: ['en', 'fr'],
        ),
        'en-GB', // 'en' hỗ trợ 'en-GB' theo prefix
      );
      expect(
        pickTtsLanguage(preferred: ['my-MM'], supported: ['en-US']),
        isNull,
      );
    });

    test('parseTtsLanguageList nhận List/String/mixed', () {
      expect(parseTtsLanguageList(['vi-VN', 'en-US']), ['vi-VN', 'en-US']);
      expect(parseTtsLanguageList('vi-VN, en-US '), ['vi-VN', 'en-US']);
      expect(parseTtsLanguageList(null), isEmpty);
    });
  });
}
