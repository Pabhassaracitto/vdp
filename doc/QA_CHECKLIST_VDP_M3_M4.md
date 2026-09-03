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