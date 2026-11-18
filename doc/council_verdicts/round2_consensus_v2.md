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
| Q2 | Pacchājāta (PC_11): 85 tâm thuộc **paccayaDhamma** | 3/4 | PM ĐIỀN | Trình — đã xác nhận vế, sửa trường (Mục II) |
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

**Q2.** Hướng đồng thuận: loại 4 tâm quả vô sắc, và loại sát-na tục sinh (chưa có sắc có trước). Chuỗi đề xuất ở Vòng 2 (*) vẫn dùng được nhưng **phải ghi vào `paccayaDhamma` của PC_11** (năng duyên), không phải `paccayuppanna`; giữ nguyên câu chữ gốc còn lại, chỉ sửa số và phần loại trừ.
> (*) *“85 tâm (89 tâm trừ 4 tâm quả vô sắc giới) và 52 tâm sở tương ưng — trừ trong sát-na tục sinh…”* — lý do loại trừ (không có thân sắc có trước, không có sắc thân ở cõi vô sắc) hợp với vế năng duyên, nên chỉnh theo hướng “85 tâm … ở paccayaDhamma của PC_11”.
- **Đã xác nhận repo `assets/data/paccayas.json`:** `PC_11 Pacchājāta-paccaya` có `paccayaDhamma: "85 tâm (trừ 2 ngũ thức thân và tâm tục sanh? — chính xác: 85 tâm dục, sắc, vô sắc, siêu thế trừ tục sanh) và 52 tâm sở."` và `paccayuppanna: "Thân sắc nghiệp sanh trước"` → **85 tâm thuộc năng duyên**. V1 đặt sai trường, v2 sửa; không còn cờ “vế nào?”.
- **ID:** pacchājāta là **PC_11**; PC_19 là Sampayutta; PC_12 là Āsevana (đã đối chiếu repo, gỡ cờ).
- Nguồn: CMA Ch. VIII, mục pacchājāta. Số § KHÔNG XÁC MINH ĐƯỢC.

**Q3.** Hướng đồng thuận: javana **hiệp thế** gồm 12 + 8 + 9 + 8 + 9 + 1 = **47**. v1 ghi nhầm "hiệp thế và siêu thế", nay đã sửa thành hiệp thế.
- **Cần cả hai vế:** năng duyên (javana trước) và sở duyên (javana sau) — tờ trình nêu: 47 nằm ở `paccayaDhamma`, `paccayuppanna` hay cả hai. Hiện `PC_12` repo ghi `paccayaDhamma: "Đổng lực tâm và tâm sở đi trước (trừ đổng lực thứ 7 và đổng lực siêu thế? — chính xác: trừ đổng lực cuối và đổng lực đạo)."` và `paccayuppanna: "Đổng lực tâm và tâm sở sanh liền sau."` — cần làm rõ hai ô.
- **Tất cả các câu sau là câu hỏi cho Trưởng lão, không viết thành khẳng định:**
  - Loại trừ bên năng duyên (trừ javana cuối lộ) và bên sở duyên (trừ javana đầu lộ) có khác nhau không?
  - Magga có làm āsevana cho phala không?
  - Gotrabhū và vodāna có được tính trong āsevana không, và nằm ở bên nào?
- ID āsevana: **PC_12** theo thứ tự chuẩn (đã đối chiếu repo). PC_11 = Pacchājāta; PC_19 = Sampayutta.

**Q5.** Giữ `operatesInPaticca` rỗng cho Hetu và Jhāna. Lý do: việc phối 24 duyên vào 12 chi là cách ứng dụng của chú giải, không phải yêu cầu của Tạng. Đề xuất ADD của Red Team không có số trang nên không nhận. **v1 viện dẫn "Sāratthadīpanī/Visuddhimagga" là sai và đã bỏ.** Nguồn cho điểm này: KHÔNG XÁC MINH ĐƯỢC; chỉ có cơ sở là nguyên tắc "trường nghi ngờ thì để trống".

> Đối chiếu repo: `PC_01 Hetu` và `PC_17 Jhāna` hiện `operatesInPaticca: []` — giữ rỗng là an toàn.

**Q7, Q8.** Chỉ liên quan chữ viết, không phải giáo lý. Đề nghị Trưởng lão ký riêng hoặc xác nhận tắt. Q7: dùng 禪 (CBETA). Q8: dùng 欲, và khóa Pāḷi hiển thị riêng. Đã landed `ce97b61` / `a7962aa`.

**Q11.** Hindi mặc định là Pāḷi viết Devanāgarī. Dùng dạng Sanskrit chỉ khi (a) có trong sách Hindi Theravāda được chỉ định, (b) không làm lệch nghĩa, (c) ghi trong `doc/l10n_evidence/hi/`. Khi hai dạng cùng có chứng cứ, ưu tiên dạng giữ âm Pāḷi. Tên Rewata Dhamma và Dharmarakshita **chưa có thành viên nào kiểm trực tiếp**, nên chỉ là nguồn dự kiến.

**Q12.** पुञ्ञाभिसंखार, theo chính sách Q11. Cần dòng glossary sau khi thống nhất hai dạng अभिसंस्कार/अभिसंखार.

## III. Các câu sang Round 3

