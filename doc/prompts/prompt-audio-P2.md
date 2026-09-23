# 📋 PROMPT CHO AGENT ARENA — VDP | AUDIO P2: Giọng Sherpa + Nghe nền + Sleep timer

> Gửi nguyên khối này cho agent Arena mới (agent thấy được repo). Prompt assume agent
> tự đọc repo — đừng đính kèm code. Mục tiêu cuối: mở PR từ nhánh session của agent.

---

# TASK AUDIO-P2 (M4 · A2-1 → A2-5): Nâng cấp "Nghe bài học" — giọng neural Sherpa, nghe nền, sleep timer

## Vai trò
Bạn là Flutter developer cho dự án Vi Diệu Pháp (VDP / AbhiDhamma, package `vdp_app`).
Dự án dùng: Flutter + Riverpod (StateNotifier) + SharedPreferences; models thuần Dart
(không build_runner cho content/audio).
Nguyên tắc bất biến: **Offline-First, Accuracy-First, Accessibility-First**.
Thói quen người học (xem `doc/audio_plan.md` §2): nghe rải vụn 3–10 phút/lần, nghe lặp
để thuộc, nghe khi không nhìn được màn hình (đi xe, làm việc nhà, trước khi ngủ).

## Đọc trước khi làm (bắt buộc — repo có sẵn tất cả)
- `doc/audio_plan.md` — kế hoạch gốc. CHỈ CẦN đọc §2, §4, §5.3, §6, §7, §10 (mục P2),
  §11, §13 (quyết định đã chốt — đặc biệt §13.1: KHÔNG có file thu âm sẵn, KHÔNG thu mới).
- `lib/features/audio/**` — toàn bộ module P1 (models/data/players/providers/services/widgets).
- `lib/features/study/module_detail_screen.dart` — điểm tích hợp tab Học hiện tại.
- `test/audio_player_test.dart` — pattern FakeTrackPlayer/InMemoryStore phải giữ pass.
- `doc/QA_CHECKLIST_VDP_M3_M4.md` §6.
- `doc/versioning_policy.md` — đặt lại version trong `pubspec.yaml` đúng quy ước khi mở PR.
- `doc/prompts/prompt-M2-T5.md` — tham chiếu phong cách triển khai từng bước của dự án.

## Điều kiện tiên quyết (quan trọng — đọc kỹ)
P2 xây trên P1 (module `lib/features/audio/`). P1 nằm trên nhánh `arena/01a0cf67-vdp`
(chưa chắc đã merge vào main khi bạn chạy):
1. Kiểm tra `lib/features/audio/` có trên nhánh session của bạn không.
2. Nếu CHƯA có và main chưa chứa: `git fetch origin && git merge origin/arena/01a0cf67-vdp`
   (merge VÀO nhánh session của bạn — tuyệt đối không `checkout` sang nhánh khác).
3. Nếu đã có trên main (P1 đã được merge) thì bỏ qua.

## Bối cảnh P1 đã có (không làm lại)
- `TrackPlayer` (abstract, `players/track_player.dart`): `load/play/pause/stop/setSpeed/
  seekCue/dispose` + `Stream<TrackPlayerEvent>` (cueStarted/completed/engineUnavailable/
  voiceUnavailable). `TtsTrackPlayer` (flutter_tts) là engine hiện tại.
- `AudioPlayerNotifier` (Riverpod StateNotifier): playlist, vị trí, repeat Tắt/Mục này/
  Cả danh sách, "Nghe lại ×N", tốc độ preset 0.75–2.0×, lưu vị trí nghe dở.
- UI: mini player + playlist sheet + full player sheet trong tab Học; highlight paragraph.
- `LessonAudioRef` optional trong content schema (hợp đồng `audioRef` chưa dùng).
- Vị trí hiển thị dạng "mục 3/7 · đoạn 2/5" (TTS không có thời lượng thật).

## Yêu cầu tính năng

### 1. `SherpaTtsTrackPlayer` — giọng neural offline (A2-3 ★ TRỌNG TÂM)
- Package gợi ý: `sherpa_onnx_flutter` (kiểm tra docs sherpa-onnx hiện tại khi làm —
  chọn model TTS tiếng Việt offline, license mở (MIT/CC), dung lượng nhỏ (< ~60MB)).
- **Kiến trúc quyết định: TỔNG HỢP TRƯỚC — PHÁT SAU.** Mỗi cue → synth ra wav
  (sherpa) → phát qua `just_audio` (đã có trong pubspec) dạng `ConcatenatingAudioSource`:
  - Giải quyết 3 việc cùng lúc: nghe nền ổn định, thời lượng/seek THẬT (bỏ "≈"),
    pause/resume chính xác từng câu.
  - Cache wav trong thư mục tạm (`path_provider`) theo hash(trackId|cue|locale) —
    offline-first, không commit wav vào git.
  - Span Pāli (`CueSpan.isPali`) synth bằng model/voice riêng nếu có, không thì voice chính.
- Implements đúng `TrackPlayer` — provider/UI/playlist KHÔNG đổi. Xây
  `SherpaTtsTrackPlayer` + `player_factory.dart` chọn engine: model sẵn → sherpa,
  không thì fallback `TtsTrackPlayer` (flutter_tts) như P1. Không có model ≠ crash.
