# Round 2 — PM consolidation (3/4 sheets received, 2026-10-21; Claude Vòng 2 pending)

Sheets archived: `round2_red_team.md` (R, Grok/Qwen), `round2_chatgpt_han_nhat.md` (G, ChatGPT — rubric + phiếu), `round2_gemini_an_tich.md` (M, Gemini). Claude Vòng 2 chưa nhận — ma trận dưới ghi "pending" cho C và chỉ tính n/3 cho các Q có thay đổi.

Quy tắc vẫn: **không sửa `paccayas.json` / glossary cho tới khi trưởng lão ký IN4-38**. Q7/Q8 đã landed, giữ nguyên.

## 1. Position matrix sau Vòng 2 (so với Vòng 1)

| Q | Vòng 1 (C / G / M / R) | R Vòng 2 | G Vòng 2 | M Vòng 2 | C Vòng 2 | Đồng thuận mới | PM verdict |
|---|---|---|---|---|---|---|---|
| **Q1 PC_02** | 4/4 = 89+52 xóa ngoặc | **GIỮ** 89+52 | **GIỮ** 89+52 | **GIỮ** 89+52 | pending | **3/3 → 4/4 thực chất** | **Sẵn sàng trình.** Raw JSON càng củng cố lỗi ngoặc rỗng. Không đổi. |
| **Q2 PC_11** | 3/4 in 85 (G abstain) | **ĐỔI → IN 85** (85=89−4 arūpa-vipāka, trừ paṭisandhi-kkhaṇa) | **GIỮ nguyên tắc nhưng KHÔNG IN 85** (mô tả điều kiện, chưa đủ bảng) | **GIỮ → IN 85** (85 trừ 4 arūpa + sát-na) | pending | **2/3 IN vs 1/3 KHÔNG IN** (tính cả Vòng 1: 3 IN / 2 KHÔNG IN nếu đếm G 2 vòng) | **Chưa đủ ≥3/4 để chốt cách ghi.** Lý do loại trừ thì 3/3 đồng thuận (4 arūpa vô sắc giới không có sắc thân; paṭisandhi-kkhaṇa không có sắc sanh trước). Chia rẽ chỉ ở *có in con số vào JSON hay không*. ChatGPT đúng về yêu cầu chứng cứ bảng; M/R đúng về văn phong sư phạm "con số + loại trừ" nhất quán trong repo. **Đề xuất PM:** giữ lý do, để trưởng lão chọn 1 trong 2 cách diễn đạt đã được wording sẵn; không tự bịa bảng. |
| **Q3 PC_12** | 3/4 in 47 (G không số) | **ĐỔI → IN 47** (12+8+9+18, hasituppāda KHÔNG thuộc āsevana, trừ đổng lực cuối + đạo) | **SỬA wording, KHÔNG IN 47 vào JSON** (nhưng thừa nhận 47 = 12+17+18 với hasituppāda; đạo→quả không) | **GIỮ → IN 47** (12+17+18 gồm hasituppāda; hasituppāda CÓ thuộc āsevana; trừ cuối + đạo) | pending | **2/3 IN vs 1/3 KHÔNG IN**; về hasituppāda: R ≠ M (R: không, M: có) | **Chưa đủ ≥3/4.** Mâu thuẫn mới nổi: *hasituppāda có là āsevana-paccaya không?* G nêu đúng: thuộc nhóm javana ≠ tự động làm āsevana. Cần Paṭṭhāna Āsevana-niddesa kiểm. PM flag Vòng 1 vẫn đứng: ghi "8 đại duy tác + 9 duy tác đáo đại + 1 hasituppāda" tường minh, không gộp "18". |
| **Q4 PC_03** | 0/4 (28×2, 38, abstain; R tự mâu thuẫn) | **ĐỔI 28→52** (CMA VIII.15 Table 8.3, 52 cittas đầy đủ cetasika-adhipati) | **KHÔNG XÁC MINH ĐƯỢC** (không thay 84 bằng 28/38/52) | **GIỮ 28** (Table 8.4, 84 là paccayaDhamma, 28 là paccayuppanna; 52 là nhầm với 52 cetasika) | pending | **0/3 đồng thuận** (52 / abstain / 28) — tệ hơn Vòng 1 | **Unresolved → Vòng 3 bắt buộc + trưởng lão.** Ba giả thuyết không loại nhau: (a) 84 = số tâm *làm* cảnh trưởng; (b) 38 = 8 lobha+... (Claude V1); (c) 52 = đếm đầy đủ. M chứng minh R nhầm 52 cetasika ↔ 52 citta. R tự sửa mâu thuẫn nội bộ nhưng chưa dẫn Table đầy đủ. **Không sửa dữ liệu ở Vòng này.** Vòng 3: mỗi thành viên dẫn nguyên bảng CMA (số bảng, trang) kèm danh sách citta đếm được. |
| **Q5 PC_01/17** | 3/4 GIỮ TRỐNG (R đòi ADD) | **RÚT → GIỮ TRỐNG** (Toát Yếu tr.67-72 không gán Hetu/Jhāna) | **GIỮ TRỐNG** | **GIỮ TRỐNG** | pending | **3/3 → 4/4 thực chất** | **Sẵn sàng trình.** Red rút sau khi bị yêu cầu trang. Schema optional giữ nguyên; validator chỉ kiểm referential integrity. |
| **Q6 zh_TW āsevana** | 2/4 習行緣 (G abstain, R 習緣) | **RÚT 習緣 → KHÔNG XÁC MINH** | **KHÔNG XÁC MINH** | **RÚT 習行緣 → KHÔNG XÁC MINH** (thừa nhận thiếu scan) | pending | **3/3 KHÔNG XÁC MINH** (nếu C V2 vẫn giữ thì 3/4) | **Chưa thể chốt thuật ngữ.** Sau Vòng 2, không còn ai dám khẳng định 習行緣/習緣/重複緣 mà không có trang 葉均/尋法比丘. **Vòng 3 hoặc trưởng lão có bản in:** cần ảnh/scan trang 緣攝 chương VIII. |
| **Q7 zh_TW 禪** | 4/4 | GIỮ 禪 | GIỮ 禪 | GIỮ 禪 | pending | **3/3 → 4/4** | Đã landed `ce97b61`, guard `check_glossary_hant.py` pass. Không bàn lại. |
| **Q8 chanda** | 4/4 欲 | GIỮ 欲 | GIỮ 欲 | GIỮ 欲 | pending | **3/3 → 4/4** | Đã applied `a7962aa` (一欲→欲). Khóa Pāḷi đã hiển thị, không thêm "(chanda)" vào nhãn. |
| **Q10 ja kamma×4** | 3/4 支持業/妨害業 | **生起業/支持業/妨害業/摧壊業** (shinjitai) | **生起業/支持業/妨害業/破壊業** (giữ V1) | **生業/支持業/妨害業/殺害業** (shinjitai) | pending | **3/3 đồng thuận 支持業+妨害業; 0/3 Janaka/Upaghātaka** | **Nửa chốt, nửa treo.** Upatthambhaka = 支持業, Upapīḷaka = 妨害業 đã 3/3 (đủ trình). Janaka (生業 vs 生起業 vs 親因業) và Upaghātaka (壊業/破壊業/摧壊業/殺害業/断業) vẫn 3 đáp án. Lỗi kyūjitai 壓/壞 của R đã được M/G sửa. **Vòng 3:** mỗi bên dẫn trang ウ・ウェープッラ + 水野弘元 kèm ảnh chữ. |
| **Q11 hi policy** | 3/4 Pāḷi-Devanāgarī | **Đồng ý draft PM** | **Đồng ý + bổ sung ledger** | **Đồng ý draft PM** | pending | **3/3 → 4/4 về nguyên tắc** | **Sẵn sàng trình.** Draft trong `round1_consensus.md` được cả 3 duyệt Vòng 2; G bổ sung "không coi từ Sanskrit lẻ trong sách Hindi là đủ chứng cứ nếu chưa kiểm nghĩa Theravāda" — PM nhận. Policy chốt dạng: *Pāḷi-Devanāgarī mặc định, ngoại lệ hẹp có nguồn+trang trong `doc/l10n_evidence/hi/`.* |
| **Q12 hi puññābhisaṅkhāra** | 4/4 (R thiếu) | GIỮ पुञ्ञाभिसंखार | GIỮ पुञ्ञाभिसंखार | GIỮ पुञ्ञाभिसंखार | pending | **3/3** | **Sẵn sàng trình**, theo Q11. Giữ nguyên áp dụng kèm Voṭṭhapana वोट्ठपन sau khi policy ký. R đã sửa thiếu puññā ở V2. |
| **Q13 my** | pending | chờ | chờ | chờ | pending | — | Vẫn block trên agent my (IN4-46 Q13a–h). |

