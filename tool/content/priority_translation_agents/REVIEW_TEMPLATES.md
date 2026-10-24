# Templates — Đề xuất hiệu đính (user → Linear) cho IN4-42…48

> Mục đích: người học thấy câu chưa hay trong app thì bấm **"Đề xuất hiệu đính"** → tạo issue đúng locale (IN4-42..48) để tu sĩ của chính ngôn ngữ đó duyệt. Không đi qua một trưởng lão duy nhất.
>
> Flow: App web (share link) → Linear issue per-locale → PM tổng hợp lên IN4-38 → hội đồng đa AI (nếu cần) → duyệt locale → PR.

---

## 1. Luồng trong app (đề xuất — web tiện nhất)

1. Ở mỗi thẻ Tâm/Tâm sở/Duyên/Chi duyên khởi, thêm link nhỏ **✏️ Đề xuất hiệu đính** (chỉ hiện khi `contentLanguage.status == draft`).
2. Bấm → mở `ReviewScreen` với context đã điền sẵn:
   - `locale` (hi/zh/zh_TW/si/my/ja/th)
   - `paliKey` (ví dụ `PC_11`, `CS_PHASSA`, `KM_P_01`)
   - `currentText` (câu đang hiển thị)
   - `englishFallback` (nếu đang fallback)
3. Người dùng điền: `đề xuất`, `lý do/nguồn (tuỳ chọn)`, `email (tuỳ chọn)`.
4. Gửi → tạo comment trên Linear issue tương ứng (IN4-42..48) qua API hoặc ghi vào `doc/l10n_evidence/<locale>/suggestions/<paliKey>.md` rồi PM tạo comment. Link duyệt cho vị lớn là **URL web của chính thẻ đó** + query `?review=<token>&locale=<tag>` — vị lớn mở trên điện thoại là thấy ngay Pāli + vi + en + bản hiện tại + đề xuất, bấm **Duyệt / Cần sửa thêm / Bác**.

**Tại sao nên tích hợp vô app (thay vì form ngoài)?**
- Ngữ cảnh đầy đủ: vị duyệt thấy ngay Pāli, Việt gốc, English fallback và vị trí trong Ma trận/Study Graph — không phải đoán người dùng nói về dòng nào.
- Web Flutter đã offline-first nhưng vẫn có URL share được (`/review?locale=si&key=PC_03`) — gửi Zalo/Viber cho vị lớn là xem được ngay, không cần cài thêm.
- Mọi đề xuất có vết (Linear ledger) → sau này audit được "ai đề xuất, ai duyệt, trang nào".

Nếu chưa làm UI ngay, giai đoạn 1 dùng **Linear Form link** cho mỗi locale (vẫn dùng template dưới) — app chỉ cần nút mở link ngoài.

---

## 2. Template chung (dán vào Linear issue khi tạo mới)

```markdown
### Đề xuất hiệu đính — {{locale}} — {{paliKey}}

- **Pāli key:** `{{paliKey}}` (ví dụ `PC_11`, `CS_CHANDA`, `KM_P_01`)
- **Locale:** `{{locale}}` — IN4-4x
- **Văn bản hiện tại ({{locale}}):**
  > {{currentText}}
- **English fallback (nếu có):**
  > {{englishFallback}}
- **Đề xuất (bắt buộc):**
  > {{suggestion}}
- **Lý do / nguồn (khuyến khích):**
  - Sách/bản in: {{source}} (ví dụ: Rewata Dhamma 1967 tr. 42; 攝阿毘達磨義論 葉均 tr. 88)
  - Hoặc: "theo cách dùng phổ biến trong chùa X" — PM sẽ đánh `confidence=low` và chuyển hội đồng.

- **Người đề xuất:** {{userNameOrAnon}} — {{emailOrAnon}}
- **Link duyệt (auto):** https://vdp.app/review?locale={{locale}}&key={{paliKey}}&suggestionId={{id}}

**PM checklist:**
- [ ] Gắn label `agent-handoff` + `doctrinal-review`
- [ ] Thêm vào `doc/l10n_evidence/{{locale}}/suggestions/{{paliKey}}.md`
- [ ] Nếu cần, tạo task con trên IN4-38 (Nhóm A/B/C) để hội đồng đa AI chấm
- [ ] Sau duyệt: cập nhật `l10n_work/glossary.csv` hoặc `data_priority_<locale>.py::apply()` + `check_content_locale.py --all` pass
```

