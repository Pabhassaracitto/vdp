# PHIẾU TRẢ LỜI HỘI ĐỒNG — AI-Ngữ văn Ấn–Tích Lan (Gemini) — Vòng 2

> Lưu nguyên văn từ phiên hội đồng do chủ dự án chạy (nhận ngày 2026-10-21).
> Advisory only — chưa áp dụng vào dữ liệu.

### 1. CHẤM RUBRIC (Bảng điểm 3 thành viên)

| Q | Thành viên | Nguồn (30) | Đúng T.Vāda (20) | Nhất quán (20) | Tôn trọng (15) | Dứt khoát (10) | KB không chắc (5) | Tổng | Lý do trừ điểm |
|---|---|---|---|---|---|---|---|---|---|
| Q1–Q12 | **Claude** (AI-Luận sư) | 25 | 15 | 20 | 15 | 10 | 5 | **90** | - Q4: Đề xuất 38 tâm sai chuẩn CMA (trừ 5đ Nguồn, 5đ T.Vāda). - Q10: Dùng 壊業 / 断業 không khớp bộ chuẩn Nhật (trừ 5đ Nguồn). |
| Q1–Q12 | **ChatGPT** (Hán-Nhật) | 25 | 20 | 15 | 5 | 5 | 5 | **75** | - Q2/Q3: Từ chối in con số, làm mất cấu trúc sư phạm gốc của sách Việt (trừ 10đ Tôn trọng, 5đ Nhất quán, 5đ Dứt khoát). |
| Q1–Q12 | **Grok/Qwen** (Phản biện đỏ)| 15 | 10 | 15 | 15 | 5 | 0 | **60** | - Q4: Phán quyết ghi 28, nhưng đòn tấn công #5 lại khẳng định 52, tự mâu thuẫn (trừ 10đ Dứt khoát, 10đ T.Vāda). - Q5: Đòi thêm chi duyên khởi nhưng không đưa ra số trang sách Giác Chánh (trừ 15đ Nguồn). - Q10: Dùng Cựu tự thể 壓迫業, 摧壞業 sai chuẩn Nhật hiện đại (trừ 5đ Nhất quán). |

---

### 2. TRẢ LỜI PHẢN BIỆN ĐỎ #1 (Dựa trên raw JSON)

Dựa hoàn toàn vào nguyên văn 4 chuỗi trong `assets/data/paccayas.json` mà không có gợi ý:
*   **PC_02 paccayuppanna:** Cụm "(trừ tâm không bắt cảnh)" sai giáo lý căn bản vì mọi tâm đều có cảnh. Phán quyết Vòng 1: **GIỮ** (Xóa ngoặc).
*   **PC_11 paccayaDhamma:** "trừ 2 ngũ thức thân" là sai vì hậu sanh duyên không trừ ngũ thức; "tục sanh" đúng nhưng thiếu chính xác (chỉ trừ sát-na). Phán quyết Vòng 1: **GIỮ** (Sửa thành: trừ 4 vô sắc quả và sát-na tục sanh).
*   **PC_12 paccayaDhamma:** Cụm "47 đổng lực hiệp thế" là đúng. Phán quyết Vòng 1: **GIỮ** (Bổ sung trừ đổng lực cuối và đạo tâm).
*   **PC_03 paccayuppanna:** "84 tâm" nằm ở vị trí *paccayuppanna* (pháp được duyên) là sai, vì số tâm nhận cảnh trưởng tối đa là 28. Con số 84 thực chất là số tâm của *paccayaDhamma* (pháp làm cảnh trưởng). Phán quyết Vòng 1: **ĐỔI** (Ghi rõ 28 tâm cho paccayuppanna, xem chi tiết ở mục 3a).

---

### 3. GIẢI QUYẾT 6 ĐIỂM CÒN VÊNH