**Q4: chuỗi gốc tự mâu thuẫn — NGHI VẤN, ĐANG ĐỐI CHIẾU (không khuyến nghị số):**
- Giả thuyết cũ "84 thuộc sahajātādhipati" **đã bỏ**: nguyên văn ghi "**với cảnh trưởng** là 84 tâm", nên 84 thuộc ārammaṇādhipati.
- Chuỗi gốc tự mâu thuẫn: "84 tâm (trừ tâm quả vô nhân...)" — trừ 18 tâm vô nhân khỏi 89 còn 71, không phải 84; `...` nghĩa danh sách loại trừ bị cắt (IN4-51 đã báo), không thể suy ra tập 84 từ dòng này.
- Nghi vấn mới (suy luận, chưa kết luận): ārammaṇādhipati có cảnh được **trọng** (năng duyên) và tâm **trọng cảnh** (sở duyên); tâm trọng cảnh phải là javana, 84 tâm gồm cả tâm quả không hợp làm sở duyên — 84 có thể nằm **sai vế**, giống lỗi Q2. Nếu đúng, tập 8+8+4+8 mà trước đây nghiêng về sẽ là vế sở duyên. Nhớ lơ mơ CMA §14 có bảng như vậy nhưng **KHÔNG XÁC MINH ĐƯỢC** — Round 3 phải mở nguồn.
- Số 52 của Red Team có thể thuộc nửa sahajātādhipati hoặc không — **không ghi như khẳng định**.
- Phần trước `;` ("Các danh pháp câu sanh" = nửa sahajātādhipati) **chưa có con số nào — chưa đụng đến**, ghi rõ để tránh hiểu là đã xử lý.
- Việc tách theo tiểu mục là **thay đổi cấu trúc, thuộc IN4-55**; trong schema hiện tại chỉ sửa văn bản chuỗi khi Trưởng lão duyệt.
- **Con số 45 tâm sở và dòng "180 pháp" trong v1: bỏ.** Không ai đối chiếu được. Nguồn cần mở: Saṅgaha Paccayapariccheda và CMA §14/Table 8.4 — **KHÔNG XÁC MINH ĐƯỢC**.
- Nguyên văn PC_03: xem phụ lục `verdict_sheet_elder_v2.md` (đã dán JSON) — ba câu con ở Mục IV.

**Q6: Claude không tra được gì.**
- Ba ứng viên: 習行緣 (hiện tại), 習緣, 重複緣. Mọi lời gán "Diệp Quân dùng X" hay "Tầm Pháp dùng Y" trong v1 là **không có căn cứ** và đã rút. Tên "Kosei Rathapāla" cũng không xác minh được.
- Nếu không ai có số trang: giữ nguyên 習行緣, hoặc để trống chờ nguồn.

**Q10: Claude không tra được gì.**
- Các cặp cần xét: Janaka (生業 hay 生起業), Upatthambhaka (支持業), Upapīḷaka (妨害業 hay 圧迫業), Upaghātaka (破壊業 hay 殺害業 hay 壊業). Đây chỉ là **danh sách ứng viên**, không phải kết quả tra cứu.
- Hai chữ rác "Chu央公論社" và "U Weconfiguration" trong v1 đã bỏ. Về hình thức chữ, chỉ nhớ rằng bản repo nên dùng shinjitai (圧/壊) cho nhất quán.
- Sách của Mizuno Kōgen và U Wepulla: chưa ai kiểm số trang.

## IV. Gửi Round 3 cho C / M / G / R (bản sửa Q4 — thay thế bản trước)

> **Q4 (bản sửa).** PC_03 `paccayuppanna` ghi "với cảnh trưởng là 84 tâm (trừ tâm quả vô nhân...) và tâm sở tương ưng"; `paccayaDhamma` chỉ ghi "cảnh trưởng (cảnh được coi trọng)" không có số.
> (a) Theo Saṅgaha (Paccayapariccheda) và CMA Ch. VIII §14/Table 8.4, vế **năng duyên** (cảnh được trọng) và vế **sở duyên** (tâm trọng cảnh) của ārammaṇādhipati mỗi vế gồm bao nhiêu tâm, tâm sở và pháp nào? Số §/trang.
> (b) Danh sách loại trừ đầy đủ đằng sau "trừ ... " là gì?
> (c) 84 thuộc vế nào?
> Không mở được nguồn thì ghi `KHÔNG XÁC MINH ĐƯỢC`. Không đoán số.

> **Q6/Q10 giữ nguyên:**
> - **Q6:** Āsevana-paccaya trong bản dịch Trung văn Theravāda: có số trang cho 習行緣, 習緣 hoặc 重複緣 không?
> - **Q10:** Bốn kamma theo chức năng (janaka, upatthambhaka, upapīḷaka, upaghātaka) trong sách Nhật Theravāda: số trang? Dùng shinjitai.

## V. Trạng thái và thu hồi

- **Q4 đổi cách hỏi** (ba câu con, không còn A/B 28 vs 84), nên tờ trình **chưa gửi Trưởng lão** cho tới khi Round 3 có §/trang — đúng chỉ đạo mục 4 của hội đồng.
- Bản `round2_consensus.md` v1 ngày 24/05/2024 và `verdict_sheet_elder.md` v1 được **thu hồi**. Bản v2 này thay thế, với mọi chỗ không có nguồn đều ghi KHÔNG XÁC MINH ĐƯỢC. Q2 đã sửa trường (85 ∈ `paccayaDhamma` của **PC_11**); Q4 bỏ giả thuyết sahajātādhipati, chuyển sang nghi vấn sai vế; Q3 chuyển mọi khẳng định thành câu hỏi.
