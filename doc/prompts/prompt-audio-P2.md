# PROMPT CHO AGENT ARENA — VDP | AUDIO P2: Sherpa TTS, nghe nền, hẹn giờ tắt

> Có thể gửi nguyên văn prompt này cho một agent Arena khác: agent truy cập được repo.
> Hãy **triển khai và kiểm thử**, không chỉ viết kế hoạch. Làm trên nhánh session của agent;
> không checkout/tạo nhánh khác. Kết thúc bằng PR P2 riêng (xem điều kiện bên dưới).

## Vai trò và mục tiêu

Bạn là Flutter developer của VDP (Vi Diệu Pháp / `vdp_app`). Nâng cấp tính năng
**Nghe bài học** từ P1 lên P2 trong `doc/audio_plan.md` §10 (A2-1 → A2-5):
Sherpa-ONNX TTS neural **offline** thay cho giọng hệ thống khi có model; phát nền,
lock screen, tai nghe; sleep timer 15/30/60 phút; và hàng “Tiếp tục nghe” trên màn
Học. Bảo toàn playlist, lặp, tốc độ, resume, highlight và các test đã có.

Thiết kế theo thói quen người học (§2): họ nghe rải vụn 3–10 phút trong ngày, cần
quay lại ngay đúng đoạn; nghe lặp để thuộc; khi đi bộ/làm việc nhà hoặc trước khi
ngủ thì không nhìn màn hình. Ưu tiên **offline-first, chính xác, dễ tiếp cận**.

## Điều kiện bắt đầu: phụ thuộc PR P1

- P1 nằm ở PR **#10** (`arena/01a0cf67-vdp` → `main`). Kiểm tra trạng thái PR và
  đọc diff trước khi làm. Nếu P1 đã merge: lấy P1 từ `main` vào nhánh session của bạn.
- Nếu P1 **chưa** merge mà bạn cần bắt đầu ngay: `git fetch origin` rồi tích hợp
  `origin/arena/01a0cf67-vdp` **vào nhánh session của bạn** (nếu refspec chỉ fetch
  `main`, fetch riêng nhánh P1); KHÔNG checkout/chuyển nhánh. Chỉ mở PR P2 khi
  #10 đã merge và bảo đảm diff P2 → `main` không lặp lại P1. Nếu merge/squash
  gây xung đột lịch sử, giải quyết trên nhánh của bạn, không force-push PR P1.
- Đọc `doc/audio_plan.md` (§2, §4, §5.3, §6–§13), `doc/QA_CHECKLIST_VDP_M3_M4.md`
  §6, `doc/versioning_policy.md` và mã P1: `lib/features/audio/**`,
  `lib/features/study/module_detail_screen.dart`, `study_screen.dart`,
  `test/audio_*_test.dart`. Lấy **mã thực tế** làm chuẩn khi plan mô tả khác.

## Yêu cầu triển khai

### 1) SherpaTtsTrackPlayer — ưu tiên làm spike trước (A2-3)

- Xác minh package sherpa-onnx Flutter/API hiện hành và **model TTS tiếng Việt có
  thể phân phối hợp pháp**: giấy phép, kích thước, nền tảng, chất lượng, tốc độ
  tổng hợp, URL/checksum. Đừng tự nhận có giọng neural nếu chưa chạy được model
  thực tế. Nếu không có model phù hợp, ghi blocker và phương án rõ ràng; giữ
  fallback P1 hoạt động, không dựng demo giả hay commit model vào Git.
- Kiến trúc đích: mỗi cue (có `CueSpan` thường/Pāli) → Sherpa sinh WAV/PCM →
  cache local → `just_audio` phát theo hàng đợi; giữ cue-to-paragraph mapping để
  highlight/resume/lặp chính xác. Sinh bất đồng bộ, có huỷ khi đổi bài/seek/stop,
  quản lý cache/kích thước và prefetch tối thiểu để không chờ cả module trước
  khi phát. Key cache phải chứa **nội dung cue + locale/giọng + phiên bản model**
  (và tham số tổng hợp nếu có), không chỉ `trackId`; nội dung đổi phải hết hạn.
- `SherpaTtsTrackPlayer implements TrackPlayer`; factory chọn Sherpa **chỉ khi**
  model khởi tạo/phát được, thiếu/lỗi model → `TtsTrackPlayer` như P1 + thông báo
  nhẹ, không crash. Quy định đường cài model ngoài Git (ví dụ tải chủ động có
  checksum vào vùng dữ liệu app / nguồn phân phối ngoài Git), cách kiểm thử offline
  sau cài và cách fallback; **không tự tải mạng khi bấm Play**. Model/WAV không
  thêm vào repo. `just_audio` và `path_provider` đã có trong `pubspec.yaml`.
- Vẫn dùng 5 preset 0.75–2.0× của P1; map sang tốc độ `just_audio` (không thay
  pitch nếu engine cho phép). Giữ Pāli tách giọng nếu có model phù hợp; nếu không,
  nêu rõ fallback khả dụng, không để hai engine nói chồng nhau.
- WAV có duration/position **thật** sau khi tổng hợp: hiện timeline và seek hợp lệ
  khi có dữ liệu; trước khi tổng hợp xong hoặc ở flutter_tts, giữ nhãn “≈”/cue index,
  không hiển thị đồng hồ giả. Có thể **mở rộng** `TrackPlayer`/state bằng capability
  tùy chọn và event vị trí/thời lượng; giữ semantic và các test P1, không viết lại
  playlist/notifier không cần thiết. Lưu ý `TrackPlayer.load` P1 hiện chỉ nhận
  `cues`/`contentLocaleTag` (không có trackId): chỉnh thiết kế cache tương ứng.

