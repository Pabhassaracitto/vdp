# VDP | Audio Web — TTS và chọn giọng đọc

## Đã tích hợp trong ứng dụng Flutter Web

Web hiện dùng **`flutter_tts` → Web Speech API (`window.speechSynthesis`)** cho cùng các phiên nghe bài học / Nhân Duyên / Bảng Tương Ưng đang có trên mobile. Không cần API key, server TTS hay tải file audio để nghe bằng trình duyệt.

Trong **Cài đặt → Nghe & Tô sáng → Browser voice / Giọng đọc trình duyệt**:

- Chọn giọng riêng cho từng ngôn ngữ nội dung; lựa chọn được lưu trong `SharedPreferences` (local storage của web).
- Nút **Nghe thử** phát mẫu qua cùng TTS engine dùng cho playlist.
- Chế độ **Tự động** ưu tiên giọng tiếng Việt có tên/metadata nhận diện được là nam, đặc biệt `NamMinh`; nếu không có thì dùng giọng `vi-VN` mà trình duyệt cung cấp. `Neural2-D`, `Wavenet-B` và `Wavenet-D` cũng được nhận diện nếu những tên này xuất hiện trong danh sách browser.
- Danh sách và chất lượng giọng phụ thuộc trình duyệt, hệ điều hành, giọng đã cài và quyền của người dùng. Web Speech API không chuẩn hóa metadata giới tính, vì vậy “ưu tiên Nam” là heuristic, không phải bảo đảm giới tính thực tế.
- Tốc độ, tạm dừng, dừng, chuyển mục, phát lặp và trạng thái karaoke đi qua player hiện có. Trình duyệt có thể giới hạn autoplay, chạy nền hoặc phát khi thiết bị khóa.

Các điểm mã nguồn chính:

- `lib/features/audio/data/web_tts_voice.dart` — parse danh sách voice, locale matching và chọn giọng Nam tiếng Việt theo thứ tự ưu tiên.
- `lib/features/audio/services/web_tts_voice_preferences.dart` — lưu voice theo ngôn ngữ nội dung.
- `lib/features/audio/providers/web_tts_voice_settings_provider.dart` — tải voice từ trình duyệt và phát mẫu.
- `lib/features/audio/widgets/web_tts_voice_settings_section.dart` — picker trong Cài đặt.
- `lib/features/audio/players/tts_track_player.dart` — áp voice đã chọn trước mỗi câu, vẫn giữ cơ chế fallback theo locale.
- `lib/features/audio/players/default_track_player.dart` — conditional factory để Flutter Web chỉ compile browser TTS, không kéo `dart:io` / native file cache vào web build.
- `test/web_tts_voice_test.dart` — test parse, chọn voice, fallback locale và lưu tùy chọn.

Nếu danh sách trống, hãy bấm **Tải lại danh sách giọng** sau khi trình duyệt tải voice xong; cài voice tương ứng trong hệ điều hành nếu cần. Lựa chọn chỉ áp dụng cho đúng ngôn ngữ của nội dung, không ép tiếng Nhật/Trung/Myanmar đọc bằng giọng tiếng Việt.

## Google Cloud TTS / Edge TTS cho giọng neural MP3

Cloud TTS là lựa chọn **nâng cấp**, không phải backend đang được GitHub Pages của VDP gọi. Mã web tĩnh không được chứa Google API key, Edge token, service-account JSON hay credential khác. Google Cloud Text-to-Speech cần gọi từ một **backend/proxy tin cậy**; Edge TTS cũng nên gọi qua proxy do bạn kiểm soát (đặc biệt với implementation không chính thức).

Có ví dụ demo độc lập tại `docs/examples/`:

- `audio_web_tts_demo.html` — textarea, chọn provider/ngôn ngữ/giới tính, Play/Pause/Stop và `<audio>`.
- `audio_web_tts_demo.js` — `ProxyTtsPlayer.speak(text, options)` async, nhận MP3 Blob từ endpoint, phát Blob URL và phát sự kiện `onPlay`, `onPause`, `onEnded`, `onError`.
- `audio_web_tts_demo.css` — kiểu responsive.
- `google_tts_proxy.mjs` — ví dụ Node.js proxy Google dùng Application Default Credentials; **không dùng API key ở trình duyệt**. Proxy mẫu chỉ triển khai Google; nếu bật “Edge” trong demo, cần cài adapter Edge tại route `/api/tts` theo cùng hợp đồng request/response.

