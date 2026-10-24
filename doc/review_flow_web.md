# Review flow — duyệt theo ngôn ngữ trên web VDP

> Quyết định PM 2026-10-21: duyệt **theo locale**, không duyệt tập trung một người. Web app là kênh chính để gửi cho các vị.

## Tại sao tích hợp vô app (web) là đúng

- **Ngữ cảnh:** vị duyệt thấy ngay Pāli (không đổi) + Việt gốc + English fallback + bản dịch hiện tại + đề xuất của người dùng — không phải đoán "dòng nào".
- **Tiện chia sẻ:** Flutter web có URL `https://vdp.app/review?locale=si&key=PC_03&suggestionId=123` — gửi Zalo/Viber là xem được trên điện thoại, không cài gì thêm.
- **Vết audit:** mỗi đề xuất → Linear comment trên IN4-42..48 → ledger `doc/l10n_evidence/<locale>/suggestions/` → sau duyệt mới PR vào `assets/content/content_<locale>.json`. Đúng Content Governance 2 lớp.

## Flow đề xuất (giai đoạn 1 — làm ngay được)

```
Người học (web) —✏️ Đề xuất hiệu đính→ ReviewScreen (prefill locale/paliKey/currentText)
        ↓
  Tạo file doc/l10n_evidence/<locale>/suggestions/<paliKey>_<ts>.md (tracked)
  + Linear comment trên IN4-42..48 (template ở REVIEW_TEMPLATES.md)
        ↓
PM gắn label doctrinal-review, tổng hợp lên IN4-38 nếu là Nhóm A/B/C
        ↓
Vị duyệt locale mở link web (không login) → Duyệt / Yêu cầu sửa / Bác
        ↓
Agent locale cập nhật data_priority_<locale>.py::apply() hoặc glossary.csv
        ↓
check_content_locale.py --all + check_glossary_hant.py pass → PR → reviewed
```

## Giai đoạn 2 (khi có backend)

- Thay file md bằng POST tới Linear API trực tiếp từ app (cần token server-side).
- Thêm token duyệt có hạn trong URL để chống spam.
- Hiển thị badge "draft — đang chờ duyệt locale X" trong Settings → Content language picker (đã có `needsReviewWarning`).

## Không làm

- Không cho user ghi thẳng vào `content_*.json` (mất kiểm soát, sai giáo lý).
- Không bắt vị Sinhala duyệt tiếng Hoa/Nhật — mỗi link chỉ chứa một locale.

## Tài liệu liên quan

- `doc/council_verdicts/README.md#review-policy-—-per-language-not-one-elder-for-all-2026-10-21`
- `tool/content/priority_translation_agents/REVIEW_TEMPLATES.md` (templates IN4-42..48)
- `lib/features/review/review_screen.dart` (stub — UI duyệt read-only)
