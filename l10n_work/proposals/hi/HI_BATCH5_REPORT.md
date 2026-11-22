# VDP · Hindi (`hi`) — Batch 5: lesson body (tiến độ)

Trạng thái: **ĐỀ XUẤT, CHƯA TÍCH HỢP, CHƯA DUYỆT.** Không sửa `content_hi.json`, builder, test, hay locale khác. Không đánh dấu review. Chưa commit.

## Đã xong
| Module | Đoạn body đã dịch | File | Kiểm tra |
|---|---|---|---|
| M1_BASICS | 18 / 18 | `hi_batch5_lessonbody_m1.py` | số đoạn khớp EN, không Latin |
| M2_SI_PHAN | 12 / 12 | `hi_batch5_lessonbody_m2.py` | số đoạn khớp EN, không Latin |
| M3_TINH_HAO_BIEN_HANH | 43 / 43 | `hi_batch5_lessonbody_m3.py` | số đoạn khớp EN, không Latin |
| M5_SOBHANA | 14 / 14 | `hi_batch5_lessonbody_m5_m7.py` | số đoạn khớp EN, không Latin |
| M7_SIEU_THE | 14 / 14 | `hi_batch5_lessonbody_m5_m7.py` | số đoạn khớp EN, không Latin |
| M12_VO_NHAN | 16 / 16 | `hi_batch5_lessonbody_m12_m13_m14.py` | số đoạn khớp EN, không Latin |
| M13_SAC_GIOI | 14 / 14 | `hi_batch5_lessonbody_m12_m13_m14.py` | số đoạn khớp EN, không Latin |
| M14_VO_SAC_GIOI | 13 / 13 | `hi_batch5_lessonbody_m12_m13_m14.py` | số đoạn khớp EN, không Latin |
| M11_BIET_CANH | 25 / 25 | `hi_batch5_lessonbody_m11.py` | số đoạn khớp EN, không Latin |
| M9_SAC_PHAP | 33 / 33 | `hi_batch5_lessonbody_m9.py` | số đoạn khớp EN, không Latin |
| M4_AKUSALA | 52 / 52 | `hi_batch5_lessonbody_m4.py` | số đoạn khớp EN, không Latin |
| M16_NGUOI_VA_COI | 46 / 46 | `hi_batch5_lessonbody_m16.py` | số đoạn khớp EN, không Latin |
| M10_LO_TRINH | 40 / 40 | `hi_batch5_lessonbody_m10.py` | số đoạn khớp EN; chỉ còn ID dữ liệu và tên file nguồn bằng Latin (được phép) |
| M6_NGHIEP | 38 / 38 | `hi_batch5_lessonbody_m6.py` | số đoạn khớp EN, không Latin |
| M8_NHAN_DUYEN | 31 / 31 | `hi_batch5_lessonbody_m8.py` | số đoạn khớp EN, không Latin |
| M15_TAM_SO_PHOI_HOP | 35 / 35 | `hi_batch5_lessonbody_m15.py` | số đoạn khớp EN, không Latin |
| M17_DUYEN_CHI_TIET | 33 / 33 | `hi_batch5_lessonbody_m17.py` | số đoạn khớp EN, không Latin |

**Đã hoàn thành: 477 / 477 đoạn, 93 / 93 section** (kiểm tra cuối: không section nào thiếu so với EN; số đoạn mỗi section khớp).

## Đã xác nhận (không cần làm thêm)
- Quiz: 233 / 233 câu đã có bản dịch trong 8 file `hi_batch3_quiz_*.py` (gồm M10, M13, M16, M17). Kiểm tra tự động: số distractor khớp EN, không đáp án trùng distractor, không trùng distractor, không Latin. Ghi chú "55 câu còn lại" trước đây là **lỗi thời**.
- ReviewCards: 246 / 246 thẻ (`hi_batch4_reviewcards_*.py`).

## Còn lại
Lesson body: không còn đoạn nào thiếu. Các file batch 5 có tổng 477 đoạn trên 17 module.
 Làm theo module, mỗi section dịch nguyên khối.

## Ngoại lệ đã ghi nhận
- M10_S09 giữ nguyên ID dữ liệu `VT_VITHIMUTTA` và tên file nguồn `VDP-*.pdf`, vì đây là định danh, không phải văn bản dịch được. Nội dung về khoảng trống trong nguồn được dịch đầy đủ, không bịa thông tin.

## Quy tắc đã áp dụng
- Pāḷi giữ dạng Devanagari (अञ्ञसमान, मनसिकार, उद्धच्च…). Thuật ngữ khớp với summary và keyTerm đã có.
- Không dùng tiếng Việt/Anh làm placeholder. Đoạn nghi ngờ cần được ghi riêng để xét sau.
- Không bịa số trang; không trích sourceRefs.

## Việc còn lại sau batch 5
1. Tích hợp mọi proposal (batch 1–5) vào builder chỉ cho `loc == "hi"`. Không chạy `build_full_catalogs.py` trước khi có chỉ thị.
2. Chạy `check_content_locale.py hi --glossary` và kiểm tra idempotence sau tích hợp.
3. Duyệt bản dịch Hindi (List B): chưa ai duyệt, chưa đánh dấu review.
4. Xem xét các chỗ đã ghi "chưa xác minh" theo nguồn Rewata Dhamma 1967.
5. Quyết định về 6 trường paccayas vắng và về trùng `TERM_TU_QUYEN_M3` / `TERM_PANNINDRIYA`.