---

## 3. Templates per-locale (copy-paste vào mô tả issue IN4-42…48)

### IN4-42 — hi (Hindi)
> **Tiêu đề issue:** `[hi] Đề xuất hiệu đính — Hindi`
> **Mô tả issue (ghim):** Dùng cho mọi đề xuất `content_hi.json`. Người duyệt: tu sĩ Hindi (Rewata Dhamma / Dharmarakshita). Quy tắc: Pāḷi-Devanāgarī mặc định, ngoại lệ Sanskrit chỉ khi có trang trong giáo trình Theravāda Hindi đã chỉ định (xem `tool/content/priority_translation_agents/REVIEW_TEMPLATES.md#hi`). Template trên.

### IN4-43 — zh (Simplified Chinese)
> **Tiêu đề:** `[zh] Đề xuất hiệu đính — 简体中文`
> **Người duyệt:** Tăng đoàn Hán (bản 攝阿毘達磨義論, 菩提比丘). Shinjitai không áp dụng — dùng giản thể chuẩn.

### IN4-44 — zh_TW (Traditional Chinese)
> **Tiêu đề:** `[zh_TW] Đề xuất hiệu đính — 繁體中文`
> **Người duyệt:** Tăng đoàn Đài Loan (CBETA). Lưu ý: 55 dòng `禪` đã fix ở `ce97b61` — mọi đề xuất mới phải dùng `禪/攝`, không `禅/摂`.

### IN4-45 — si (Sinhala)
> **Tiêu đề:** `[si] Đề xuất hiệu đính — සිංහල`
> **Người duyệt:** Trưởng lão Sri Lanka (duyên hiện có) — **chỉ duyệt si**. Link duyệt gửi qua web/app dạng `https://vdp.app/review?locale=si&key=...` — vị lớn không cần biết ngôn ngữ khác.

### IN4-46 — my (Myanmar)
> **Tiêu đề:** `[my] Đề xuất hiệu đính — မြန်မာ`
> **Người duyệt:** Tăng Miến. Chờ Q13a–h từ agent `my` (IN4-46).

### IN4-47 — ja (Japanese)
> **Tiêu đề:** `[ja] Đề xuất hiệu đính — 日本語`
> **Người duyệt:** Tăng Nhật (ウ・ウェープッラ / 水野弘元). Yêu cầu shinjitai (壊/圧, không 壞/壓).

### IN4-48 — th (Thai)
> **Tiêu đề:** `[th] Đề xuất hiệu đính — ไทย`
> **Người duyệt:** Tăng Thái (อภิธัมมัตถสังคหะ). Hiện silent — template sẵn để kích hoạt.

---

## 4. Gợi ý tích hợp web (kỹ thuật ngắn)

- **Route:** `/review` (Flutter web `go_router` hoặc `onGenerateRoute`): `ReviewScreen(locale, paliKey, suggestionId)` — read-only cho vị duyệt, không cần đăng nhập, token trong URL để chống spam.
- **Share:** từ `citta_detail_sheet.dart` / `module_detail_screen.dart` / `matrix_screen.dart` thêm nút "Chia sẻ để duyệt" → copy link `https://vdp.app/review?locale=si&key=PC_03` — gửi Zalo cho vị lớn.
- **Fallback:** nếu backend Linear chưa có, lưu tạm vào `doc/l10n_evidence/<locale>/suggestions/` (tracked, PM sẽ tạo Linear comment thủ công). Khi có API key thì tự động.

Không bịa giáo lý: mọi đề xuất không có nguồn vẫn được ghi nhận với `confidence=low` và gắn `doctrinal-review`, chờ duyệt locale mới merge.

