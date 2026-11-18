# RÀ SOÁT — 7 NGÔN NGỮ ƯU TIÊN HIỂN THỊ ĐẦY ĐỦ
*Nhánh: `arena/b1d93c5a-vdp` @ `e194c4c` — base đã gộp PR #37 (English fallback) — ngày 2026-11-18*

> Yêu cầu: “xem tôi cần làm ngôn ngữ đặc biệt ưu tiên có thể hiển thị đầy đủ nhé. Hiện hội đồng AI cũng đã có phản hồi, các nhánh dịch riêng cho các ngôn ngữ cũng đã dịch, chỉ là chưa thấy nó pr thôi.”

---

## 1) Kết luận nhanh

**Hiện đã “hiển thị được” nhưng chưa “hiển thị đầy đủ bằng tiếng mẹ đẻ”.**

- 7 locale `hi / zh / zh_TW / si / my / ja / th` đã là **`draft` + `allowsEnglishFallback: true`** → app **không còn ô trống/blank**, phần chưa dịch sẽ **hiện bằng English** (không bao giờ rơi về tiếng Việt — đúng nguyên tắc `vi` là nguồn, không phải fallback).
- Đây là hành vi **cố ý do PR #37 (`d9022c1f → e194c4c`)**: “Show English fallback for untranslated priority content” đã merge 2026-10-07.
- Nếu bạn chuyển ngôn ngữ nội dung sang Hindi mà vẫn thấy 70–80% tiếng Anh, **không phải lỗi render** — mà là **dữ liệu chưa được dịch đủ**.

Để **hiển thị đầy đủ** (= ≥95% slot là tiếng mẹ đẻ, không còn English lấp chỗ trống) cần hoàn thành **Epic PSRC-37**.

---

## 2) Trạng thái hiện tại (đo trực tiếp trên nhánh)

### 2.1 Registry — `lib/core/localization/content_languages.dart`

```dart
kContentLanguages = [
  vi → source,
  en → reviewed,
  hi/zh/zh_TW/si/my/ja/th → draft, allowsEnglishFallback: true  // ← đã bật
]
```

`_localizedChain` trong `content_catalog.dart`:
- `locale == vi` → chỉ lấy `vi`
- locale khác → lọc bỏ `vi`; giữ `en` **chỉ khi** `allowsEnglishFallback == true`
- `zh_TW` được chain `zh_TW → zh → en` trước khi lọc → đúng kỳ vọng Đài Loan mượn Giản thể.

**=> Cơ chế fallback đã đúng. Không cần sửa code hiển thị nữa.**

### 2.2 Dữ liệu — `assets/content/content_*.json`

| Locale | File tồn tại | Slot đã dịch | % | `lessonTranslationStatus` | Ghi chú |
|--------|--------------|--------------|---|------------------------|---------|
| en | ✓ | 4493/4312 | 104.2% | partial | 3 module còn thiếu: M15, M16, M17 |
| hi | ✓ | 717/4312 | 16.6% | partial | — |
| si | ✓ | 717/4312 | 16.6% | partial | — |
| my | ✓ | 717/4312 | 16.6% | partial | — |
| th | ✓ | 717/4312 | 16.6% | partial | — |
| zh | ✓ | 1120/4312 | 26.0% | partial | đã có M1_BASICS, M2_SI_PHAN, M11_BIET_CANH |
| zh_TW | ✓ | 1120/4312 | 26.0% | partial | như zh |
| ja | ✓ | 1120/4312 | 26.0% | partial | như zh |

`check_content_locale.py --all` → **tất cả ✓ (không hard error)**, nhưng coverage thấp.

Cấu trúc mỗi locale:
- `cittas` 121 · `cetasikas` 52 · `studyModules` 17 module đều có key, nhưng **chỉ ~2–3 module có `lessonSections/reviewCards/quizSeeds` thực sự**; phần còn lại chỉ có `title/description` sơ lược.
- Các nhóm `kammas / paccayas / paticcas / vithis / rupas` đã có khung nhưng nhiều trường optional đang `null` → UI sẽ **ẩn block** hoặc **lấy English**.

### 2.3 Thuật ngữ — `l10n_work/glossary.*`