### 2) Audio session, nghe nền và tai nghe (A2-1, A2-2)

- Cấu hình `audio_session` phù hợp nội dung lời nói; interruption/duck/noisy
  (rút tai nghe), focus loss: pause đúng lúc; chỉ tự resume nếu trước ngắt đang
  phát và nền tảng cho phép. Đồng bộ với phát âm Pāli của `PaliTtsHelper`.
- Tích hợp `audio_service` với **một phiên nghe duy nhất** do `AudioPlayerNotifier`
  quản lý; AudioHandler chỉ chuyển play/pause/next/previous/seek và phát metadata
  (tên mục, tên module, duration khi có), không tạo state playback song song.
  Nút media tai nghe/Bluetooth dùng các lệnh hệ điều hành hỗ trợ; không hứa hành
  vi double/triple tap trên thiết bị không hỗ trợ. Cấu hình Android service/quyền
  foreground media playback theo SDK và iOS background audio khi cần.
- P1 `onModuleClosed()` tạm dừng phát: P2 phải cho phép tiếp tục nghe khi rời
  module/app, vẫn giữ state/lưu vị trí nhất quán và có mini player ở cấp app để
  quay lại bài. Khi Sherpa WAV chạy, khoá màn hình/đổi màn hình không dừng phát;
  nếu chỉ còn `flutter_tts` fallback mà nền tảng không hỗ trợ nghe nền, nói rõ
  giới hạn thay vì tuyên bố tính năng này hoạt động ở mọi engine.

### 3) Sleep timer cho người nghe trước khi ngủ (A2-4)

- Trong full player: “Hẹn giờ tắt” → Tắt/15/30/60 phút; hiển thị thời gian còn
  lại và có thể đổi/hủy dễ dàng. Timer thuộc phiên nghe (không thuộc widget sheet),
  nên hoạt động khi tắt màn hình; hết giờ fade-out âm lượng khoảng 3 giây rồi
  pause (không stop/đóng app); khôi phục volume cho lần nghe sau, cancel khi
  người dùng tắt hoặc hết phiên. Xử lý race với pause/next/interruption/dispose;
  nếu engine fallback không điều chỉnh volume được, pause an toàn và ghi rõ.

### 4) Tiếp tục nghe, thời lượng thật (A2-5)

- Thêm hàng “Tiếp tục nghe” ở `lib/features/study/study_screen.dart`, lấy module
  và vị trí nghe gần nhất từ store (`audio.pos.<moduleId>` hiện chỉ có trackId/
  cueIndex: thêm metadata thời gian/module gần nhất có migration an toàn). Bấm
  mở đúng module và **phát tiếp đúng cue**; không reset vị trí khi chỉ duyệt tab.
- Mini player/playlist/full player chỉ hiện phút:giây/duration thật với audio
  đã tổng hợp; fallback TTS vẫn hiển thị “mục i/n · đoạn k/m” và “≈ n phút”.
  Highlight và resume ở cue phải tiếp tục đúng sau seek, lock/unlock, sleep timer.

## Ràng buộc và kiểm thử

- Không có file thu âm sẵn và **không thu âm mới** (§13.1). Không sửa nội dung
  giáo lý `assets/content`/`assets/data`, không làm P3 (quiz/pre-synth toàn kho).
  Không đẩy model, WAV, cache/build artifacts hoặc khóa API vào Git.
- L10n chuỗi mới trong đủ **26 ARB**, regenerate với `flutter gen-l10n`; tooltip,
  semantics, text scale/contrast cho mọi nút mới. `python3 tool/check_localizations.py`
  phải pass. Cập nhật QA checklist mục P2 và version theo `doc/versioning_policy.md`.
- Test tối thiểu: factory fallback/khởi tạo model, mapping speed, key cache &
  huỷ synthesis/seek, điều hướng AudioHandler, interruption, sleep timer (fake
  clock/fake volume; test reset volume), “Tiếp tục nghe”/migration dữ liệu cũ.
  Giữ `test/audio_*_test.dart` P1 pass. Chạy `flutter analyze`, `flutter test`
  (và `flutter gen-l10n` trước); nếu sandbox thiếu SDK/thiết bị, báo rõ **chưa
  kiểm thử**, cung cấp bước QA Android/iOS (lock screen, tai nghe, resume, Pāli,
  offline, model thiếu/hỏng), không đánh dấu pass giả.

## Definition of Done và PR

- [ ] Có đường **cài model hợp pháp → phát giọng Sherpa tiếng Việt offline thật**
      trên ít nhất Android; iOS nếu hỗ trợ hoặc nêu rõ giới hạn. Thiếu model/lỗi
      khởi tạo → fallback P1 vẫn nghe được, không crash.
- [ ] Với WAV đã tổng hợp: nghe tiếp khi khóa màn/rời app, metadata và điều
      khiển media đúng; thời lượng/seek thực, cue highlight/resume đúng.
- [ ] Sleep timer hoạt động ở nền, fade-out (hoặc fallback được công bố);
      hàng “Tiếp tục nghe” phát đúng module/cue.
- [ ] Test/l10n/QA có kết quả minh bạch; không đánh dấu hoàn thành nếu bị
      chặn bởi model, SDK hay thiết bị.
- [ ] Sau khi PR #10 đã merge, **mở PR riêng** từ nhánh session của bạn → `main`,
      title đề xuất: `feat(audio): Sherpa TTS offline, nghe nền và sleep timer (P2)`.
      Body nêu các A2 đã làm, nguồn/license/cách cài model và checksum, giới hạn
      nền tảng/fallback, kết quả test/QA thật, thay đổi quyền Android/iOS, rủi ro.
