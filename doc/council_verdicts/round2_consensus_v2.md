# `round2_consensus.md` (v2)

**Dự án:** VDP, `DOCTRINE-L10N-001` · **Linear:** IN4-38 (nay có thể là PSRC-38; PM xác nhận)
**Ngày lập:** `PM ĐIỀN` · **Người lập:** Claude (AI-Luận sư) · **PM:** người dùng
**Tính chất:** tư vấn. Quyền quyết định thuộc vị reviewer ghi trên Linear.

## Ghi chú phương pháp

- Cột "đồng thuận" dưới đây là **ước lượng của Claude** sau khi đọc 4 phiếu Round 2. PM đối chiếu lại với phiếu gốc.
- **Không có cột điểm trung bình.** Điểm trung bình ≥85 là điều kiện của protocol, nhưng v1 đã đưa số không có căn cứ. Điểm Claude từng chấm cho người khác (49–95) chỉ là một trong 4 bộ điểm. Muốn có cột này, PM tổng hợp từ 4 phiếu thật.
- Ba mục sau cũng ghi trong file này: ngày tháng, ID `PC_xx`, tên sách.

## I. Bảng tổng hợp

| Q | Nội dung | Đồng thuận (ước lượng) | Điểm TB | Trạng thái |
|---|---|---|---|---|
| Q1 | Xóa ngoặc vuông ở PC_02 | 4/4 | PM ĐIỀN | Đủ điều kiện trình |
| Q2 | Pacchājāta: 85 tâm, trừ tục sinh | 3/4 | PM ĐIỀN | Trình, kèm cờ nghi vấn vế (xem Mục II) |
| Q3 | Āsevana: 47 javana hiệp thế | 4/4 về nguyên tắc | PM ĐIỀN | Trình, kèm câu hỏi mở |
| Q4 | Ārammaṇādhipati: số tâm | 2/4 | PM ĐIỀN | **Round 3** |
| Q5 | `operatesInPaticca` Hetu/Jhāna | 3/4 | PM ĐIỀN | Trình: giữ rỗng |
| Q6 | Āsevana bằng tiếng Trung | 0/4 rõ | PM ĐIỀN | **Round 3** |
| Q7 | 禪 cho zh_TW | 4/4 | PM ĐIỀN | Chữ viết; đã landed `ce97b61` |
| Q8 | 欲 (bỏ 一) | 4/4 | PM ĐIỀN | Chữ viết; đã landed |
| Q10 | 4 loại kamma theo chức năng, tiếng Nhật | 1–2/4 mỗi mục | PM ĐIỀN | **Round 3** |
| Q11 | Chính sách Hindi: Pāḷi-Devanāgarī | 4/4 về nguyên tắc | PM ĐIỀN | Trình |
| Q12 | पुञ्ञाभिसंखार | 3/4 | PM ĐIỀN | Trình |
| Q13 | Myanmar | không áp dụng | không áp dụng | Chờ Myanmar agent. **Không** lẫn với PR #49 (nội dung học tiếng Miến) |

## II. Các câu đủ điều kiện trình

**Q1.** Chỉ xóa phần `[…]` ở PC_02 (`Ārammaṇa-paccaya`). Nguyên tắc: không có tâm nào thiếu cảnh. Nguồn: Paṭṭhāna, Paccayaniddesa (Ārammaṇapaccaya); CMA Ch. VIII (mục ārammaṇa). **Số § và trang cụ thể: KHÔNG XÁC MINH ĐƯỢC**, chưa ai mở sách trong phiên này. Không đề xuất thêm chuỗi JSON nào khác. v1 đã thêm ngoài phạm vi Q1.

> Đối chiếu repo `assets/data/paccayas.json`: `PC_02` hiện có `paccayuppanna: "89 tâm (trừ 2 ngũ thức thân? — chính xác: trừ tâm không bắt cảnh) và 52 tâm sở."` — phần ngoặc chính là chỗ cần xóa theo đồng thuận 4/4.

**Q2.** Hướng đồng thuận: loại 4 tâm quả vô sắc, và loại sát-na tục sinh (chưa có sắc có trước). Chuỗi đề xuất ở vòng 2: *"85 tâm (89 tâm trừ 4 tâm quả vô sắc giới) và 52 tâm sở tương ưng — trừ trong sát-na tục sinh…"*
- **Cờ 1:** vế năng duyên hay sở duyên. Theo `paccayas.json` hiện tại: `PC_11 Pacchājāta-paccaya` có `paccayaDhamma: "85 tâm … và 52 tâm sở"` và `paccayuppanna: "Thân sắc nghiệp sanh trước"` → **85 tâm là vế năng duyên**, trái với cách v1 ghi vào `paccayuppanna`. PM xác nhận hiện trạng JSON trước khi gửi.
- **Cờ 2:** ID. Theo thứ tự chuẩn 24 duyên, pacchājāta là **PC_11**, không phải PC_19 (PC_19 là Sampayutta) như v1 đã ghi. Repo là nguồn xác nhận cuối.
- Nguồn: CMA Ch. VIII, mục pacchājāta. Số § KHÔNG XÁC MINH ĐƯỢC.