**a. Q4 (Con số 84 và paccayuppanna):**
*   **Phán quyết:** Con số 84 chính xác là số tâm **LÀM** cảnh trưởng (*paccayaDhamma*), tác giả JSON đã ghi nhầm sang trường *paccayuppanna*. Số tâm thuộc *paccayuppanna* (pháp lấy cảnh trưởng) là **28**.
*   **Nguồn:** *CMA* Chương VIII, Table 8.4 (bản Bodhi). Bảng này ghi rõ: Paccaya (Pháp làm duyên) là 84 cittas (89 trừ 2 sân, 2 si, 1 thân thức thọ khổ); Paccayuppanna (Pháp được duyên) là **28 cittas** (8 tham + 8 đại thiện + 4 đại duy tác tương ưng trí + 8 siêu thế) và 45 cetasikas. Phản biện đỏ ghi 52 cittas ở đòn #5 là sai kiến thức (nhầm với 52 tâm sở tổng quát).

**b. Q2/Q3 (In con số vào dữ liệu không):**
*   **Phán quyết:** **CÓ IN CON SỐ** (85 và 47) vào dữ liệu để giữ văn phong sư phạm của sách Việt gốc.
*   **Với Q3:** 47 đổng lực hiệp thế gồm: 12 bất thiện + 17 thiện hiệp thế (8 đại thiện + 9 thiện đáo đại) + 18 duy tác (8 đại duy tác + 9 duy tác đáo đại + 1 tiếu sanh `hasituppāda`). Tiếu sanh tâm (*hasituppāda*) **CÓ** thuộc āsevana-paccaya vì nó làm nhiệm vụ đổng lực (javana) cho vị A-la-hán và có khả năng trùng dụng.

**c. Q5 (Hetu & Jhāna trong Duyên khởi):**
*   **Phán quyết:** **GIỮ TRỐNG**.
*   **Lý do:** Phản biện đỏ không đưa ra được số trang/đoạn trong sách "Toát Yếu Về Duyên". Theo chuẩn Paṭṭhāna, Hetu và Jhāna không được dùng làm duyên hệ nối trực tiếp các chi Paṭiccasamuppāda như một chuẩn bắt buộc (schema cho phép trống).

**d. Q6 (zh_TW: Āsevana-paccaya):**
*   **Phán quyết:** **KHÔNG XÁC MINH ĐƯỢC**.
*   **Lý do:** Không có nguyên văn bản scan của 尋法比丘 hay 葉均 trong phiên này để trích dẫn chính xác tuyệt đối. Đề nghị trình trưởng lão tra cứu chéo.

**e. Q10 (Bộ 4 kamma tiếng Nhật):**
*   **Phán quyết chốt:** Janaka: **生業**; Upatthambhaka: **支持業**; Upapīḷaka: **妨害業**; Upaghātaka: **殺害業**.
*   **Lý do:** Đây là bộ thuật ngữ chuẩn dùng Tân tự thể (Shinjitai) Nhật Bản, loại bỏ các đề xuất dùng Cựu tự thể (壓, 壞) của Phản biện đỏ.

**f. Q11 (Chính sách Hindi):**
*   **Phán quyết:** **ĐỒNG Ý** hoàn toàn với dự thảo chính sách trong `round1_consensus.md`. Việc lấy Pāḷi-Devanāgarī làm mặc định, chỉ dùng Sanskrit khi có bằng chứng từ giáo trình Theravāda Hindi chỉ định và đưa vào ledger là phương án tối ưu, dung hòa được cả 4 ý kiến Vòng 1.

---

### 4. ĐIỀN "BẤT ĐỒNG VỚI AI KHÁC" (Định dạng Mục 6)

**Q1 — Ārammaṇa-paccaya (paccayuppanna)**
PHÁN QUYẾT: "89 tâm và 52 tâm sở."
ĐỘ TIN CẬY: cao
NGUỒN: *Abhidhammatthasaṅgaha* (CMA) Chương VIII §13.
LÝ DO: Mọi tâm đều bắt cảnh. Ngoặc ghi chú gốc là sai lầm căn bản.
TÁC ĐỘNG LOCALE: không (chỉ sửa nguồn tiếng Việt)
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Không. Đồng thuận 4/4.

