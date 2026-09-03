📊 [VDP] Project Progress — Kanban Board
Ngày cập nhật: 2026-07-03
Sprint hiện tại: [Phase 2]
Mục tiêu Sprint: [Tối ưu giao diện Bảng Tương Ưng landscape]

📋 Backlog (Kho tính năng / Nhiệm vụ lâu dài)
Gom tất cả các ý tưởng, tính năng sẽ làm trong tương lai nhưng chưa ưu tiên làm ngay vào đây.

🚀 Features (Tính năng mới)
[ ] Implement hệ thống [Tính năng A] (Ví dụ: Authentication, Push Notification)
[ ] Thiết kế UI/UX cho màn hình [Tên màn hình]
[ ] Thêm chế độ hoạt động ngoại tuyến (Offline mode với local caching)
[ ] Hỗ trợ đa ngôn ngữ (Localization - i18n)

🛠️ Optimization & Tech Debt (Tối ưu hóa & Sửa lỗi tồn đọng)
[ ] Tối ưu hóa dung lượng bundle size và hiệu năng ứng dụng (Performance)
[ ] Viết Unit Test & Integration Test (Đặt mục tiêu Coverage > 80%)
[ ] Fix các lỗi cảnh báo Deprecation (flutter analyze / eslint warnings)
[ ] Triển khai Dark Theme/Light Theme đồng bộ theo hệ thống thiết kế (Design System)

📦 DevOps & Deployment (Vận hành & Phát hành)
[x] Đã thêm logo cho dự án (Đa nền tảng)
[ ] Cấu hình CI/CD tự động (GitHub Actions, Fastlane, Docker)
[ ] Thiết lập môi trường Staging và Production riêng biệt (.env.staging, .env.production)
[ ] Tạo Git commit / Tag release cho toàn bộ thay đổi lớn

🎯 To Do (Danh sách việc cần làm trong Sprint hiện tại)
Đây là các task được bốc từ Backlog lên và bắt buộc phải hoàn thành trong Sprint này.

🏗️ Phase 1: Core Logic & Infrastructure (Hạ tầng)
[x] Thiết lập cấu trúc dữ liệu cốt lõi (M1-T1)
[x] Kiểm tra tính nhất quán dữ liệu 121 Tâm & 52 Tâm sở (M1-T2)
[x] Thiết lập Cấu trúc thư mục chuẩn và khởi tạo dự án
[x] Viết Service/Cơ sở dữ liệu quản lý State cục bộ (Local Storage Service)
[x] Cấu hình các gói phụ thuộc (Dependencies/Packages) trong file quản lý dự án
[x] Thêm logo cho dự án
🎨 Phase 2: UI/UX & Components (Giao diện)
[x] Tối ưu hóa giao diện Bảng Tương Ưng cho thiết bị landscape
[ ] Hoàn thiện Component [A] kết nối dữ liệu dạng Reactive (Tự động cập nhật giao diện)
[ ] Xây dựng màn hình [B] xử lý các trạng thái: Loading, Error Fallback UI, và Success State
[x] Bổ sung Tứ Nghĩa (4 aspects) vào CetasikaModel và Detail Sheet
[x] M2-T2: Thêm tính năng "Mở khóa tất cả bài học"
[x] M2-T3: Persist trạng thái dismiss warning banner
[x] M2-T4: Thêm tính năng Tìm kiếm vào Bảng Tương Ưng
[x] M3-T5A: Bookmark & Notes backend (UserProgress + ProgressNotifier + persist)

🧪 Phase 3: Integration & QA (Tích hợp & Kiểm thử)
[x] DATA-04: Tích hợp Dữ liệu M5 (Rupa, Kamma, Paticca, Vithi) vào VdpRepository
[x] M3+M4: Soạn thảo Manual QA Checklist (2026-07-05)
[ ] Tích hợp API/SDK từ bên thứ ba (OpenAI, Firebase, RESTful API)
[ ] Chạy lệnh kiểm tra mã nguồn toàn cục để đạt 0 lỗi

