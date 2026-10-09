# Manual QA Checklist - VDP M3 + M4

## 1. Smoke Test (Kiểm tra nhanh)
- [x] App khởi chạy thành công, không crash.
- [x] Màn hình chính (Home) hiển thị đầy đủ các module học tập.
- [x] Truy cập được vào một `Study Path` bất kỳ.
- [x] Mở được một `Quiz` và hoàn thành ít nhất 1 câu hỏi.
- [x] Kiểm tra tính năng `TTS` (Text-to-Speech) hoạt động (phát âm đúng).

## 2. Regression Test (Kiểm tra hồi quy)
- [x] `Study Path`: Các module đã học được đánh dấu hoàn thành đúng.
- [ ] `Quiz Engine`: Logic tính điểm và hiển thị kết quả sau khi làm quiz không bị sai lệch.
- [ ] `Bookmark`: Thêm/xóa bookmark trên các mục (Citta, Cetasika, v.v.) hoạt động ổn định.
=> Chỉ có bookmrark và ghi chú trên citta, chưa có trên cetasika
- [ ] `Settings`: Thay đổi cài đặt (theme, ngôn ngữ) được áp dụng ngay lập tức.
=> ngôn ngữ chưa có, theme tương phản cao hoạt động tức thì.
- [x] Điều hướng: Các nút Back/Home hoạt động đúng, không bị kẹt màn hình.

## 3. Accessibility Test (Kiểm tra khả năng truy cập)
- [x] `High Contrast`: Chế độ tương phản cao hiển thị rõ ràng, không bị mất chữ hoặc nút bấm.
[x] Sau khi chọn tương phản thì các tab hòa với nền trắng xóa, không thấy gì để chọn, chỉ thấy cái bánh xe, chỉ khi được chọn thì các icon đó mới hiện ra màu tối trên nền trắng. Còn tab Bảng tương ưng thì Cố định, Bất định, Không có vẫn đang có nền sáng trắng thay vì như các chỗ khác. Và các tên tâm sở và tâm bị chìm cùng với nền, không thấy rõ. Ở tab Lộ trình học thì các Pha 1 - Foundation bị tối vì đang có màu tối cùng nền, trong khi đó các bài học chi tiết như tâm sở biến hành thì đang có nền sáng (chữ tối).
- [ ] `Screen Reader`: Các thành phần UI (nút, danh sách, tiêu đề) được gắn nhãn (semantics) đầy đủ cho TalkBack/VoiceOver. 
=> Chưa thấy thay đổi gì.
- [x] `Text Scaling`: Tăng kích thước font chữ hệ thống lên mức tối đa:
    - [x] UI không bị vỡ layout. => tab Bảng tương ưng bị lỗi Bottom overflowed ở cột tâm. => Done
    - [x] Chữ không bị cắt mất (tràn khung). => Tên tâm sở có ẩn đi, thay bằng dấu ... ví dụ Th..., Ch... -> done
    - [x] Các nút bấm vẫn có thể nhấn được.
=> Khi kéo như kiểu bị lag, phải một chặp mới kéo được và mới có thay đổi. Nó lag tầm gần 0,5s.
=> Có cảm giác bị lag khi nhấn nút phải nửa s mới phản hồi khi chọn nút lọc: Bất Thiện, Vô Nhân, ...
## 4. Persistence/Offline Test (Kiểm tra lưu trữ & Offline)
- [ ] `Progress Persistence`:
    - [x] Học xong một bài, thoát app, mở lại -> Tiến độ vẫn được lưu.
    - [ ] Làm quiz dở dang, thoát app, mở lại -> Trạng thái quiz được khôi phục.
- [ ] `Offline Mode`:
    - [x] Tắt mạng, mở app -> App vẫn truy cập được nội dung đã tải.
    - [x] Dữ liệu (citta, cetasika) hiển thị đúng khi không có internet.

