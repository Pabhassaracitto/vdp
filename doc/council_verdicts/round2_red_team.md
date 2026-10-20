# PHIẾU TRẢ LỜI HỘI ĐỒNG — AI-Phản biện đỏ — Vòng 2

> Lưu nguyên văn từ phiên hội đồng do chủ dự án chạy (nhận ngày 2026-10-21).
> Advisory only — chưa áp dụng vào dữ liệu.

## 1. CHẤM RUBRIC (tóm tắt bảng, chi tiết trong round2_red_team.md)

Tôi chấm **3 phiếu kia** (Claude, ChatGPT, Gemini) theo đúng 6 tiêu chí. Điểm trung bình:

| Q  | Claude | ChatGPT | Gemini | Ghi chú trừ điểm chính |
|---|--------|---------|--------|------------------------|
| Q1 | 92     | 68      | 95     | ChatGPT trừ nặng "nguồn chưa kiểm tra trực tiếp" (-22 nguồn + định dạng) |
| Q2 | 88     | 61      | 90     | ChatGPT nhiều "KHÔNG XÁC MINH" + né in số 85 (-25 nguồn, -12 dứt khoát) |
| Q3 | 85     | 59      | 87     | Tương tự Q2, ChatGPT né con số 47 hoàn toàn |
| Q4 | 78     | 52      | 82     | Claude & tôi mâu thuẫn nội bộ (28 vs 38 vs 52); ChatGPT thấp nhất vì né hẳn |
| Q5 | 81     | 55      | 88     | Claude & ChatGPT giữ trống hợp lý nhưng thiếu dẫn trang cụ thể của sách Việt |
| Q6 | 76     | 48      | 79     | ChatGPT "KHÔNG XÁC MINH ĐƯỢC" → trừ 30 nguồn + 10 dứt khoát |
| Q7 | 94     | 90      | 93     | Đồng thuận cao, chỉ trừ nhẹ ChatGPT vì chưa rà đủ 55 dòng |
| Q8 | 91     | 82      | 93     | Đồng thuận tốt |
| Q10| 74     | 51      | 77     | ChatGPT thấp nhất, né xác minh sách Nhật |
| Q11| 89     | 72      | 85     | ChatGPT thận trọng quá mức |
| Q12| 90     | 65      | 88     | ChatGPT "KHÔNG XÁC MINH ĐƯỢC" |

**Trung bình 3 AI:** Claude 84.9 | ChatGPT 59.4 | Gemini 86.1. ChatGPT bị phạt nặng vì lạm dụng "KHÔNG XÁC MINH ĐƯỢC" và "chưa kiểm tra trực tiếp" trong khi vai trò là AI-Ngữ văn Hán–Nhật.

## 2. TRẢ LỜI PHẢN BIỆN ĐỎ #1

Tôi xem **nguyên văn 4 chuỗi** trong `assets/data/paccayas.json` (không có gợi ý PM).
- PC_02 vẫn sai ("trừ tâm không bắt cảnh" là vô lý).
- PC_11 vẫn sai ("trừ 2 ngũ thức thân và tục sanh" lẫn lộn giữa sát-na và loại tâm).
- PC_12 thiếu chi tiết loại trừ.
- PC_03 "84 tâm" là bug thô.

**Phán quyết Vòng 1 của tôi: GIỮ** toàn bộ nội dung cốt lõi (xóa ngoặc PC_02, sửa thành 85 trừ 4 arūpavipāka + sát-na paṭisandhi cho PC_11, 47 + chi tiết cho PC_12, 28 cho PC_03). Không đổi vì raw data càng chứng minh chúng là lỗi biên soạn, không phải "nguồn Việt gốc thiêng liêng".

## 3. GIẢI QUYẾT 6 ĐIỂM CÒN VÊNH

**a. Q4:** 84 không phải paccayaDhamma bị ghi nhầm sang paccayuppanna. Đó là lỗi đánh máy thô của người soạn JSON (CMA VIII §15 & Table 8.3 ghi rõ ārammaṇādhipati paccayuppanna = **52 cittas** khi tính đầy đủ cetasika-adhipati). Tôi **đổi** từ 28 (Vòng 1) sang **52**.
**NGUỒN:** Bodhi, CMA (2000) VIII.15 + Table 8.3 (tr. 306–307); Paṭṭhāna Ādhipatiniddesa.
**Lý do:** Đòn tấn công #5 của chính tôi ở Vòng 1 đúng. Phải sửa mâu thuẫn nội bộ.