- `glossary.json`: **397 headwords**, **7/7 locale 100% ô đã điền** (hi/zh/zh_TW/si/my/ja/th không còn missing).
- **Chưa có hồ sơ ký duyệt** (PSRC-37 ghi rõ). Theo plan, glossary ≥95% + senior approval mới được tính “đủ”.

→ Thuật ngữ đã thống nhất, nhưng **an toàn giáo lý vẫn phụ thuộc vào `check_content_locale.py --glossary` (S5)** khi dịch prose.

### 2.4 Font — `assets/fonts/subsets/`

- Đã có đủ 18 subset (Devanagari, SC/TC, JP, Sinhala, Myanmar, Thai …) — bản hiện tại **4.06 MiB**.
- `subset_fonts.py` **chưa chạy lại sau đợt dịch mới** → nếu đã thêm nhiều chữ Hán (zh/ja) sẽ thiếu glyph → ô vuông ☐ trên máy thật. Cần chạy lại trước khi ship.

### 2.5 UI tách bạch

- **Ngôn ngữ giao diện** (`supportedAppLanguages`, 26 locale) và **ngôn ngữ nội dung** (`kContentLanguages`, 9) là **hai trục độc lập** — người Sri Lanka có thể để UI English nhưng đọc nội dung Sinhala. Đây là thiết kế, không phải bug.

---

## 3) Hội đồng AI & phản hồi đã có

Đã merge vào `main` đến `78efbe1`:

- **Epic PSRC-37** — `In Progress` (P1): định nghĩa 3 batch dịch, quy tắc *không dán English/Vietnamese làm placeholder*, giữ `allowsEnglishFallback`, một commit gộp mỗi chu kỳ trên nhánh Arena.
- **Bug PSRC-72** — `Todo` (P1): **KAMMAS KM_P_*/KM_U_*/KM_R_04 và CI_026/027 bị hoán đổi** trong 7 catalog đã ship + glossary rows 288–301/360/390. **Cần integrator sửa một lần** ở `tool/content/data_priority_*.py` trước khi cho 7 agent dịch tiếp, nếu không sẽ copy lỗi.
- **PSRC-74/75/60/59** — WEB-TTS, Vīthimutta missing source, Pages/Tag, QA device — không chặn hiển thị ngôn ngữ nhưng nằm trong “atRisk” của project VDP (progress 9%).

**Hàm ý:** Hội đồng đã duyệt **hướng fallback English trong draft** — không yêu cầu tắt fallback sớm. Chỉ sau khi **≥95% + duyệt doctrinal** mới đổi `draft → reviewed` và cân nhắc tắt fallback.

---

## 4) “Các nhánh dịch riêng … chưa thấy pr”

- `git branch -r` hiện có **~30 nhánh `arena/*`** (vd `arena/01a0f87d`, `01a0f880`, `01a0f884` …) — **hầu hết đã MERGED** (xem `gh pr list --state merged`: 30-43). Chúng là đợt dịch **M6/M10/M8/M14/M1/M11** trước 2026-10-04, chính là phần tạo ra 16–26% hiện tại.
- **Không có PR open** trên `origin/main` lúc 2026-11-18 — đúng như bạn nói “chưa thấy nó pr”. Có thể dịch mới đang nằm ở:
  - nhánh local chưa push,
  - worksheet `l10n_work/content_<loc>.worksheet.json` (gitignored, không commit),
  - hoặc nhánh `arena` mới chưa push lên remote.

**Cần làm:** Gom các worksheet/branch lẻ vào **một nhánh tích hợp** (vd `arena/b1d93c5a-vdp` hiện tại) rồi mở **một PR tổng**.

---

## 5) Để “hiển thị đầy đủ” — checklist hành động

### A. Sửa bug dữ liệu trước khi dịch tiếp (1 lần, trên nhánh này)

- [ ] **PSRC-72**: sửa `tool/content/data_priority_conditions.py` (KAMMAS) và `data_priority_cittas.py` (CI_026/027) theo `assets/data/*.json`; chạy `generate_priority_locales.py` → `build_glossary.py`; check glossary rows 288–301/360/390 khớp `pali`.
- [ ] Thêm **guard test**: mỗi `citta/kamma` id, `doctrinalNote` Pāḷi / glossary `pali` phải bằng `assets/data` `namePali`.

### B. Dịch theo **thứ tự batch của PSRC-37** (giữ nguyên cho mọi locale)