**Q2 — Pacchājāta-paccaya (paccayaDhamma)**
PHÁN QUYẾT: "85 tâm (89 tâm trừ 4 tâm quả vô sắc) và 52 tâm sở, ngoại trừ sát-na tâm tục sanh."
ĐỘ TIN CẬY: cao
NGUỒN: *Abhidhammatthasaṅgaha* (CMA) Chương VIII §21.
LÝ DO: 4 tâm quả vô sắc không có sắc thân. Sát-na tục sanh không có sắc sanh trước. Phải giữ con số 85 để khớp giáo trình gốc.
TÁC ĐỘNG LOCALE: không
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Bất đồng với ChatGPT. ChatGPT từ chối in con số 85. Tôi giữ việc in con số vì đây là đặc trưng sư phạm của dữ liệu gốc truyền thống Việt Nam.

**Q3 — Āsevana-paccaya (paccayaDhamma)**
PHÁN QUYẾT: "47 đổng lực hiệp thế (12 bất thiện, 17 thiện hiệp thế, 18 duy tác gồm cả tiếu sanh) và 52 tâm sở tương ưng (ngoại trừ đổng lực cuối cùng trong một lộ và đổng lực đạo)."
ĐỘ TIN CẬY: cao
NGUỒN: *Abhidhammatthasaṅgaha* (CMA) Chương VIII §22.
LÝ DO: Giải trình rõ 18 duy tác bao gồm `hasituppāda` để tránh nhầm lẫn. Đạo tâm không làm trùng dụng duyên cho Quả tâm.
TÁC ĐỘNG LOCALE: không
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Bất đồng với ChatGPT (từ chối in số 47). Tôi giữ con số 47 vì tính rõ ràng.