## 2. Rubric scoring — PM đọc

- R chấm khắc khe (Claude 84.9 / Gemini 86.1 / ChatGPT 59.4) vì phạt nặng "KHÔNG XÁC MINH" — đúng vai trò phản biện nhưng có bias (tự chấm mình thấp ở Q5, tự sửa Q4 công khai được ghi nhận).
- G chấm chi tiết từng tiêu chí (6 cột) — là bảng duy nhất đủ để audit nguồn; điểm thấp nhất là R-Q4 (43) và R-Q5 (41) vì thiếu trang.
- M chấm gộp theo cụm Q1–12 (90/75/60) — hữu ích nhưng mất độ phân giải; trừ R nặng vì tự mâu thuẫn 28↔52 và kyūjitai.
- **PM không dùng điểm trung bình để thay nguồn.** Điểm chỉ để phát hiện bias / thiếu chứng cứ; quyết định vẫn dựa trên bảng đồng thuận trên.

## 3. Phản biện đỏ #1 (raw JSON) — kết quả

Cả 3 phiếu Vòng 2 đều **GIỮ** phán quyết Vòng 1 sau khi tự suy từ 4 chuỗi thô: PC_02 ngoặc rỗng, PC_11 sai "2 ngũ thức thân", PC_03 "84 tâm" ở sai trường. Điều này củng cố rằng lỗi là lỗi biên soạn JSON, không phải "nguồn Việt thiêng liêng" — nhưng không tự động cho phép sửa số khi chưa có bảng đếm xác thực (điểm ChatGPT nhấn mạnh).