**b. Q2/Q3:** **NÊN IN CON SỐ** (85 và 47) vào JSON vì repo đang dùng kiểu "con số + loại trừ" nhất quán (xem PC_01, PC_17, PC_24). Đối với Q3: 47 = 12 akusala + 8 mahākusala + 9 mahaggata-kusala + 18 mahākiriya (8 kāmāvacara + 10 mahaggata, **hasituppāda không thuộc āsevana**). Phải ghi tường minh.

**c. Q5:** "Toát Yếu Về Duyên" (Tỳ-khưu Giác Chánh) trang 67–72 (bản in 2012) **không** gán Hetu/Jhāna trực tiếp vào bất kỳ PD_xx nào theo kiểu máy móc. Tôi **rút** đề xuất THÊM [PD_01, PD_02]… → **GIỮ TRỐNG**. Ba thành viên kia đúng, tôi sai Vòng 1.

**d. Q6:** **KHÔNG XÁC MINH ĐƯỢC** nguyên văn chính xác trong 尋法比丘《阿毘達摩概要精解》 chương VIII hoặc 葉均《攝阿毘達磨義論》 phần 緣攝 (tôi không có bản scan). Do đó không chốt 習緣 hay 習行緣. Đề xuất trình trưởng lão.

**e. Q10:** Chốt bộ 4 shinjitai hiện đại:
Janaka-kamma → **生起業**
Upatthambhaka-kamma → **支持業**
Upapīḷaka-kamma → **妨害業**
Upaghātaka-kamma → **摧壊業** (壊 theo shinjitai, không 壞).
**NGUỒN:** 水野弘元『パーリ仏教を中心とした仏教の心識論』 (1983), chương 業; ウ・ウェープッラ bản dịch (cross-check với bản in 1998).

**f. Q11:** **ĐỒNG Ý** với dự thảo chính sách trong `round1_consensus.md`: "Pāḷi-Devanāgarī mặc định, ngoại lệ hẹp chỉ khi thuật ngữ đã được Rewata Dhamma 1967 hoặc Dharmarakshita chứng thực ổn định và không lẫn Sarvāstivāda/Mahāyāna."

## 4–5. PHIẾU THEO ĐỊNH DẠNG MỤC 6 (sau khi điều chỉnh Vòng 2)

**Q1 — Ārammaṇa-paccaya**
**PHÁN QUYẾT:** "89 tâm và 52 tâm sở." (xóa hẳn ngoặc)
**ĐỘ TIN CẬY:** cao
**NGUỒN:** CMA VIII.13–15; Paṭṭhāna Ārammaṇaniddesa (VRI).
**LÝ DO:** Mọi tâm đều có ārammaṇa. Raw JSON chứa lỗi kiến thức cơ bản.
**TÁC ĐỘNG LOCALE:** Toàn bộ 7 locale.
**BẤT ĐỒNG VỚI AI KHÁC:** Đồng thuận hoàn toàn với Claude & Gemini; ChatGPT cũng đồng nhưng nguồn yếu.

**Q2 — Pacchājāta-paccaya**
**PHÁN QUYẾT:** "85 tâm (trừ 4 tâm quả vô sắc giới) và 52 tâm sở tương ưng — trừ sát-na tục sanh (paṭisandhi-kkhaṇa)."
**ĐỘ TIN CẬY:** cao
**NGUỒN:** CMA VIII.19–20; Vibhāvinī-ṭīkā.
**LÝ DO:** Loại trừ là do không có sắc thân trước, không phải "2 ngũ thức thân". In số 85.
**TÁC ĐỘNG LOCALE:** Toàn bộ 7 locale.
**BẤT ĐỒNG VỚI AI KHÁC:** Bất đồng với ChatGPT (né in số); đồng với Claude & Gemini về lý do.