**Q4 — Adhipati-paccaya (paccayuppanna)**
PHÁN QUYẾT: "Các danh pháp câu sanh; với cảnh trưởng là 28 tâm (8 tâm tham, 8 tâm đại thiện, 4 tâm đại duy tác tương ưng trí, 8 tâm siêu thế) và 45 tâm sở tương ưng."
ĐỘ TIN CẬY: cao
NGUỒN: *Abhidhammatthasaṅgaha* (CMA) Chương VIII Table 8.4.
LÝ DO: Con số 84 gốc bị tác giả JSON gán nhầm từ trường paccayaDhamma. Pháp được duyên (paccayuppanna) chuẩn xác là 28 cittas.
TÁC ĐỘNG LOCALE: không
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Bất đồng với Claude (đề xuất 38) và Phản biện đỏ (đòn #5 nói 52 tâm). Tôi giữ 28 theo đúng Table 8.4 CMA (Bodhi).

**Q5 — Hetu-paccaya & Jhāna-paccaya (operatesInPaticca)**
PHÁN QUYẾT: GIỮ TRỐNG.
ĐỘ TIN CẬY: cao
NGUỒN: Dữ liệu schema VDP cho phép tùy chọn.
LÝ DO: Không có bằng chứng văn bản cụ thể từ sách Giác Chánh để ép gán vào chi Duyên khởi.
TÁC ĐỘNG LOCALE: không
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Bất đồng với Phản biện đỏ (đòi thêm chi). Tôi giữ trống vì Phản biện đỏ không cung cấp được số trang kiểm chứng.

**Q6 — Āsevana-paccaya (zh_TW)**
PHÁN QUYẾT: KHÔNG XÁC MINH ĐƯỢC.
ĐỘ TIN CẬY: cao (cho việc thừa nhận không đủ dữ liệu)
NGUỒN: N/A
LÝ DO: Không có trang scan nguyên văn của 尋法比丘 / 葉均.
TÁC ĐỘNG LOCALE: zh_TW, zh
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Không.

**Q7 — 禪 vs 禅 (zh_TW)**
PHÁN QUYẾT: Dùng 禪 thống nhất toàn bộ cho zh_TW.
ĐỘ TIN CẬY: cao
NGUỒN: CBETA.
LÝ DO: Chuẩn Hán Phồn thể Đài Loan.
TÁC ĐỘNG LOCALE: zh_TW
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Không (Đồng thuận 4/4).

**Q8 — chanda (zh/zh_TW)**
PHÁN QUYẾT: 欲
ĐỘ TIN CẬY: cao
NGUỒN: *阿毘達摩概要精解*.
LÝ DO: Lỗi "一欲" là rác dữ liệu. Đổi thành 欲, Pāḷi key đã có sẵn.
TÁC ĐỘNG LOCALE: zh, zh_TW
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Không (Đồng thuận 4/4).

**Q10 — Upatthambhaka / Upapīḷaka (ja)**
PHÁN QUYẾT: Sinh nghiệp: 生業; Trì nghiệp: 支持業; Chướng nghiệp: 妨害業; Đoạn nghiệp: 殺害業.
ĐỘ TIN CẬY: cao
NGUỒN: ウ・ウェープッラ『アビダンマッタサンガハ』 và ngữ pháp Shinjitai.
LÝ DO: Khớp nghĩa Theravāda và đúng chuẩn chữ Nhật hiện đại.
TÁC ĐỘNG LOCALE: ja
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Bất đồng với Claude (dùng 壊業) và Phản biện đỏ (dùng cựu tự thể 壓迫業, 摧壞業). Tôi giữ bộ 4 từ dùng Shinjitai chuẩn đã nêu.

**Q11 — Chính sách Hindi**
PHÁN QUYẾT: Chấp thuận dự thảo: Pāḷi-Devanāgarī mặc định, ngoại lệ ghi ledger.
ĐỘ TIN CẬY: cao
NGUỒN: Dự thảo consensus Vòng 1.
LÝ DO: Giải quyết dứt điểm tranh chấp, bảo vệ sự thuần khiết của Theravāda.
TÁC ĐỘNG LOCALE: hi
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Không.

**Q12 — Puññābhisaṅkhāra (hi)**
PHÁN QUYẾT: पुञ्ञाभिसंखार
ĐỘ TIN CẬY: cao
NGUỒN: Áp dụng chính sách Q11.
LÝ DO: Dạng Pāḷi-Devanāgarī.
TÁC ĐỘNG LOCALE: hi
BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): Không (Đồng thuận đa số).

---

### 5. BẢNG CUỐI

| Q | Phán quyết của bạn sau Vòng 2 | Tin cậy | Đồng thuận ước tính | Sẵn sàng trình trưởng lão? |
|---|---|---|---|---|
| Q1 | 89 tâm và 52 tâm sở | Cao | 4/4 | Có |
| Q2 | 85 tâm (trừ 4 vô sắc quả) và 52 tâm sở, ngoại trừ sát-na tục sanh | Cao | 3/4 | Có |
| Q3 | 47 đổng lực hiệp thế (gồm cả hasituppāda), trừ đổng lực cuối và đạo | Cao | 3/4 | Có |
| Q4 | 84 là số PaccayaDhamma; Paccayuppanna là 28 tâm | Cao | 3/4 | Có |
| Q5 | GIỮ TRỐNG | Cao | 3/4 | Có |
| Q6 | KHÔNG XÁC MINH ĐƯỢC | Cao | 1/4 | Không (Trình trưởng lão tự tra) |
| Q7 | 禪 (toàn bộ zh_TW) | Cao | 4/4 | Có |
| Q8 | 欲 | Cao | 4/4 | Có |
| Q10| 生業 / 支持業 / 妨害業 / 殺害業 | Cao | 3/4 | Có |
| Q11| ĐỒNG Ý chính sách Pāḷi-Devanāgarī mặc định + ledger ngoại lệ | Cao | 4/4 | Có |
| Q12| पुञ्ञाभिसंखार | Cao | 4/4 | Có |