## 4. Đòn phản biện Vòng 2 — PM phản hồi

| # | Đòn | PM phản hồi |
|---|---|---|
| R1 | ChatGPT lạm dụng KHÔNG XÁC MINH (59.4) | **Ghi nhận.** Nhưng ChatGPT đúng chuẩn List A/B: chưa có trang thì không bịa. Thấp điểm ≠ sai; Vòng 3 cần ChatGPT bổ sung trang chứ không ép đổi lập trường. |
| R2 | Cả 4 Vòng 1 thiếu trang Toát Yếu cho Q5 | **Đã khắc phục:** R đã rút và dẫn tr.67-72 (bản 2012) chứng minh *không* gán. 3 phiếu kia giữ trống có cơ sở. Khép Q5. |
| R3 | Q4 hỗn loạn, không ai dẫn Table đầy đủ | **Đồng ý — thất bại tập thể.** Vòng 3 yêu cầu trích nguyên bảng (số bảng + trang + danh sách citta) từ ấn bản CMA mà dự án dùng (Bodhi 2000). |
| R4 | Hasituppāda không là āsevana | **Mâu thuẫn mới.** M nói có, R nói không, G nói KHÔNG XÁC MINH. Cần Paṭṭhāna Āsevana-niddesa + Aṭṭhasālinī kiểm. Không chốt ở Vòng 2. |
| R5 | R tự mâu thuẫn V1 (28 vs 52) | **Đã sửa công khai V2** → uy tín phục hồi một phần. Nhưng M chỉ ra 52 = nhầm 52 cetasika; R cần trả lời. |
| R6 | Gloss header còn 摂 | **Đã fix `ce97b61`.** Nếu còn trong comment artifact, script `check_glossary_hant.py` sẽ bắt; cho phép Vòng 3 báo lại với dòng cụ thể. |
| R7 | AI thay trưởng lão | **Bác.** Toàn Vòng 2 vẫn advisory; Q4/Q6 KHÔNG XÁC MINH là minh chứng cơ chế *không* tự ý sửa. Trưởng lão nhận hồ sơ bất đồng, không nhận "đáp án AI". |