🚧 In Progress (Đang thực hiện)
Chỉ kéo tối đa 1-2 task từ mục To Do xuống đây để tập trung giải quyết, tránh ôm đồm.
[ ] Tối ưu hóa tương tác người dùng trên Bảng Tương Ưng.
[x] M1-T4: Xóa debug log tạm thời

✅ Done (Đã hoàn thành)
Lưu trữ lịch sử theo từng Sprint. Định dạng ghi rõ: Tên Sprint — Tính năng chính (Ngày hoàn thành) để sau này dễ làm báo cáo Release Notes.
Sprint: [Phase 2] — Tối ưu hóa giao diện Bảng Tương Ưng landscape (2026-06-30)
✅ Tối ưu giao diện landscape: điều chỉnh headerWidth, cellSize, cetasikaHeaderHeight.
✅ Ẩn legend khi landscape để tăng diện tích hiển thị.
✅ Xử lý Data Layer: Hoàn thiện các Model dữ liệu, hàm fromJson/toJson và cơ chế đồng bộ.
✅ Cập nhật UI: Tích hợp các Widget, tối ưu hiệu ứng hiển thị (Ví dụ: Thêm AnimatedOpacity cho smooth chuyển cảnh).
✅ Fix Bugs: Khắc phục triệt để lỗi Runtime gây crash ứng dụng (TypeError: type 'Null' is not a subtype...).
✅ Verification: Chạy lệnh kiểm tra hệ thống → 0 errors, 0 warnings (Build hoàn toàn thành công).
✅ Thêm logo cho dự án (Đa nền tảng)
✅ Bổ sung Tứ Nghĩa (4 aspects) vào CetasikaModel và Detail Sheet (2026-06-30)
✅ M2-T4: Thêm tính năng Tìm kiếm vào Bảng Tương Ưng (2026-07-01)
✅ DATA-04: Tích hợp Dữ liệu M5 (Rupa, Kamma, Paticca, Vithi) vào VdpRepository (2026-07-02)
✅ M3-T5A: Bookmark & Notes backend — UserProgress mở rộng 3 field, ProgressNotifier thêm 7 methods, persist SharedPreferences, bookmarkCountProvider (2026-07-03)
✅ M3+M4: Soạn thảo Manual QA Checklist (2026-07-05)

🚫 Blocked / Issues (Điểm nghẽn / Lỗi nghiêm trọng)
Nơi ghi nhận các vấn đề đang bị tắc nghẽn chưa thể giải quyết ngay (do thiếu thư viện, đợi API từ backend, hoặc dính bug từ bên thứ 3).

📝 Notes (Ghi chú kiến trúc & Quyết định quan trọng)
🗺️ Sơ đồ cấu trúc thư mục (Architecture Folder Tree)
lib/ hoặc src/
├── main.dart            ← Điểm khởi chạy hệ thống (Entry Point)
├── core/                ← Cấu hình dùng chung: theme, router, enums, constants
├── data/                ← Tầng dữ liệu: models, repositories, local/remote services
├── logic/               ← Tầng xử lý logic nghiệp vụ, quản lý state bài toán
└── presentation/        ← Tầng hiển thị giao diện: screens, components, widgets

🔀 Bảng đối chiếu ánh xạ dữ liệu (Data/Enum Mappings)
Khái niệm hệ thống | Nhánh / Khối A | Nhánh / Khối B | Ghi chú quyết định
[Ví dụ: Level] | EnglishLevel | CEFRLevel | Thống nhất dùng CEFRLevel

🚀 Quy trình khởi tạo / Thứ tự chạy code (Initialization Order)
Khởi tạo Widget Binding → Khởi tạo Local Storage (SharedPrefs) → Init các Singleton Services → Chạy hàm root App (runApp)

🎯 Definition of Done (Định nghĩa trạng thái hoàn thành)
[x] Dự án chạy lệnh kiểm tra mã nguồn tĩnh không còn lỗi nghiêm trọng nào (0 errors).
[ ] Chạy thử nghiệm thực tế thành công trên thiết bị mô phỏng hoặc thiết bị thật.
[ ] Code sạch, không chứa các đoạn "code rác" (commented-out code) hoặc print log dư thừa.
