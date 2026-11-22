# VDP · Hindi (`hi`) — Batch 3: nghĩa thuật ngữ + tóm tắt bài học + quiz

Trạng thái: **ĐỀ XUẤT, CHƯA TÍCH HỢP.** Không sửa `assets/content/content_hi.json`, builder, Dart, test, registry, hay locale khác. Không chạy `build_full_catalogs.py`. Không đánh dấu bất kỳ mục nào là đã duyệt.

Quy tắc giữ nguyên: nếu nghi ngờ thì để vắng mặt (fallback về tiếng Anh), không điền tiếng Anh/tiếng Việt. Mọi `id`, `term`, `pali`, `sourceRefs` đều không dịch.

## 1. Đã dịch

| File | Trường | Số mục | Kiểm tra |
|---|---|---|---|
| `hi_batch3_keyterm_meanings.py` | `studyModules.*.lessonSections[].keyTerms[].meaning` | 242 / 244 | ID duy nhất; thiếu đúng 2; không còn Latin |
| `hi_batch3_lesson_summaries.py` | `studyModules.*.lessonSections[].summary` | 93 / 93 | ID khớp; không còn Latin; chữ số khớp (32 → बत्तीस là dạng chữ) |
| `hi_batch3_quiz_m1_m2_m11.py` | `quizSeeds` của M1_BASICS, M2_SI_PHAN, M11_BIET_CANH | 34 / 34 câu | Dịch nguyên câu: câu hỏi + đáp án + mọi distractor + giải thích |
| `hi_batch3_quiz_m4_m12_m5.py` | `quizSeeds` của M4_AKUSALA, M12_VO_NHAN, M5_SOBHANA | 40 / 40 câu | Như trên |
| `hi_batch3_quiz_m3.py` | `quizSeeds` của M3_TINH_HAO_BIEN_HANH | 20 / 20 câu | Như trên |
| `hi_batch3_quiz_m6_m7.py` | `quizSeeds` của M6_NGHIEP, M7_SIEU_THE | 30 / 30 câu | Như trên |
| `hi_batch3_quiz_m8_m9.py` | `quizSeeds` của M8_NHAN_DUYEN, M9_SAC_PHAP | 32 / 32 câu | Như trên |
| `hi_batch3_quiz_m10_m13.py` | `quizSeeds` của M10_LO_TRINH, M13_SAC_GIOI | 27 / 27 câu | Như trên |
| `hi_batch3_quiz_m14_m15.py` | `quizSeeds` của M14_VO_SAC_GIOI, M15_TAM_SO_PHOI_HOP | 22 / 22 câu | Như trên |
| `hi_batch3_quiz_m16_m17.py` | `quizSeeds` của M16_NGUOI_VA_COI, M17_DUYEN_CHI_TIET | 28 / 28 câu | Như trên |

Quiz đã làm: 233 / 233 câu (17 / 17 module). Kiểm tra: ID khớp với EN (233/233), số distractor khớp, đáp án không trùng distractor, không trùng distractor nội bộ, không còn ký tự Latin.

Hai mục vắng có chủ đích: `TERM_TONG_SO_TS_M15` và `TERM_TUOI_THO_TROI_M16` — tiếng Anh chỉ là nhãn số trong bảng, không phải định nghĩa thuật ngữ.

## 2. Chưa làm (vẫn là tiếng Anh ở bản hi)

| Khu vực | Số lượng | Ghi chú |
|---|---|---|
| `lessonSections[].body` | 477 đoạn | Khối lớn nhất; làm theo module M1 → M2 → M11 |
| `reviewCards[].front/back` | 246 | Đã xong ở Batch 4 |

Còn lại: body 477 đoạn. reviewCards đã xong ở Batch 4 (`HI_BATCH4_REPORT.md`); paticcas, vithis, paccayas đã có ở Batch 1.

## 3. Cần duyệt giáo lý (List B) — gặp khi dịch

1. Các tóm tắt có số liệu (ví dụ 28 cittas tạo kamma, 18 loại rūpa do kamma sinh, 31 cõi) đã dịch đúng theo EN, nhưng chưa đối chiếu với nguồn PDF.
2. `TERM_TU_QUYEN_M3` có cùng nội dung với `TERM_PANNINDRIYA` trong EN. Dịch giống nhau; cần quyết định có gộp hay không.
3. `TERM_DOSA_NHOM_SAN_M4` và `TERM_DOSA_M4` đều là "द्वेष" — đúng theo EN.
4. Các dạng Pāḷi trong ngoặc (ví dụ "सम्मावाचा", "पटिच्चसमुप्पाद") giữ theo chú thích EN; chưa có chuẩn chính tả Devanagari được duyệt.
5. Nguồn Hindi 1967 (Rewata Dhamma) vẫn **chưa được kiểm chứng**; không có số trang nào được trích.
6. `M10_S09` (EN: "not in this source") — tóm tắt hi dịch đúng ý là nguồn không đề cập, nhưng cần xác nhận đây là cách trình bày mong muốn.

## 4. Gate

- Kiểm tra thủ công cấu trúc hai module (ID, số lượng, Latin, chữ số): PASS.
- `check_content_locale.py hi --glossary`, build idempotence, flutter: NOT RUN (không tích hợp, không đổi Dart/builder).

## 5. Bước tiếp theo đề xuất

1. Duyệt nhanh 242 nghĩa thuật ngữ với glossary `hi` (`l10n_work/glossary.csv`) — đặc biệt các mục có dạng Pāḷi.
2. Làm `body` theo module, bắt đầu M1_BASICS (477 đoạn).
3. Làm `reviewCards` (246 thẻ).
4. Khi các mảng trên xong, người tích hợp nối các module này vào builder (chỉ với `loc == "hi"`), rồi chạy kiểm tra idempotence.
