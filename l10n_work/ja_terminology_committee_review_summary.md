# Tóm tắt thẩm tra thuật ngữ tiếng Nhật - Hội đồng AI

**Ngày:** 2026-10-08  
**Người thẩm tra:** Claude (lượt 1) và Claude Haiku (lượt 2)  
**Trạng thái:** Đã hoàn thành thẩm tra, đang thực hiện thay đổi

## Kết luận cuối cùng

### Thuật ngữ cần thay đổi (ĐỒNG THUẬN)

| # | Pāli | Cũ | Mới | Lý do |
|---|------|-----|-----|-------|
| 1 | Sobhana | 浄好 | **美心所** | 浄好 không phải thuật ngữ chuẩn, 美心所 có nguồn từ Hán truyền |
| 2 | Viratiyo | 戒部分 | **離心所** (nhóm), **三離** (3 chi) | Virati là cetasika cụ thể, không phải sīla |
| 3 | Vipāka | 果報 | **異熟** / **異熟心** | 果報 trong tiếng Nhật thường = "may mắn", dễ nhầm với phala |

### Thuật ngữ giữ nguyên (CÓ CHÚ GIẢI)

| # | Pāli | Hiện tại | Ghi chú |
|---|------|----------|---------|
| 4 | Kiriyā | 唯作 | Giữ nguyên, bác 機能 và 無記 |
| 5 | Ahetuka | 無因 | Giữ nguyên, thêm chú giải: hetu = căn (mūla) |
| 6 | Appamaññā | 無量 | Làm rõ: gồm 悲無量 và 随喜無量 (không phải 四無量心) |
| 7 | Lokuttara | 出世間 | Sửa cách đọc: shusseken (しゅっせけん) |

### Thuật ngữ bị bác

- **BÁC:** 浄好, 戒部分, 果報 (cho vipāka), 機能, 無記, 無根, 因なし, 梵住 (cho appamaññā)

## Vấn đề cần xử lý

### 1. Coverage 103.2% - CẦN KIỂM TRA
- 4452/4312 slots = thừa 140 slots
- Cần kiểm tra slot-by-slot: slot nào thừa, slot nào trống
- Trạng thái "complete" cần bị gỡ cho đến khi kiểm tra xong

### 2. Số đoạn văn nhiều hơn
- Không ép 1:1 theo số đoạn (tiếng Nhật thường tách đoạn khác tiếng Việt)
- Nguyên tắc đúng: **1:1 theo slot ID**
- Các module cần kiểm tra: M4, M5, M12, M13 (có nhiều đoạn hơn nguồn)

### 3. Phiên âm Pāli
- Cần lập style guide: IAST có dấu, Unicode NFC
- Tiêu đề và glossary dùng dạng nguyên mẫu
- Thân bài dùng dạng theo bản Việt
- Báo lỗi của bản nguồn cho nhóm tiếng Việt

### 4. Bản địa hóa
- Chọn hướng C (hybrid)
- Thuật ngữ Abhidhamma theo glossary cố định
- Từ Phật giáo phổ thông dùng từ Nhật có sẵn
- Cảnh giác với từ Đại thừa có thể làm lệch nghĩa Theravāda

## Kế hoạch hành động

### Giai đoạn 1: Thay đổi thuật ngữ (Ưu tiên cao)
- [ ] Thay 浄好 → 美心所
- [ ] Thay 戒部分 → 離心所/三離
- [ ] Thay 果報 → 異熟/異熟心
- [ ] Sửa cách đọc 出世間 → shusseken
- [ ] Thêm chú giải cho 無因 và 悲・随喜

### Giai đoạn 2: Kiểm tra coverage
- [ ] Chạy kiểm tra slot-by-slot
- [ ] Xác định 140 slots thừa
- [ ] Phân loại: (a) tách đoạn, (b) giải thích bổ sung, (c) lỗi
- [ ] Cập nhật validator

### Giai đoạn 3: Chuẩn hóa Pāli
- [ ] Lập Pāli style guide
- [ ] Rà soát toàn bộ phiên âm
- [ ] Báo lỗi bản nguồn

### Giai đoạn 4: Duyệt cuối
- [ ] Người bản ngữ có nền Phật học duyệt
- [ ] Ưu tiên các mục 1, 2, 3, 6

## Tranh luận còn mở

### Mục 5: 無因 hay 無根?
- **Lượt 1:** 無根 "chính xác hơn về lý thuyết"
- **Lượt 2:** Giữ 無因 vì đã quen dùng, 無根 dễ bị đọc thành "vô căn cứ"
- **Kết luận:** Giữ 無因, thêm chú giải

### Mục 6: 随喜 hay 喜?
- **Vấn đề:** 喜 trong Abhidhamma là pīti (hỷ), không phải muditā
- **Giải pháp:** Dùng 随喜 cho muditā, có chú thích để tránh nhầm với "tùy hỷ công đức" Đại thừa
- **Kết luận:** Đồng ý dùng 随喜

## Tài liệu tham khảo

- 南伝大蔵経 (Nanden Daizōkyō)
- 日本テーラワーダ仏教協会
- Abhidhammatthasaṅgaha (bản Hán và Nhật)
- Thanh Tịnh Đạo論 (Visuddhimagga)
