# 🔍 QA Report — Chuẩn bị Release 0.10.2

**Ngày:** 2026-10-04 · **Phạm vi:** toàn app (focus Bảng Tương Ứng + pipeline release) ·
**Baseline:** `origin/main @ 575311b` (= v0.10.1 + 1 commit)

> Tóm tắt cho người gấp: **2 lỗi P0 đã chặn release** (một trong số đó làm
> mọi lệnh `flutter pub get` / build từ nguồn mới bị lỗi ngay từ 2 commit
> gần nhất) — cả hai đã được sửa và xác minh CI xanh ở branch này. Còn
> **1 việc thủ công** dành cho admin repo trước khi tag (xem §5).

---

## 1. P0 — `flutter pub get` hỏng: ARB vi phạm cú pháp ICU (ĐÃ SỬA)

**Triệu chứng:** mọi CI "Get dependencies" trên main fail từ commit
`575311b` (job Pages deploy 36s → chết). Fresh `git clone && flutter pub get`
cũng fail tương tự — **release v0.10.2 build từ main sẽ không thể build**.

**Nguyên nhân gốc** (xác định bằng workflow chẩn đoán chạy `flutter gen-l10n`
trực tiếp trong CI): 2 chuỗi mới thêm trong commit "Fix residual English…"
dùng dấu nháy đơn ASCII — vốn là ký tự escape của ICU message format:

```
[app_it.arb:karaokeModeSubtitle] ICU Lexing Error: Unmatched single quotes.
[app_fr.arb:karaokeModeSubtitle] ICU Lexing Error: Unmatched single quotes.
```

`l'ascolto` / `l'écoute` → gen-l10n coi `'` mở chuỗi escape không khớp.
`flutter analyze`/`flutter test` vẫn xanh (khoanh vùng được vì pub get fail
* sau * khi dependency đã resolve) nên lỗi trốn qua CI phân tích mã nguồn
trong 6 giờ.

**Fix:** bỏ dấu nháy ASCII, dùng U+2019 (’) — đúng quy ước sẵn có của mọi
chuỗi Pháp khác trong app ("Liste d’écoute"). Sau fix: `pub get` xanh,
gen-l10n xanh, CI xác nhận.

**Phòng ngừa:** 3 rule mới trong `tool/check_localizations.py`? — chưa cần;
đã có quét toàn ARB trong `tool/add_matrix_listen_keys.py` (bước safety
check cuối file) và mọi ARB giờ round-trip JSON chuẩn.

## 2. P0 — Generated l10n lệch nghiêm trọng so với ARB (ĐÃ SỬA)

**Triệu chứng:** người dùng các ngôn ngữ ưu tiên vẫn thấy tiếng Anh lẫn lộn
dù ARB đã dịch đủ — chính là bug "residual English" mà các commit gần nhất
cố sửa nhưng **không bao giờ tới được người dùng**.

**Nguyên nhân gốc:** app import bản `lib/l10n/app_localizations*.dart`
checked-in, nhưng chuỗi dịch mới chỉ được thêm vào `.arb` mà **không chạy
lại `flutter gen-l10n`**. Đo đạc tại thời điểm audit:

| Locale | Số key lệch giữa dart ↔ arb |
|--------|------------------------------|
| zh | 295 |
| th | 172 |
| si | 169 |
| my | 168 |
| hi | 167 |
| 20 locale còn lại | 8–74 mỗi locale |

Ngoài ra `AppLocalizationsZhTw` là subclass thủ công chỉ override vài key
→ zh_TW users nhận chủ yếu chuỗi giản thể.

**Fix:** CI trong branch này chạy `flutter gen-l10n` thật rồi commit lại
toàn bộ 26 file generated (commit `chore(l10n): regenerate…`). Sau đó
script đối chiếu độc lập báo **0 lệch** cho cả 26 locale.

## 3. P1 — Workflow GitHub Pages fail 7/7 lần chạy (NỬA ĐÃ SỬA)

Hai lớp lỗi chồng nhau:

1. **Bước "Get dependencies"** fail kể từ `575311b` → chính là lỗi P0 §1
   (đã sửa) + thêm lớp retry `pub get || (sleep 20 && pub get)` chống
   nghẽn tạm thời pub.dev (đã quan sát 2 lần trong ngày 2026-10-04).