- Tốc độ: map bội số người dùng (0.5–2.0) sang tốc độ just_audio (pitch-preserving);
  thêm hàm thuần `sherpa_speed.dart` + unit test (pattern `tts_rate.dart`).
- Model: KHÔNG commit vào repo. Thêm `tool/download_tts_model.py` (hoặc README mục mới
  trong `doc/audio_plan.md`) ghi rõ URL tải + checksum + đường dẫn đặt model; app load
  từ thư mục tài liệu của app, thiếu model → fallback + SnackBar `ttsUnavailable`.

### 2. `audio_session` — tôn trọng hệ điều hành (A2-1)
- `AudioSession.instance.configure(AudioSessionConfiguration.speech())` khi mở phiên nghe.
- Xử lý interruption (cuộc gọi đến, Siri…): tự pause + resume khi ngắt xong nếu đang play.

### 3. Nghe nền + lock screen + tai nghe (A2-2)
- Package `audio_service`: `AudioHandler` bọc quanh `AudioPlayerNotifier` (giữ notifier
  là single source of truth — handler chỉ điều hướng).
- Notification/lockscreen: play/pause, next, previous, tiêu đề = tên mục, artist = tên module.
- Nút tai nghe/bluetooth: play/pause (toggle), double-tap = next, triple = previous.
- AndroidManifest: `FOREGROUND_SERVICE`, `FOREGROUND_SERVICE_MEDIA_PLAYBACK`,
  `WAKE_LOCK`; iOS `Info.plist`: `UIBackgroundModes` → `audio`. Ghi chú rõ trong PR.
- Mini player hiện cả khi đang ở tab Ôn tập/Kiểm tra (đã có) — khi P2 xong, nghe được cả
  khi đã thoát module (toàn app). Chỉ 1 phiên nghe tại một thời điểm.

### 4. Sleep timer (A2-4) — thói quen nghe trước khi ngủ
- Full player sheet: nút "Hẹn giờ tắt" — chọn 15/30/60 phút hoặc Tắt.
- Hết giờ: fade-out volume ~3s rồi pause (không tắt app). Hiếm nút, dễ mở lại.
- Chuỗi l10n mới (thêm đủ 26 arb + regen gen-l10n, `python3 tool/check_localizations.py`
  phải pass): `sleepTimer`, `sleepTimerOff`, `sleepTimerMinutes`… đặt tên theo plan §9.

### 5. "Tiếp tục nghe" + thời lượng thật (A2-5)
- `study_screen.dart`: hàng "Tiếp tục nghe" (module + mục đang dở, đọc từ
  `audio.pos.<moduleId>` qua store) — bấm là mở module + phát tiếp.
- Khi engine có thời lượng thật (sherpa wav): playlist sheet + mini player hiển thị
  timeline/phút:giây thật thay "≈" (fallback giữ "≈" cho flutter_tts — `estimateLabel`
  trong `audio_controls_common.dart`).

## Ràng buộc kỹ thuật
- Offline-first, không crash: bọc try-catch quanh mọi engine call (pattern `PaliTtsHelper`).
- KHÔNG phá contract P1: `TrackPlayer`, `AudioPlayerState`, `ListeningPositionStore` chỉ
  thêm, không đổi semantic. Test P1 phải pass nguyên.
- Test mới tối thiểu: factory chọn engine, sherpa speed mapping, sleep timer state,
  AudioHandler điều hướng (fake handler).
- Semantics/tooltip cho mọi nút mới (đối chiếu §6 QA). High contrast + text scale như P1.
- Large artifacts (model, wav cache) KHÔNG vào git — theo ignore/external-storage convention.

## Definition of Done
- [ ] `SherpaTtsTrackPlayer` hoạt động trên máy thật Android (và iOS nếu model hỗ trợ);
      thiếu model → fallback flutter_tts + thông báo nhẹ.
- [ ] Tắt màn hình / ra khỏi app: nghe tiếp + điều khiển lockscreen/tai nghe OK.
- [ ] Sleep timer 15/30/60 hoạt động có fade-out.
- [ ] Hàng "Tiếp tục nghe" ở tab Học; thời lượng thật khi chạy sherpa.
- [ ] `flutter test` pass; `python3 tool/check_localizations.py` pass; QA §6 + mục mới tick tay.
- [ ] `pubspec.yaml` version tăng đúng `doc/versioning_policy.md`.
- [ ] **Mở PR từ NHÁNH SESSION CỦA BẠN → `main`** (tuyệt đối không PR từ nhánh lạ):
      title `feat(audio): Sherpa TTS + nghe nền + sleep timer (P2)`;
      body: trích `doc/audio_plan.md` §10 P2 đã làm mục nào, QA checklist, cách tải model,
      ảnh/video demo nếu có, ghi rõ fallback và rủi ro đã test trên máy nào.

## ⛔ KHÔNG làm
- Không thu/ghi âm giọng thật (plan §13.1 đã chốt).
- Không viết lại nội dung giáo lý, không đổi dữ liệu `assets/content`/`assets/data`.
- Không thêm tính năng ngoài §10 P2 (listening quiz, pre-synth pipeline → P3).