## 5. Edge Cases (Trường hợp đặc biệt)
- [ ] `Spaced Repetition`: Kiểm tra logic hiển thị thẻ ôn tập khi đến hạn (đặc biệt là khi thay đổi ngày giờ hệ thống).
=> Hiện: Module này chưa có nội dung ôn tập. Hãy quay lại sau!
- [ ] `Quiz`: Làm quiz với tốc độ nhanh (spam nút chọn) xem có bị lỗi logic không.
- [x] `TTS`: Phát âm các từ Pali phức tạp hoặc chuỗi văn bản dài xem có bị ngắt quãng bất thường.
- [x] `Memory`: Chuyển đổi liên tục giữa các màn hình (Study -> Quiz -> Home) trong thời gian dài xem có bị rò rỉ bộ nhớ (lag/giật).
- [ ] `Empty State`: Kiểm tra màn hình khi chưa có dữ liệu (ví dụ: chưa có bookmark nào, chưa học module nào).
=> Trong phần cài đặt chỗ: 4/5 module hoàn thành đang hiện là 9200% trong khi phải là 92% mới đúng. => done
## 6. Nghe bài học (VDP | AUDIO — P1, xem doc/audio_plan.md)
- [ ] `Phát cơ bản`: Mở module có nội dung → tab Học → "Nghe toàn bộ" phát lần lượt các mục; mini player bám đáy (hiện ở cả 3 tab Học/Ôn tập/Kiểm tra).
- [ ] `Danh sách`: "Danh sách nghe (n)" hiển thị đủ mục đánh số + thời lượng ≈; tap hàng / nút ▶ phát từ đúng mục đó; hàng đang nghe sáng kèm "Đang nghe · đoạn a/b".
- [ ] `Lặp`: 3 chế độ Tắt / Mục này / Cả danh sách hoạt động đúng (hết mục lặp lại / hết danh sách quay mục 1); "Nghe lại ×2/×3/×5" phát lại đúng số lượt rồi đi tiếp.
- [ ] `Tốc độ`: 5 preset 0.75×–2.0× đổi ngay khi đang phát; chip trên mini player xoay vòng được; thoát app mở lại tốc độ được giữ.
- [ ] `Nghe dở`: Ngắt giữa mục 3 → mở lại module → "Tiếp tục nghe" phát đúng mục + đoạn; thoát module (thoát tab bài học) là pause + lưu.
- [ ] `Highlight`: Paragraph đang đọc được tô sáng trong tab Học; section đang nghe tự mở; cuộn theo khi đoạn ra khỏi khung nhìn (không giật khi đang lướt tay).
- [ ] `Pāli`: Tới mục "Từ khóa" nghe thuật ngữ bằng giọng Pāli (như nút phát âm Pāli ở detail sheet); đang nghe bài mà bấm phát âm Pāli ở detail sheet → phiên nghe tự pause (không nói chồng).
- [ ] `Screen Reader`: Mọi nút nghe (play/pause/next/prev/lặp/tốc độ/danh sách) có semantics + tooltip đầy đủ.
- [ ] `Fallback`: Thiết bị/không có giọng TTS phù hợp → toast nhẹ, không crash; locale chưa dịch UI vẫn hiện tiếng Anh đúng chuẩn.
- [ ] `Nền tảng*: Test tay tốc độ trên cả Android + iOS (thang TTS khác nhau — tts_rate.dart); pause/resume không nhảy chữ; TTS đọc hết mọi đoạn của section dài (không nuốt chữ).

## 7. Audio P2 — implementation and device QA
- [x] `audio_session`: speech focus, interruption and becoming-noisy pause are wired.
- [x] `audio_service`: one handler forwards OS play/pause/next/previous commands; Android foreground media permission and iOS audio background mode added.
- [x] `Sleep timer`: session-owned 15/30/60 minute API, three-second fade and volume restore are implemented; automated cancellation test added.
- [x] `Continue listening`: app-level row reads `audio.lastModuleId`; legacy `audio.pos.<moduleId>` JSON remains readable and now accepts optional timestamp metadata.
- [x] `Sherpa boundary`: per-cue async backend, cache key (text/locale/model/speed), cancellation token and P1 fallback implemented.
- [ ] `Sherpa Vietnamese model`: **not enabled**. No model/WAV is committed. Legal/model verification is documented in `doc/audio_p2_model.md`; fill publisher license, URL and SHA-256 before distribution.
- [ ] Android device: install a verified model externally, lock screen, headset unplug, Bluetooth controls, interruption, resume, seek/duration and Pāli switching.
- [ ] iOS device: background audio, lock screen, route change, interruption and fallback TTS limitations.
- [ ] Flutter analyze/test: sandbox has no Flutter SDK (`flutter: command not found`), therefore not run here. Run `flutter gen-l10n`, `flutter analyze`, `flutter test` and the device cases above on a Flutter-enabled CI/device.

## 8. Web TTS — Browser voices
- [x] Web player factory selects `flutter_tts`/SpeechSynthesis without compiling the native Sherpa file-cache implementation into the browser target.
- [x] Settings voice picker lists browser voices, remembers a choice per content locale, previews a voice and automatically prefers a likely male Vietnamese voice when available.
- [x] Pure voice matching and preference tests added in `test/web_tts_voice_test.dart`.
- [ ] Manual Chrome/Edge/Safari QA: voice enumeration, Vietnamese male preference, explicit voice changes, preview, pause/stop and reload persistence.
- [ ] Flutter Web release build and browser smoke test; Flutter SDK is unavailable in this sandbox, so build/test/analyze were not run here.
- [ ] Cloud neural voice demo requires a separately deployed Google/Edge TTS proxy. GitHub Pages must never receive provider API keys; see `docs/audio-web-tts.md`.
