# Round 2 — PM consolidation (4/4 sheets received, 2026-10-21)

Sheets: `round2_claude_luan_su.md` (C, Claude Sonnet 5), `round2_chatgpt_han_nhat.md` (G, ChatGPT), `round2_gemini_an_tich.md` (M, Gemini), `round2_red_team.md` (R, Grok/Qwen). Khối ChatGPT trước nhầm model đã loại — chỉ tính bản ChatGPT Hán–Nhật; bản Claude Sonnet 5 là bản chính thức (C đã tự sửa Q3 + hạ Q6).

Quy tắc vẫn: **không sửa `paccayas.json` / glossary cho tới khi trưởng lão ký IN4-38**. Q7/Q8 đã landed.

## 1. Position matrix sau Vòng 2 (4/4)

| Q | C (Claude V2) | G (ChatGPT V2) | M (Gemini V2) | R (Red V2) | Đồng thuận 4/4 | PM verdict |
|---|---|---|---|---|---|---|
| **Q1 PC_02** | 89+52 xóa ngoặc | same | same | same | **4/4** | **Sẵn sàng trình.** Raw JSON càng củng cố lỗi ngoặc rỗng. |
| **Q2 PC_11** | 85 = 89−4 arūpa-vipāka + trừ paṭisandhi-kkhaṇa | **KHÔNG IN 85** (mô tả) | 85 trừ 4 arūpa + paṭisandhi | 85 trừ 4 arūpa + paṭisandhi | 3/4 IN vs 1/4 mô tả | **Nhóm B.** Lý do loại trừ 4/4 đồng thuận; chia rẽ chỉ cách ghi. Trưởng lão chọn IN SỐ hay MÔ TẢ. |
| **Q3 PC_12** | 47 (12+8+9+8+9+1 hasituppāda), **tự sửa: đạo KHÔNG āsevana cho quả**, trừ cuối lộ | 47 (12+8+9+8+9+1) nhưng **KHÔNG IN 47** vào JSON; đạo KHÔNG āsevana | 47 (12+17+18 gồm hasituppāda) hasituppāda CÓ āsevana, trừ cuối+đạo | 47 (12+8+9+18) hasituppāda KHÔNG āsevana, trừ cuối+đạo | **4/4 về nguyên tắc (đạo→quả sai), 3/4 IN vs 1/4 KHÔNG IN; hasituppāda 2-1-1** | **Nhóm B/C.** Claude tự sửa lỗi V1 là điểm then chốt Vòng 2. Còn vênh hasituppāda CÓ vs KHÔNG thuộc āsevana (C+M vs R vs G-Không xác minh). |
| **Q4 PC_03** | **nghiêng 28, loại hẳn 52**, không chốt cứng; rút 38 | KHÔNG XÁC MINH (không thay 84) | 28 (84 là paccayaDhamma) +45 cetasika | 52 (đổi 28→52, Table 8.3) | **0/4 chốt cứng** (nghiêng 28 ×1 + 28 ×1 / KHÔNG XÁC MINH ×1 / 52 ×1) | **Nhóm C — Unresolved → Vòng 3 + trưởng lão.** Claude loại 52 vì lẫn citta/cetasika, rút 38; M dẫn Table 8.4 rõ nhất (điểm cao từ C); R tự mâu thuẫn 28↔52 còn nguyên. |
| **Q5 PC_01/17** | GIỮ TRỐNG | GIỮ TRỐNG | GIỮ TRỐNG | **rút về GIỮ TRỐNG** (tr.67-72 không gán) | **4/4** | **Sẵn sàng trình.** Schema optional giữ nguyên. |
| **Q6 zh_TW āsevana** | **hạ 習行緣 → KHÔNG XÁC MINH** | KHÔNG XÁC MINH | KHÔNG XÁC MINH | **rút 習緣 → KHÔNG XÁC MINH** | **4/4 KHÔNG XÁC MINH** | **Nhóm C.** Sau Vòng 2 không ai dám chốt 習行緣/習緣/重複緣 khi thiếu scan 葉均/尋法比丘. Cần trưởng lão có bản in. |
| **Q7 zh_TW 禪** | 禪 | 禪 | 禪 | 禪 | **4/4** | Đã landed `ce97b61`. |
| **Q8 chanda** | 欲 | 欲 | 欲 | 欲 | **4/4** | Đã applied `a7962aa` 一欲→欲. |
| **Q10 ja kamma×4** | 生業/支持業/妨害業/破壊業 | 生起業/支持業/妨害業/破壊業 | 生業/支持業/妨害業/殺害業 | 生起業/支持業/妨害業/摧壊業 | **4/4 支持業/妨害業; 0/4 Janaka/Upaghātaka thống nhất** | **Nửa chốt, nửa treo.** Upatthambhaka=支持業, Upapīḷaka=妨害業 4/4. Janaka (生業 vs 生起業) và Upaghātaka (破壊業/殺害業/摧壊業/壊業) còn 3 đáp án, chưa ai có trang Nhật. |
| **Q11 hi policy** | Đồng ý + thêm đk (c) ưu tiên Pāḷi khi cả hai dạng đều chứng thực | Đồng ý + bổ sung ledger | Đồng ý draft PM | Đồng ý draft PM | **4/4 nguyên tắc** | **Sẵn sàng trình.** Draft PM + đk (c) của C dung hòa G. |
| **Q12 hi puññābhisaṅkhāra** | पुञ्ञाभिसंखार | पुञ्ञाभिसंखार | पुञ्ञाभिसंखार | पुञ्ञाभिसंखार (đã sửa thiếu) | **4/4** | **Sẵn sàng trình** theo Q11. |