2. **Bước "Deploy to GitHub Pages"** fail ở mọi run từ trước tới nay:
   API `GET /repos/…/pages` trả **404 — Pages chưa được bật cho repo**
   (workflow đã ghi rõ cần setup thủ công một lần trong comment đầu file,
   nhưng chưa ai làm). Việc này không thể làm từ workflow/token CI —
   xem §5. Workflow giờ tự in hướng dẫn cụ thể vào job summary khi fail.

## 4. P1 — Ba nguồn phiên bản lệch nhau (ĐÃ SỬA)

| Nơi | Giá trị trước |
|-----|---------------|
| Màn Cài đặt (hardcode!) | `0.2.0` |
| pubspec.yaml | `0.3.0+6` |
| Tag release | `v0.10.1` |

**Fix:** `lib/core/constants/app_version.dart` làm nguồn sự thật duy nhất;
Cài đặt đọc `appVersionName`; pubspec nâng `0.10.2+7`. Test
`test/app_version_test.dart` fail build nếu hai nơi lệch nhau lần nữa.

## 5. ✅ Checklist còn lại TRƯỚC khi tag `v0.10.2` (cho admin repo)

1. **Bật GitHub Pages (một lần):** Settings → Pages → Build and
   deployment → Source: **GitHub Actions**. Sau đó re-run workflow
   "Deploy Web to GitHub Pages". *(Đã thử qua API — token không đủ quyền,
   cần tay admin.)*
2. Merge PR này vào main.
3. Tag `v0.10.2` trên main → workflow build (Android ARM64 / iOS / Windows /
   Linux / Web) và tạo release tự động như v0.10.1.

## 6. Đã rà và TỐT (không phát hiện lỗi)

- **Dữ liệu giáo lý:** 121 Tâm / 52 Tâm Sở, id không trùng; 6.292 association
  đều trỏ tới tâm sở tồn tại (3341 always / 78 sometimes / 2873 never);
  mọi Tâm/Tâm Sở có `namePali`. `check_localizations.py`: 26 locale OK.
- **Bộ test:** 111/111 pass trên branch này (103 có sẵn + 8 mới);
  `flutter analyze` 0 error — đồng thời dọn nốt 5 warning tồn đọng
  (3× unused catch stack, 1 unused import, 1 dead code ở `vdp_repository`)
  → **0 phát hiện từ analyzer**, hoàn thành mục tiêu kanban "0 lỗi".
- **Quy ước icon cờ 🇻🇳🇹🇭…** trong language picker: là colour emoji nên
  render bởi emoji font hệ thống, không cần subset Noto (đã đối chiếu
  logic `tool/subset_fonts.py`).
- **README lỗi thời:** mục "Dữ Liệu Hiện Có (Mẫu)" vẫn ghi 5/121 Tâm,
  28/52 Tâm Sở — đã cập nhật theo thực tế dataset.

## 7. Thay đổi chính của bản 0.10.2 (tóm tắt cho release notes)

1. **Tìm kiếm Bảng Tương Ứng dời vào AppBar** — thu hồi nguyên một hàng
   (~56px portrait) cho không gian bảng; kính lúp thu gọn có chấm báo
   hiệu khi còn bộ lọc; giữ nguyên đủ chức năng (tìm Tâm/Tâm Sở, cuộn tới
   kết quả đầu, làm mờ kết quả không khớp).
2. **Nghe 121 Tâm & 52 Tâm Sở ngay trong Bảng Tương Ứng** — cùng engine
   nghe của tab Học/Nhân Duyên: nhấn giữ hàng/cột để nghe từ mục đó, nút
   tai nghe ở góc bảng để nghe cả danh sách, hàng/cột đang đọc được tô
   sáng, thanh nghe nổi điều khiển từ bất kỳ đâu và đưa về đúng tab.
3. Sửa P0 §1–§2: `flutter pub get` xanh trở lại; người dùng 26 locale
   nhận đúng bản dịch đã góp trong ARB (đặc biệt zh/zh_TW/hi/my/si/th).
4. Hiển thị phiên bản đúng trong Cài đặt; pubspec `0.10.2+7`.
5. Pages deploy: retry pub get + tự in hướng dẫn khi chưa bật Pages.