1. **Batch 1 — Nhân Duyên**: `paticcas` (characteristic/function/manifestation/proximateCause, notes, examples), `paccayas` (paccayaDhamma/paccayuppanna/notes/examples/subdivision), `vithis` (context, step name/desc/notes).
2. **Batch 2 — Thực thể học**: `cittas` (examples), `cetasikas` (name/shortName/description/4 aspects), `rupas`, `kammas` (chỉ trường app có hiển thị).
3. **Batch 3 — Bài học**: 17 module × `lessonSections / reviewCards / quizSeeds` — dịch **trọn item quiz** hoặc không.

> Quy tắc: không dán EN/VI làm placeholder; thiếu thì **để trống** cho English fallback. Không sửa `id/pali/type/sourceRefs`. Prompt gốc: `tool/content/priority_translation_agent_prompt.md`.

### C. Sinh & kiểm tra

```bash
python3 tool/content/build_full_catalogs.py   # idempotent, 2 lần để chắc
python3 tool/content/check_content_locale.py --all --glossary --strict
python3 tool/check_localizations.py
python3 tool/subset_fonts.py                  # cần pyftsubset + fonttools
flutter analyze
flutter test
```

- **Đích**: 7 catalog **≥95% slot** (hiện 16–26% → cần +69–79%), `check_content_locale --glossary` **0 hard error**, `S1` (untranslated) giảm mạnh.

### D. Ra PR

- Trên `arena/b1d93c5a-vdp`: gộp các thay đổi `assets/content/content_*.json` + `l10n_work/glossary.*` nếu có + `assets/fonts/subsets/*` sau subset.
- Tiêu đề PR: `content(l10n): Batch 1 Nhân Duyên — 7 locale ưu tiên (PSRC-37)`
- Body PR: đính **bảng coverage `check_content_locale --all`**, **glossary report**, **số glyph tăng thêm**, và **không** đổi `content_languages.dart` trong PR này.

### E. Duyệt & bật hiển thị “đủ”

- Gửi **List B** (câu hỏi giáo lý) cho người duyệt → có ký duyệt mới đổi:
  ```dart
  ContentLanguage(tag: 'hi', status: ContentTranslationStatus.reviewed, allowsEnglishFallback: false)
  ```
  và tương tự cho locale đã đủ. **Không đổi `draft → reviewed` trước khi có ký**.

- Sau khi `reviewed`, English fallback có thể **tắt** (cân nhắc) — khi đó phần còn thiếu sẽ **ẩn block** thay vì hiện English, đúng với “hiển thị đầy đủ bằng tiếng mẹ đẻ”.

---

## 6) Những gì **không cần làm** ngay

- **Không sửa `content_catalog.dart` / `content_languages.dart`** cho mục đích hiển thị — fallback đã đúng.
- **Không dịch UI `lib/l10n/app_*.arb`** cho 7 locale (đã có 26 UI locale riêng).
- **Không copy English vào JSON làm placeholder** — sẽ vi phạm H3 và phá `S1`.

---

## 7) Rủi ro nếu để nguyên

- Người học Hindi/Thai … sẽ thấy **chủ yếu tiếng Anh**, dễ hiểu lầm là app chưa hỗ trợ dù đã chọn đúng ngôn ngữ.
- Nếu vội tắt `allowsEnglishFallback` khi mới 16% → **màn hình trống nhiều block** (do `optionalText` trả về `null` → caller ẩn).

---

## 8) Đề xuất bước tiếp theo cho nhánh này

1. **Bạn xác nhận**: có muốn tôi **gom** các worksheet/branch dịch đang rải rác vào `arena/b1d93c5a-vdp` và chạy **Batch 1** cho 7 locale luôn không? Tôi sẽ:
   - Sửa PSRC-72 trước,
   - Chạy `build_full_catalogs.py` + `check_content_locale --all`,
   - Mở PR draft để bạn và hội đồng duyệt.
2. Hoặc nếu bạn muốn tự push nhánh dịch, chỉ cần **giữ nguyên `draft + allowsEnglishFallback: true`** — tôi sẽ review PR theo checklist §5C.

---

*Tham chiếu: `doc/localization_content_plan.md §8`, `tool/content/README.md`, `PSRC-37`, `PSRC-72`, `content_catalog.dart: _localizedChain`, `PR #37`.*