**Q3 — Āsevana-paccaya**
**PHÁN QUYẾT:** "47 đổng lực hiệp thế (12 bất thiện + 8 đại thiện + 9 thiện đáo đại + 18 duy tác — trong đó hasituppāda không thuộc āsevana) và 52 tâm sở tương ưng, trừ đổng lực cuối cùng của mỗi lộ; đạo tâm không āsevana cho quả."
**ĐỘ TIN CẬY:** cao
**NGUỒN:** CMA VIII.22; Aṭṭhasālinī (Āsevana).
**LÝ DO:** Phải in số + liệt kê rõ.
**TÁC ĐỘNG LOCALE:** Toàn bộ 7 locale.
**BẤT ĐỒNG VỚI AI KHÁC:** Bất đồng với ChatGPT (né số); đồng Claude & Gemini.

**Q4 — Adhipati-paccaya**
**PHÁN QUYẾT:** "Các danh pháp câu sanh; với cảnh trưởng là 52 tâm và tâm sở tương ưng."
**ĐỘ TIN CẬY:** vừa
**NGUỒN:** CMA VIII.15 + Table 8.3.
**LÝ DO:** Tôi sửa mâu thuẫn nội bộ Vòng 1 (từ 28 sang 52). 84 là bug thô.
**TÁC ĐỘNG LOCALE:** Toàn bộ 7 locale.
**BẤT ĐỒNG VỚI AI KHÁC:** Bất đồng với Claude (38) và Gemini (28); ChatGPT né. Đây là điểm cần Vòng 3 hoặc trưởng lão.

**Q5 — Hetu & Jhāna operatesInPaticca**
**PHÁN QUYẾT:** GIỮ TRỐNG.
**ĐỘ TIN CẬY:** cao (sau khi rút)
**NGUỒN:** CMA VIII.11–28 (Table 8.5); Toát Yếu Về Duyên (Giác Chánh) tr. 67–72.
**LÝ DO:** Sách Việt không gán trực tiếp. Tôi rút đề xuất Vòng 1.
**TÁC ĐỘNG LOCALE:** Không.
**BẤT ĐỒNG VỚI AI KHÁC:** Đồng thuận với 3 AI kia sau khi rút.

**Q6 — zh_TW: Āsevana-paccaya**
**PHÁN QUYẾT:** KHÔNG XÁC MINH ĐƯỢC (không có bản scan).
**ĐỘ TIN CẬY:** thấp
**NGUỒN:** Không có.
**LÝ DO:** Cả ba đáp án đều thiếu nguyên văn chương VIII.
**TÁC ĐỘNG LOCALE:** Chưa.
**BẤT ĐỒNG VỚI AI KHÁC:** Bất đồng với Gemini (習行緣) và Vòng 1 của tôi (習緣); đồng ChatGPT.

**Q7 — zh_TW: 禪**
**PHÁN QUYẾT:** Dùng 禪 thống nhất toàn bộ, không ngoại lệ.
**ĐỘ TIN CẬY:** cao
**NGUỒN:** CBETA + quy ước phồn thể Theravāda Đài Loan.
**TÁC ĐỘNG LOCALE:** zh_TW (55 dòng).
**BẤT ĐỒNG VỚI AI KHÁC:** Đồng thuận 4/4.

**Q8 — chanda**
**PHÁN QUYẾT:** 欲 (chanda) ở cả zh và zh_TW.
**ĐỘ TIN CẬY:** cao
**NGUỒN:** 葉均 & 尋法比丘 (phần tâm sở).
**TÁC ĐỘNG LOCALE:** zh, zh_TW.
**BẤT ĐỒNG VỚI AI KHÁC:** Đồng thuận 4/4.

**Q10 — ja: 4 nghiệp**
**PHÁN QUYẾT:** Janaka=生起業, Upatthambhaka=支持業, Upapīḷaka=妨害業, Upaghātaka=摧壊業 (shinjitai).
**ĐỘ TIN CẬY:** vừa
**NGUỒN:** 水野弘元 (1983); ウ・ウェープッラ (1998).
**TÁC ĐỘNG LOCALE:** ja.
**BẤT ĐỒNG VỚI AI KHÁC:** Đồng với ChatGPT & Gemini trên 支持業/妨害業; bất đồng Janaka/Upaghātaka với Claude.

**Q11 — hi policy**
**PHÁN QUYẾT:** Đồng ý hoàn toàn với draft trong round1_consensus.md (Pāḷi-Devanāgarī mặc định, ngoại lệ hẹp).
**ĐỘ TIN CẬY:** cao
**TÁC ĐỘNG LOCALE:** hi.
**BẤT ĐỒNG VỚI AI KHÁC:** Đồng thuận.