### Chạy proxy Google khi phát triển

1. Tạo Google Cloud project, bật **Cloud Text-to-Speech API**, và cấp quyền tối thiểu cần thiết cho service account của proxy. Trên Cloud Run dùng service account gắn với service / Workload Identity; khi chạy local có thể cấu hình ADC bằng Google Cloud CLI.
2. Cài dependency server:

   ```bash
   npm install google-auth-library
   ```

3. Chạy proxy ở terminal thứ nhất và host demo tĩnh ở terminal thứ hai:

   ```bash
   APP_ORIGIN="http://localhost:8080" PORT=8081 node docs/examples/google_tts_proxy.mjs
   python3 -m http.server 8080 --directory docs/examples
   ```

   Trong `audio_web_tts_demo.js`, đổi `endpoint` thành `http://localhost:8081/api/tts` để local demo gọi proxy khác origin. Trong môi trường thật đặt `APP_ORIGIN` thành **origin chính xác** của web app (ví dụ `https://pabhassaracitto.github.io`, không thêm path `/vdp`). Không đưa file service-account hoặc credential vào Git.
4. Nếu frontend và proxy khác origin, cấu hình CORS allowlist đúng origin như trên. Cách đơn giản hơn là đặt reverse proxy để trình duyệt gọi URL cùng origin `/api/tts`.
5. Ví dụ mặc định cho `vi-VN` + Nam là `vi-VN-Neural2-D`; giọng Edge tương ứng có thể là `vi-VN-NamMinhNeural`. Proxy phải allowlist tên voice thay vì nhận tên bất kỳ từ client.

GitHub Pages chỉ host file tĩnh nên **không chạy được** `/api/tts`. Cần deploy proxy riêng (Cloud Run, Cloud Functions, Azure Function, hoặc server của bạn) và kết nối CORS/reverse proxy phù hợp. Ví dụ `audio_web_tts_demo.js` dùng endpoint cùng origin mặc định; thay endpoint khi proxy đặt ở domain khác.

### Giới hạn triển khai thực tế

- Hạn mức, chi phí, kích thước request và quota của Google phụ thuộc project, voice và cấu hình dịch vụ. Proxy cần kiểm tra độ dài đầu vào, giới hạn concurrency/rate theo IP hoặc tài khoản, timeout, cache theo `text + locale + voice + tốc độ`, và không ghi nội dung nhạy cảm vào log.
- Không cho client truyền URL tùy ý, voice tùy ý hoặc chọn provider không có allowlist; trả `audio/mpeg` và giới hạn CORS. Không bật CORS `*` nếu endpoint có xác thực/cookie.
- Với Edge TTS, giữ chi tiết dịch vụ và mọi token ở server; implementation proxy phải tuân thủ điều khoản dịch vụ và không phụ thuộc endpoint công cộng không ổn định.
- Trình duyệt có thể từ chối autoplay, chặn Web Speech trong tab nền, hoặc không có voice tiếng Việt. Gọi `play()` từ thao tác người dùng; bắt lỗi và cho phép thử lại.
- Phát MP3 qua `Blob`/`URL.createObjectURL` phù hợp demo ngắn; luôn `URL.revokeObjectURL` khi dừng, lỗi hoặc kết thúc như trong ví dụ. Với đoạn dài, chia câu/đoạn, hủy request cũ và không gửi nhiều lượt tổng hợp đồng thời.
- CORS phải được xử lý tại proxy (preflight `OPTIONS`, `Access-Control-Allow-Origin`), không thể sửa bằng Flutter/JS nếu dịch vụ Cloud không cho phép origin.

## Kiểm thử

```bash
flutter test test/web_tts_voice_test.dart
flutter test test/audio_tts_rate_test.dart test/audio_player_test.dart
flutter build web --release --base-href "/<repo>/"
```

Thử nghe thủ công bằng Chrome/Edge/Safari: chọn tự động tiếng Việt, chọn một voice có tên `NamMinh` nếu có, nghe thử, đổi voice và đọc lại cùng một đoạn để kiểm tra voice cũ không bị giữ lại. Kiểm tra locale vi/en/ja/zh-TW/my nếu browser đã cài các voice tương ứng.
