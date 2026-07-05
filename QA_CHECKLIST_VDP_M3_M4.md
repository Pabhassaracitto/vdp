# Manual QA Checklist - VDP M3 + M4

## 1. Smoke Test (Kiểm tra nhanh)
- [ ] App khởi chạy thành công, không crash.
- [ ] Màn hình chính (Home) hiển thị đầy đủ các module học tập.
- [ ] Truy cập được vào một `Study Path` bất kỳ.
- [ ] Mở được một `Quiz` và hoàn thành ít nhất 1 câu hỏi.
- [ ] Kiểm tra tính năng `TTS` (Text-to-Speech) hoạt động (phát âm đúng).

## 2. Regression Test (Kiểm tra hồi quy)
- [ ] `Study Path`: Các module đã học được đánh dấu hoàn thành đúng.
- [ ] `Quiz Engine`: Logic tính điểm và hiển thị kết quả sau khi làm quiz không bị sai lệch.
- [ ] `Bookmark`: Thêm/xóa bookmark trên các mục (Citta, Cetasika, v.v.) hoạt động ổn định.
- [ ] `Settings`: Thay đổi cài đặt (theme, ngôn ngữ) được áp dụng ngay lập tức.
- [ ] Điều hướng: Các nút Back/Home hoạt động đúng, không bị kẹt màn hình.

## 3. Accessibility Test (Kiểm tra khả năng truy cập)
- [ ] `High Contrast`: Chế độ tương phản cao hiển thị rõ ràng, không bị mất chữ hoặc nút bấm.
- [ ] `Screen Reader`: Các thành phần UI (nút, danh sách, tiêu đề) được gắn nhãn (semantics) đầy đủ cho TalkBack/VoiceOver.
- [ ] `Text Scaling`: Tăng kích thước font chữ hệ thống lên mức tối đa:
    - [ ] UI không bị vỡ layout.
    - [ ] Chữ không bị cắt mất (tràn khung).
    - [ ] Các nút bấm vẫn có thể nhấn được.

## 4. Persistence/Offline Test (Kiểm tra lưu trữ & Offline)
- [ ] `Progress Persistence`:
    - [ ] Học xong một bài, thoát app, mở lại -> Tiến độ vẫn được lưu.
    - [ ] Làm quiz dở dang, thoát app, mở lại -> Trạng thái quiz được khôi phục.
- [ ] `Offline Mode`:
    - [ ] Tắt mạng, mở app -> App vẫn truy cập được nội dung đã tải.
    - [ ] Dữ liệu (citta, cetasika) hiển thị đúng khi không có internet.

## 5. Edge Cases (Trường hợp đặc biệt)
- [ ] `Spaced Repetition`: Kiểm tra logic hiển thị thẻ ôn tập khi đến hạn (đặc biệt là khi thay đổi ngày giờ hệ thống).
- [ ] `Quiz`: Làm quiz với tốc độ nhanh (spam nút chọn) xem có bị lỗi logic không.
- [ ] `TTS`: Phát âm các từ Pali phức tạp hoặc chuỗi văn bản dài xem có bị ngắt quãng bất thường.
- [ ] `Memory`: Chuyển đổi liên tục giữa các màn hình (Study -> Quiz -> Home) trong thời gian dài xem có bị rò rỉ bộ nhớ (lag/giật).
- [ ] `Empty State`: Kiểm tra màn hình khi chưa có dữ liệu (ví dụ: chưa có bookmark nào, chưa học module nào).