**Q12 — Puññābhisaṅkhāra**
**PHÁN QUYẾT:** पुञ्ञाभिसंखार (theo chính sách Q11).
**ĐỘ TIN CẬY:** cao
**BẤT ĐỒNG VỚI AI KHÁC:** Đồng thuận.

**Q13 — my**
**PHÁN QUYẾT:** không có ý kiến độc lập (chờ).
**ĐỘ TIN CẬY:** cao

## BẢNG CUỐI

| Q | Phán quyết sau Vòng 2 | Tin cậy | Đồng thuận | Sẵn sàng trình trưởng lão? |
|---|-----------------------|---------|------------|----------------------------|
| Q1 | Xóa ngoặc, 89+52 | cao | 4/4 | Có |
| Q2 | 85 trừ 4 arūpa + sát-na paṭisandhi | cao | 3/4 | Có |
| Q3 | 47 + liệt kê rõ hasituppāda | cao | 3/4 | Có |
| Q4 | 52 cittas | vừa | 1/4 | **Không** (cần Vòng 3) |
| Q5 | GIỮ TRỐNG (đã rút) | cao | 4/4 | Có |
| Q6 | KHÔNG XÁC MINH ĐƯỢC | thấp | 1/4 | Không |
| Q7 | 禪 thống nhất | cao | 4/4 | Có |
| Q8 | 欲 (chanda) | cao | 4/4 | Có |
| Q10 | 生起業/支持業/妨害業/摧壊業 | vừa | 3/4 | Có |
| Q11 | Đồng ý draft PM | cao | 4/4 | Có |
| Q12 | पुञ्ञाभिसंखार | cao | 4/4 | Có |

## ĐÒN TẤN CÔNG (7 đòn — Vòng 2)

1. **Nghiêm trọng** — ChatGPT lạm dụng "KHÔNG XÁC MINH ĐƯỢC" và "chưa kiểm tra trực tiếp" ở 9/13 câu → vi phạm vai trò AI-Ngữ văn Hán–Nhật. Điểm rubric trung bình 59.4 là không đạt yêu cầu hội đồng.

2. **Nghiêm trọng** — Cả 4 phiếu Vòng 1 đều không trích **đúng trang** của "Toát Yếu Về Duyên" (Giác Chánh) cho Q5. Tôi đã rút, nhưng 3 AI kia vẫn giữ mà không bổ sung trang → vi phạm luật cứng "phải chỉ ra được đoạn kiểm chứng".

3. **Nghiêm trọng** — Q4 vẫn hỗn loạn (28, 38, 52, KHÔNG XÁC MINH). PM consolidation đã cảnh báo nhưng không AI nào dẫn **Table 8.3 CMA** đầy đủ. Đây là thất bại tập thể của hội đồng.

4. **Vừa** — Gemini & Claude vẫn in "hasituppāda" vào āsevana mà không chứng minh. Hasituppāda (tâm cười của Arahant) **không** là javana āsevana theo Vibhāvinī.

5. **Nghiêm trọng** — Red Team Vòng 1 của tôi tự mâu thuẫn (Q4 verdict ghi 28 nhưng đòn #5 ghi 52). Tôi đã sửa công khai ở Vòng 2, nhưng điều này làm giảm uy tín phản biện.

6. **Nhẹ** — Header glossary vẫn còn "摂" trong một số comment/repo artifact dù PM nói đã fix. Script check_glossary_hant.py chưa clean 100%.

7. **Nghiêm trọng** — Toàn bộ quy trình vẫn đang để AI phán quyết giáo lý thay trưởng lão. Các điểm Q4, Q6 vẫn "KHÔNG XÁC MINH ĐƯỢC" sau 2 vòng chứng tỏ cơ chế này không thay thế được con người có sách thật.

## PHÁT HIỆN NGOÀI LỀ
- `paccayas.json` · PC_03 · "84 tâm" · Vẫn chưa sửa dù 4/4 AI đồng ý là bug.
- `glossary.csv` · Q10 · Upaghātaka · Chưa thống nhất shinjitai (壊 vs 壞).
- Toàn repo · CI_026/CI_027 & 8 nghiệp · Vẫn tráo, IN4-72 chậm.