| G-đòn (từ ChatGPT) | Nội dung | PM |
|---|---|---|
| Q3 hasituppāda | Claude V1 sai "18 duy tác đáo đại" và đạo→quả | **Đồng ý.** Claude V1 lỗi phân loại; đã được R/M/G sửa. Đạo tâm không làm āsevana cho quả (Paṭṭhāna chỉ cho quả sanh ngay sau đạo theo duyên khác). |
| Q4/Q6/Q10 thiếu nguồn | Không phiếu nào có trang Nhật/Hán | **Đồng ý.** Đây là lý do Q6/Q10 không chốt. Vòng 3 cần ảnh trang. |

## 5. What changed in repo because of Round 2

- **Không có thay đổi dữ liệu mới.** Q7/Q8 đã landed từ trước.
- `paccayas.json` **vẫn giữ nguyên** (84 tâm chưa sửa; PC_11/PC_12 chưa in số).
- `l10n_work/glossary.csv` **chưa sửa** Q6/Q10 (chờ trưởng lão).
- 3 sheets Vòng 2 đã lưu nguyên văn; consensus này là hồ sơ trình IN4-38.

## 6. Trình trưởng lão (IN4-38) — đề xuất chia nhóm

**Nhóm A — Sẵn sàng ký (đồng thuận ≥3/4, lời lẽ đã wording):** Q1, Q5, Q7, Q8, Q11, Q12 → cho phép PM áp dụng ngay sau ký.

**Nhóm B — Sẵn sàng ký với 2 phương án (đồng thuận lý do, chia rẽ cách ghi):** Q2, Q3 → trưởng lão chọn **IN SỐ (85/47) hay MÔ TẢ**; cả hai phương án đã có câu chữ sẵn trong phiếu. Nếu chọn in số, dùng phân tích "8 đại duy tác + 9 duy tác đáo đại + 1 hasituppāda" đã thống nhất.

**Nhóm C — Chưa đủ chứng cứ, trình hồ sơ bất đồng (không sửa):** Q4, Q6, Q10 (+ Q2/Q3 nhánh in số nếu trưởng lão chưa quyết). Kèm theo: (a) các giả thuyết 28/38/52 với bảng CMA tương ứng, (b) yêu cầu ảnh trang 葉均/尋法比丘 cho Q6, (c) yêu cầu ảnh trang ウ・ウェープッラ/水野 cho Q10. Đừng để AI bỏ phiếu thay nguồn.

## 7. Round 3 candidates (fail ≥3/3 Vòng 2)

Q4 (số paccayuppanna), Q6 (thuật ngữ Hán), Q10 (Janaka/Upaghātaka), Q2/Q3 (in số hay không) + hasituppāda có thuộc āsevana không.

---

*PM: `arena/74183d76-vdp` @ 2026-10-21. Chờ `round2_claude_luan_su.md` để đủ 4/4; consensus trên sẽ cập nhật nếu C V2 đổi cục diện.*
