# VDP · Hindi (`hi`) — Batch 4: khoảng trống còn lại ngoài body bài học

Trạng thái: **ĐỀ XUẤT, CHƯA TÍCH HỢP.** Không sửa `assets/content/content_hi.json`, builder, Dart, test, registry hay locale khác. Không chạy `build_full_catalogs.py`. Không đánh dấu bất kỳ mục nào là đã duyệt. Chưa commit.

## 1. Kiểm kê lại (gộp mọi proposal, so với `content_en.json`)

| Khu vực | Trạng thái |
|---|---|
| `studyModules.*.quizSeeds` | Xong: 233/233 (Batch 3, 8 file) |
| `studyModules.*.lessonSections[].summary / title / keyTerms` | Xong: 93 / 93 summary, 242/244 keyTerm (2 vắng có chủ đích) |
| `studyModules.*.reviewCards` (front, back) | **Xong trong Batch 4: 246/246 thẻ** (5 file) |
| `studyModules.*.lessonSections[].body` | **Chưa làm: 477 đoạn, khoảng 111.000 ký tự EN** |
| `paticcas`, `vithis`, `paccayas` | Đã có trong **Batch 1** (`data_priority_hi_conditions_detail.py`). Không dịch lại. |
| `cetasikas`, `rupas`, `cittas` examples, `kammas` examples/doctrinalNote | Đã có trong **Batch 2** (đã kiểm: 16 kamma, 12 citta examples khớp số lượng, không Latin) |
| `cittas.*.shortName` (71) | **Xong trong Batch 4** — `hi_batch4_shortnames_kamma.py` |
| `kammas.KM_R_04` (name, shortName, description) | **Xong trong Batch 4** — cùng file |
| `paccayas` còn thiếu (6 trường) | Vắng có chủ đích, xem §3 |
| `sourceRefs` (file, note) | Không dịch, theo quy tắc giữ nguyên sourceRefs |

## 2. File mới trong Batch 4

| File | Nội dung | Kiểm tra |
|---|---|---|
| `hi_batch4_reviewcards_m1_m2_m11.py` | 36 thẻ | ID khớp EN, không Latin |
| `hi_batch4_reviewcards_m4_m12_m5.py` | 40 thẻ | như trên |
| `hi_batch4_reviewcards_m3_m6.py` | 40 thẻ | như trên (đã bỏ ID Latin "Viratiyo" trong câu hỏi) |
| `hi_batch4_reviewcards_m7_m8_m9.py` | 50 thẻ | như trên |
| `hi_batch4_reviewcards_m10_m13_m14.py` | 40 thẻ | như trên |
| `hi_batch4_reviewcards_m15_m16_m17.py` | 40 thẻ | như trên |
| `hi_batch4_shortnames_kamma.py` | 71 `cittas.shortName` + 3 trường `KM_R_04` | `shortName` EN trùng `name` cho cả 71 mục; hi `name` đã có sẵn, không Latin, không trùng |

Tổng: 246 thẻ `reviewCards`, 71 `shortName`, 3 trường kamma.

## 3. Điều chỉnh so với lượt trước

- Đã tạo rồi xóa `hi_batch4_paticcas.py` và `hi_batch4_vithis.py`: **trùng lặp** với Batch 1. Batch 1 đã phủ đủ các trường đó (12 paticca, 24 paccaya, 4 vithi với 29 bước). Không có nguồn nào bị ghi đè.
- Sáu trường `paccayas` còn thiếu là các trường Batch 1 **chủ ý để vắng** vì nguồn chưa rõ. Theo quy tắc, giữ vắng mặt, không điền tạm:
  - `PC_02.paccayuppanna`, `PC_03.paccayuppanna`
  - `PC_11.paccayaDhamma`, `PC_12.paccayaDhamma`, `PC_16.paccayaDhamma`
  - `PC_15.doctrinalNote`

## 4. Việc còn lại

1. **`lessonSections[].body`: 477 đoạn, ~111.000 ký tự EN.** Đây là khối lớn nhất còn lại. Nên làm theo module, bắt đầu M1_BASICS (18 đoạn), mỗi đoạn dịch riêng.
2. Đối chiếu danh sách `keyTerm` 244 id với EN (đã có 242 + 2 vắng có chủ đích).
3. Quyết định về 6 trường `paccayas` vắng và về cách xử lý trùng `TERM_TU_QUYEN_M3` / `TERM_PANNINDRIYA` (Batch 3 §3).
4. Tích hợp: người tích hợp cần gộp mọi proposal vào builder chỉ cho `loc == "hi"`, rồi chạy `check_content_locale.py hi --glossary` và kiểm tra idempotence. Phần này chưa làm.

## 5. Ghi chú nguồn

Bản Hindi 1967 (Rewata Dhamma) vẫn **chưa được kiểm chứng**. Không có số trang nào được trích. Mọi proposal đều ghi "NOT VERIFIED — List B".
