# Tổng hợp 3 lượt thẩm tra thuật ngữ tiếng Nhật

**Ngày:** 2026-10-08  
**Người thẩm tra:** Claude (lượt 1), Claude Haiku (lượt 2), ChatGPT (lượt 3)

## Biểu quyết cuối cùng

| Pāli | Thuật ngữ | Đồng thuận | Điều kiện |
|------|-----------|------------|-----------|
| Sobhana | **美心所** | Tạm chấp nhận | Cần tìm nguồn Nhật |
| Viratiyo | **離心所** / **三離** | Tạm chấp nhận | Cần tìm nguồn Nhật |
| Vipāka | **異熟** / **異熟心** | Đồng ý | Đã áp dụng |
| Kiriyā | **唯作** / **唯作心** | Đồng ý | Cần xác nhận nguồn Nhật |
| Ahetuka | **無因** / **無因心** | Đồng ý | Thêm chú giải |
| Appamaññā | **無量** (悲・随喜) | Đồng ý | Cần kiểm chứng 随喜 |
| Lokuttara | **出世間** / **出世間心** | Đồng ý | Đọc: shusseken |

## Điểm ChatGPT đính chính

### 1. Về sammākammanta vs sammākammanto

**Không nên gọi sammākammanto là "nguyên mẫu"** (như lượt 2 đề xuất).

Quy tắc đúng:
- **Glossary**: Dùng dạng mục từ theo từ điển chuẩn
- **Trích dẫn**: Giữ đúng dạng ngữ pháp của đoạn trích
- **Bản dịch**: Ghi nhận sai khác với bản Việt, phối hợp sửa nếu có lỗi
- **Unicode**: Chuẩn hóa, không thay đổi chỉ dựa vào hình thức

### 2. Về coverage 103.2%

**4452/4312 KHÔNG đủ để kết luận có 140 slot dư.**

Cần kiểm tra:
1. Xác định tử số và mẫu số đếm gì
2. Đối chiếu tập slot ID nguồn–đích
3. Rà nội dung từng trường hợp (M5_S02, M12_S02)
4. Cho phép slot có nhiều đoạn nếu hệ thống hỗ trợ

**Trạng thái đúng:** "Đã dịch đủ theo kiểm tra tự động hiện tại; đối soát coverage đang chờ"

### 3. Về 8 và 40 tâm siêu thế

- **8 tâm**: 4 đạo + 4 quả (đếm cơ bản)
- **40 tâm**: Khi phân loại theo 5 bậc thiền (mở rộng, không phải cộng thêm)

## Kết luận hội đồng

### ✅ Chấp thuận có điều kiện
- 異熟, 唯作, 無因, 出世間
- Dùng dạng đầy đủ với 心 hoặc 心所 tùy ngữ cảnh

### ⏳ Cần tìm dẫn chứng Nhật trước khi đóng glossary
- 美心所
- 離心所／三離
- 随喜 (cho muditā trong ngữ cảnh 2 tâm sở vô lượng)

### 📋 Trước khi merge
1. ✅ ~~Thay đổi thuật ngữ chính~~ (ĐÃ HOÀN THÀNH)
2. ⏳ Đối soát slot ID và coverage
3. ⏳ Nhờ người bản ngữ có nền tảng Theravāda rà soát

## Tài liệu tham khảo cần tìm

- 南伝大蔵経 (Nanden Daizōkyō)
- 日本テーラワーダ仏教協会 tài liệu
- Abhidhammatthasaṅgaha bản Nhật
- Các sách Abhidhamma bằng tiếng Nhật

## Ghi chú quan trọng

**Đồng thuận giữa các AI không thay thế được nguồn thuật ngữ chuyên ngành.**

Cần:
1. Tìm nguồn Nhật chính thống
2. Đối chiếu với Hán truyền (nếu có)
3. Người bản ngữ có nền Phật học duyệt cuối