**Q3.** Hướng đồng thuận: javana **hiệp thế** gồm 12 + 8 + 9 + 8 + 9 + 1 = **47**, trừ javana cuối của lộ. Magga **không** làm āsevana cho phala. v1 ghi nhầm "hiệp thế và siêu thế", nay đã sửa.
- **Câu hỏi mở cho Trưởng lão** (v1 bỏ sót): gotrabhū và vodāna có được tính trong āsevana không, và nằm ở bên nào?
- **Cần cả hai vế:** năng duyên (javana trước) và sở duyên (javana sau), vì số liệu hai bên có thể khác nhau.
- ID āsevana: **PC_12** theo thứ tự chuẩn (`Āsevana-paccaya` trong repo: `paccayaDhamma: "Đổng lực tâm và tâm sở đi trước"`).

**Q5.** Giữ `operatesInPaticca` rỗng cho Hetu và Jhāna. Lý do: việc phối 24 duyên vào 12 chi là cách ứng dụng của chú giải, không phải yêu cầu của Tạng. Đề xuất ADD của Red Team không có số trang nên không nhận. **v1 viện dẫn "Sāratthadīpanī/Visuddhimagga" là sai và đã bỏ.** Nguồn cho điểm này: KHÔNG XÁC MINH ĐƯỢC; chỉ có cơ sở là nguyên tắc "trường nghi ngờ thì để trống".

> Đối chiếu repo: `PC_01 Hetu` và `PC_17 Jhāna` hiện `operatesInPaticca: []` — giữ rỗng là an toàn.

**Q7, Q8.** Chỉ liên quan chữ viết, không phải giáo lý. Đề nghị Trưởng lão ký riêng hoặc xác nhận tắt. Q7: dùng 禪 (CBETA). Q8: dùng 欲, và khóa Pāḷi hiển thị riêng. Đã landed `ce97b61` / `a7962aa`.

**Q11.** Hindi mặc định là Pāḷi viết Devanāgarī. Dùng dạng Sanskrit chỉ khi (a) có trong sách Hindi Theravāda được chỉ định, (b) không làm lệch nghĩa, (c) ghi trong `doc/l10n_evidence/hi/`. Khi hai dạng cùng có chứng cứ, ưu tiên dạng giữ âm Pāḷi. Tên Rewata Dhamma và Dharmarakshita **chưa có thành viên nào kiểm trực tiếp**, nên chỉ là nguồn dự kiến.

**Q12.** पुञ्ञाभिसंखार, theo chính sách Q11. Cần dòng glossary sau khi thống nhất hai dạng अभिसंस्कार/अभिसंखार.

## III. Các câu sang Round 3

**Q4: phiếu Round 3 của Claude (chưa kiểm chứng):**
- Hướng nghiêng: **28 tâm** = 8 lobhamūla + 8 mahākusala + 4 mahākiriya-ñāṇasampayutta + 8 lokuttara. Vòng 2 tôi đã rút số 38 của mình, và Red Team đưa 52 tự mâu thuẫn.
- **Con số 45 tâm sở và dòng "180 pháp" trong v1: bỏ.** Không ai đối chiếu được.
- Nguồn cần mở: Saṅgaha, phần Paccayaparicchedo, và CMA Table 8.4. **KHÔNG XÁC MINH ĐƯỢC.**
- Cờ cấu trúc: repo `PC_03 Adhipati` hiện `paccayuppanna: "Các danh pháp câu sanh; với cảnh trưởng là 84 tâm (trừ tâm quả vô nhân...) và tâm sở tương ưng."` → 84 đã biết sai theo 4/4, cần xem đó là trường của Adhipati chung hay tiểu mục ārammaṇādhipati.
- Cần nhờ **3 AI còn lại** mở nguồn và trả lời.

**Q6: Claude không tra được gì.**
- Ba ứng viên: 習行緣 (hiện tại), 習緣, 重複緣. Mọi lời gán "Diệp Quân dùng X" hay "Tầm Pháp dùng Y" trong v1 là **không có căn cứ** và đã rút. Tên "Kosei Rathapāla" cũng không xác minh được.
- Nếu không ai có số trang: giữ nguyên 習行緣, hoặc để trống chờ nguồn.

**Q10: Claude không tra được gì.**
- Các cặp cần xét: Janaka (生業 hay 生起業), Upatthambhaka (支持業), Upapīḷaka (妨害業 hay 圧迫業), Upaghātaka (破壊業 hay 殺害業 hay 壊業). Đây chỉ là **danh sách ứng viên**, không phải kết quả tra cứu.
- Hai chữ rác "Chu央公論社" và "U Weconfiguration" trong v1 đã bỏ. Về hình thức chữ, chỉ nhớ rằng bản repo nên dùng shinjitai (圧/壊) cho nhất quán.
- Sách của Mizuno Kōgen và U Wepulla: chưa ai kiểm số trang.

## IV. Thu hồi

Bản `round2_consensus.md` v1 ngày 24/05/2024 và `verdict_sheet_elder.md` v1 được **thu hồi**. Bản v2 này thay thế, với mọi chỗ không có nguồn đều ghi KHÔNG XÁC MINH ĐƯỢC.