## 2. Điểm nhấn Vòng 2

- **Claude tự phê:** Q3 sai "đạo→quả āsevana" đã được G/M/R bắt đúng → C tự sửa công khai, chấm G/M/R cao ở Q3 (72/84/79). Đây là lý do giao thức có Vòng 2.
- **Claude hạ Q6:** từ "Vừa" ủng hộ 習行緣 xuống "Thấp/Không xác minh" — cùng chuẩn với G, và trừ M nặng vì "cao" dù không có nguồn.
- **Q4:** C loại 52 (nhầm 52 cetasika ↔ 52 citta) và rút 38; M dẫn Table 8.4 rõ nhất được C chấm 87 (cao nhất Q4). R vẫn mâu thuẫn 28↔52 (R tự chấm thấp 55).
- **Hasituppāda:** C và M nói CÓ thuộc āsevana (kiriyābyākata lặp), R nói KHÔNG, G nói KHÔNG XÁC MINH — vênh mới cần Paṭṭhāna Āsevana-niddesa.
- **Claude ghi:** cả 4 thành viên đều có ít nhất 1 điểm <70/100 ở Vòng 1 → không có AI "thắng" tuyệt đối, đúng tinh thần hội đồng không phải thẩm quyền giáo lý.

## 3. Phản biện đỏ #1 (raw JSON) — kết quả 4/4

Cả 4 phiếu đều GIỮ phán quyết Vòng 1 sau khi tự suy từ chuỗi thô: PC_02 ngoặc rỗng, PC_11 sai "2 ngũ thức thân", PC_03 thiếu "...". Claude phát hiện thêm lỗi Q3 (thiếu trừ đổng lực cuối) mà khung "?" cũ che mất — thừa nhận đòn #1 của Red có cơ sở một phần.

## 4. Đòn phản biện Vòng 2 — PM phản hồi

- R1 ChatGPT 59.4 thấp → Ghi nhận nhưng ChatGPT đúng List A/B (không bịa).
- R2 thiếu trang Toát Yếu Q5 → Đã khắc phục: R rút về GIỮ TRỐNG, C xác nhận.
- R3 Q4 hỗn loạn → Đồng ý thất bại tập thể; Vòng 3 cần trích nguyên bảng CMA (số bảng + trang + danh sách citta).
- R4 hasituppāda → Mâu thuẫn mới C/M vs R, cần Paṭṭhāna kiểm.
- R5 R tự mâu thuẫn 28/52 → C đã loại 52 công khai, M chỉ ra lẫn cetasika.

## 5. Trình trưởng lão (IN4-38) — chia nhóm

**Nhóm A — Ký ngay (4/4, wording sẵn):** Q1, Q5, Q7, Q8, Q11, Q12 → cho phép áp dụng ngay sau ký. Q11 kèm đk (c) mới: "Khi cả hai dạng Pāḷi-Devanāgarī và Sanskrit đều chứng thực trong tài liệu Theravāda Hindi, ưu tiên dạng phản ánh trực tiếp khóa Pāḷi".

**Nhóm B — Ký với lựa chọn cách ghi (đồng thuận lý do, chia rẽ hình thức):** Q2 (in 85 hay mô tả), Q3 (in 47 hay mô tả) + hasituppāda CÓ/KHÔNG. Cả hai phương án đã có câu chữ sẵn; nếu in số, dùng phân tích "8 đại duy tác + 9 duy tác đáo đại + 1 hasituppāda".

**Nhóm C — Trình hồ sơ bất đồng (không sửa):** Q4 (nghiêng 28 / 52 / KHÔNG XÁC MINH), Q6 (4/4 KHÔNG XÁC MINH — cần ảnh 葉均/尋法比丘), Q10 (chỉ chốt nửa; Janaka/Upaghātaka cần ảnh ウ・ウェープッラ/水野).

## 6. Round 3 candidates (fail ≥3/4 chốt cứng)

Q4 (số paccayuppanna: 28 vs 52 vs KHÔNG XÁC MINH), Q6 (thuật ngữ Hán — 4/4 chưa xác minh), Q10 (Janaka/Upaghātaka), Q2/Q3 nhánh in số + hasituppāda.

## 7. What changed in repo because of Round 2

- Không đổi dữ liệu mới. Q7/Q8 đã landed từ trước. `paccayas.json` giữ nguyên (84 chưa sửa). `glossary.csv` chưa sửa Q6/Q10.
- 4 sheets Vòng 2 đã lưu nguyên văn; consensus này là hồ sơ trình IN4-38.
- Lưu ý khối ChatGPT nhầm model trước đó đã loại — không tính vào consensus.

*PM: `arena/74183d76-vdp` @ 2026-10-21. Đủ 4/4 — sẵn sàng Vòng 3 nếu trưởng lão yêu cầu.*
