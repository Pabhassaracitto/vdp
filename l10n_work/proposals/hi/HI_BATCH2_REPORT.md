# VDP · Hindi (`hi`) — Batch 2 proposal + gap review

Trạng thái: **ĐỀ XUẤT, CHƯA TÍCH HỢP.** Không sửa `assets/content/content_hi.json`, `tool/content/build_*`, Dart, test, registry, hay locale khác. Không chạy `build_full_catalogs.py`. Không đánh dấu bất kỳ mục nào là đã duyệt.

Quy ước: nếu một trường còn nghi ngờ, **không** điền tiếng Anh hay tiếng Việt vào. Trường đó được để vắng mặt, để app rơi về bản tiếng Anh (fallback đã bật). Mọi chuỗi đều là Devanagari.

## 1. Đã dịch trong batch này

| File | Nội dung | Số mục | Kiểm tra |
|---|---|---|---|
| `hi_batch2_cetasika_aspects.py` | `cetasikas.*`: characteristic, function, manifestation, proximateCause | 52 × 4 = 208 | ID khớp EN 52/52; không còn ký tự Latin |
| `hi_batch2_rupa_aspects.py` | `rupas.*`: 4 khía cạnh + doctrinalNote | 28 × 4 = 112 + 23 note | ID khớp 28/28; tập note khớp đúng 23 mục EN không rỗng |
| `hi_batch2_cittas_kammas.py` | `cittas.CI_001–CI_012.examples` (12 mục, 18 câu); `kammas.*`: doctrinalNote 16, examples 25 câu; KM_R_04 name/shortName/description | — | Độ dài mảng khớp EN; ID khớp; không còn ký tự Latin |

Tổng cộng: khoảng 405 chuỗi Devanagari mới trong batch này (208 + 112 + 23 + 18 + 16 + 25 + 3).

## 2. Để trống có chủ ý (không có chuỗi thay thế)

- **rupas** RP_011, RP_012, RP_013, RP_023, RP_024: `doctrinalNote` rỗng trong EN, nên không tạo ghi chú mới.
- **cittas** 109 mục không có `examples` trong EN: không có nội dung nguồn để dịch.
- **kammas** `doctrinalNote` và `examples` mà EN không có: không có.

## 3. Danh sách cần duyệt giáo lý (List B) — đã gặp khi dịch

1. **Thuật ngữ không có trong glossary `hi`**: मीमांसा (vīmaṃsā) trong cetasika Vīmaṃsā, प्रज्ञप्ति (paññatti) trong PC_02 — xem `HI_BATCH1_REPORT.md` §3.
2. **Hai dạng cho cùng một thuật ngữ**: `सम्यक् वाचा` và `सम्यग्वाचा` (sammā-vācā) — đã dùng `सम्यक् ...` trong cetasika, cần thống nhất với IN4-50.
3. **Tên Pāḷi/Sanskrit trong ghi chú rupa**: उतुसमुट्ठानरूप, कबळीकाराहार, आनापानसति, अवीचि, ब्रह्मपारिषद्य, वेहप्फल — dạng Pāḷi giữ theo chú thích EN; cần duyệt chính tả Devanagari.
4. **Kammas 'अहोसि'**: dịch theo nghĩa "यह हो चुका है". Cần duyệt.
5. **KM_R_04 'लोकोत्तर कर्म (मग्ग कर्म)'**: tên mới, chưa có trong glossary.
6. **CI_001–CI_012 ví dụ**: dịch theo EN; chưa đối chiếu với nguồn Pāḷi/VI. Nếu VI khác, cần sửa.
7. **Nguồn Hindi 1967 (Rewata Dhamma)**: vẫn **chưa được kiểm chứng**. Không có số trang nào được trích.

## 4. Phần còn lại (chưa làm trong batch này)

Đo trên `content_en.json` so với `content_hi.json` (hi hiện có 0 nội dung `studyModules`):

| Khu vực | EN | Hi hiện có | Ghi chú |
|---|---|---|---|
| studyModules.lessonSections.body | 477 đoạn | 0 | Tiếng Anh đã thực (không còn placeholder). Đây là khối lớn nhất. |
| lessonSections.summary | 93 | 0 | — |
| lessonSections.keyTerms.meaning | 244 | 0 | `term`, `pali`, `id` giữ nguyên. |
| quizSeeds.question | 233 | 0 | Dịch nguyên bộ: câu hỏi, đáp án, mọi distractor, giải thích. |
| quizSeeds.distractors | 699 | 0 | Phải dịch cùng câu hỏi. |
| reviewCards.front/back | 246 | 0 | — |
| Trường `sourceRefs` | — | — | Giữ nguyên theo yêu cầu, không dịch. |

Khuyến nghị: làm `keyTerms.meaning` (244 câu ngắn) trước, rồi `summary`, sau đó `body` theo từng module, bắt đầu từ M1_BASICS → M2 → M11, để đối chiếu với các locale khác.

Lưu ý: `assets/content/content_hi.json` vẫn chứa lỗi đã biết ở `VT_NGU_MON_RATLON.steps.4.doctrinalNote` (ký tự CJK `意界`). Đề xuất đã sửa ở `HI_BATCH1_REPORT.md`, nhưng builder đọc lại step từ file hiện tại nên cần sửa ở bảng nguồn.

## 5. Gate

- `check_content_locale.py hi --glossary`: RAN — PASS, 714/4312 (hiện tại).
- Build idempotence (`build_full_catalogs.py`): NOT RUN — quy định không chạy builder.
- `check_localizations.py`, flutter analyze/test: NOT RUN — không có thay đổi Dart.
- Kiểm tra cấu trúc các module batch 2 (ID, độ dài mảng, Latin, tập note): đã chạy thủ công, PASS.

## 6. Cách tích hợp (cho người tích hợp)

Các module này là bảng nguồn độc lập. Builder cần một bước đọc mới cho `cetasikas[*].{characteristic,function,manifestation,proximateCause}`, `rupas[*].{...,doctrinalNote}`, `cittas[*].examples`, `kammas[*].{doctrinalNote,examples}` (locale-guarded `if loc == "hi"`), tương tự Batch 1. Không gộp vào builder trong batch này.
