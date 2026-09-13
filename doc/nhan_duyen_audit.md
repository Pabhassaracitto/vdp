# Tab Nhân Duyên — Kiểm kê hiện trạng & phần còn thiếu

Cập nhật: 2026-09-12 · Phạm vi: tab **Nhân Duyên** (`PaticcaScreen`) + module học `M8_NHAN_DUYEN`.

Tài liệu này trả lời 2 câu hỏi: (1) phần Nhân Duyên **còn thiếu gì** so với plan,
(2) **24 Duyên Hệ** lấy nguồn từ đâu và độ tin cậy ra sao.

---

## 1. Hiện trạng trước thay đổi này (đã kiểm chứng)

| Hạng mục | Kết quả kiểm tra |
| --- | --- |
| `lib/features/paticca/presentation/screens/paticca_screen.dart` | 22 dòng: `AppBar` + `PaticcaFilterBar` + `PaticcaListView`. Không có tab, không có sơ đồ. |
| `lib/features/paticca/presentation/widgets/paticca_detail_sheet.dart` | 53 dòng: chỉ hiện tên + `links`. |
| Dữ liệu bỏ trống trong detail sheet | `descriptionVi`, `trangThai`, `phanSu`, `thanhTuu`, `nhanGan`, `examples`, `doctrinalNote`, `relatedCittaIds`, `relatedCetasikaIds` — **9/13 field có sẵn trong `assets/data/paticca.json` nhưng UI không đọc**. |
| Code chết trong state | `PaticcaViewTab { list, flowchart, threeKiep }`, `switchTab()`, `chainDirection`, `highlightedNodeIds`, `isAnimating` (`paticca_providers.dart`, `paticca_flowchart_state.dart`) — **không widget nào dùng** (kiểm bằng `grep -rn "PaticcaViewTab\|chainDirection" lib/`). |
| `assets/data/paticca.json` | 12 chi, mỗi chi 1 `link` xuôi; có Tứ Nghĩa, ví dụ, ghi chú. Không có phần 24 duyên. |
| Nội dung học `M8_NHAN_DUYEN` (`assets/content/content_vi.json`) | 7 lesson sections (`M8_S01`…`M8_S07`), 18 review cards, 16 quiz seeds, `translationStatus: reviewed`. **Chỉ phủ tới chi 2 (Hành)** — 10 chi còn lại chưa có lesson section. |
| `docs/study-content-sources.md` (auto-generated) | M8 có 7 section, tất cả dẫn `VDP-ToatYeuVeDuyen.pdf` p.2–8. |
| Plan | `doc/milestone_plan.md:109` — `M5-T1 Flowchart Nhân Duyên`; `doc/milestone_plan.md:504` — `M5-T1 | Nhân Duyên | LATER`. `doc/blueprint.md:51,129` — Flow Layer; `blueprint.md:77` — "Tầng 4: Duyên xung đột (Vô Minh + Trí Tuệ trong Nhân Duyên)". |
| Kanban | `doc/vdp_project_progress_kanban.md` — **không có task nào cho Nhân Duyên**. |

Kết luận: phần Nhân Duyên đúng là **sơ sài** — có dữ liệu 12 chi khá đầy đủ nhưng UI
chỉ dùng ~30%, và toàn bộ phần **Paṭṭhāna (24 duyên hệ)** chưa tồn tại.

---

## 2. Đã làm trong thay đổi này

### 2.1. Thêm 24 Duyên Hệ (Paṭṭhāna naya)

| Thành phần | Đường dẫn |
| --- | --- |
| Dữ liệu 24 duyên | `assets/data/paccayas.json` (24 mục, `order` 1→24, `sourceRefs` theo từng mục, `meta.sourcePolicy`) |
| Model | `lib/data/models/paccaya_model.dart` (viết tay, không codegen — xem chú thích trong file) |
| Repository | `lib/features/paticca/data/paticca_repository_impl.dart` → `getAllPaccayas()`; `lib/data/repositories/vdp_repository.dart` → `_loadPaccayas()` + `VdpDataState.paccayas` |
| Providers | `paccayaListProvider`, `paccayaFilteredListProvider`, `paccayaGroupFilterProvider`, `paccayaSearchProvider`, `paccayasForPaticcaProvider` |
| UI | `PaticcaScreen` có `SegmentedButton` **12 Chi / 24 Duyên Hệ** (dùng `switchTab()` — hết code chết); `paccaya_list_view.dart`, `paccaya_list_item.dart`, `paccaya_group_filter_bar.dart`, `paccaya_detail_sheet.dart`, `paccaya_source_notice.dart` |
| Nối 2 phần | Detail sheet của một chi 12 Nhân Duyên hiện các duyên hệ vận hành trong chi đó (`operatesInPaticca`), bấm vào mở detail sheet của duyên. |
| Kiểm tra dữ liệu | `test/paccaya_data_test.dart` (chạy bằng `flutter test`) và `tool/check_paccaya_data.py` (chạy được khi chưa có SDK) |
| i18n | 24 khoá mới trong `lib/l10n/app_en.arb` + `app_vi.arb`, đã sinh getter cho cả 25 lớp `AppLocalizations*` |

### 2.2. Làm dày phần 12 chi

Detail sheet chi Nhân Duyên giờ hiện: số thứ tự + chip **kiếp** (quá khứ / hiện tại /
vị lai) + chip **vatta** (Phiền Não / Nghiệp / Quả), mô tả, **Tứ Nghĩa** (đặc tướng –
phận sự – thành tựu – nhân gần), liên kết nhân quả, ví dụ, các duyên hệ liên quan,
và ghi chú giáo lý — tức dùng hết dữ liệu đã có sẵn trong JSON.

---

## 3. Nguồn cho 24 duyên hệ — và điều cần nói thẳng

**Yêu cầu:** ưu tiên tài liệu dùng trong hệ thống Pa-Auk hoặc Thanh Tịnh Đạo.

**Kết quả tra cứu:**

1. **Không tìm được tài liệu Pa-Auk liệt kê 24 duyên.** Các ấn phẩm của Pa-Auk
   Tawya Sayadaw tra được (*Knowing and Seeing*, *The Workings of Kamma* — Pa-Auk
   Meditation Centre (Singapore), 2012, 405 tr., mục lục: The ClogBound Sutta / The
   Second ClogBound Sutta / The Workings of Kamma / The Small Kamma-Analysis Sutta /
   Creating a Human Being / The Unworking of Kamma / The Forty Meditation Subjects)
   giảng về nghiệp và duyên khởi, không có chương/phụ lục liệt kê 24 paccaya.
   **Đây là điểm chưa chắc chắn** — nếu thầy có bản PDF bài giảng Paṭṭhāna của
   Pa-Auk, gửi vào `reference/` thì dữ liệu sẽ được đối chiếu lại theo nguồn đó.
2. **Thanh Tịnh Đạo (Visuddhimagga) thì có**: chương XVII (Paññābhūminiddesa),
   đoạn §§65–104 (bản dịch Anh của Ñāṇamoli, *The Path of Purification*, BPS) phân
   tích 12 chi theo 24 duyên; ví dụ §XVII.102 nói Vô minh làm duyên cho Hành thiện
   bằng **cảnh duyên** và **cận y duyên**.
3. **Nguồn gốc vẫn là Paṭṭhāna** (Abhidhamma Piṭaka VII), mục *Paccayuddesa* (liệt kê
   24) và *Paccayaniddesa* (định nghĩa từng duyên). Đây là nguồn canonical, độ tin
   cậy cao nhất.
4. **Tài liệu trong repo thì không phủ phần này**: `reference/VDP-ToatYeuVeDuyen.pdf`
   (27 trang) chính là bản dịch Việt chương *Paccaya-saṅgaha-vibhāgo* — trang 3 nói rõ
   đại cương có **hai phần**: A/ Định Luật Phát Sanh Tùy Thuộc (Paṭiccasamuppāda) và
   B/ Định Luật Duyên Hệ Tương Quan (Paṭṭhānanayo) — nhưng **toàn bộ 27 trang chỉ dạy
   phần A**. Kiểm bằng: `python3 tool/extract_pdf_text.py` rồi `grep -i "paccaya"
   .pdfextract/` → không có mục nào liệt kê 24 duyên trong cả 11 PDF.

**Vì vậy `paccayas.json` dẫn nguồn theo thứ tự:** Paṭṭhāna (canonical) → Thanh Tịnh
Đạo ch. XVII (commentarial) → bản dịch U Nārada *Conditional Relations* (PTS 1969/1981)
cho đối chiếu Anh ngữ. Mỗi mục trong JSON có `sourceRefs` + `confidence`, và
`meta.reviewStatus: "needs_senior_review"`.

**Điểm cần bậc trưởng lão duyệt (Content Governance Lớp 1 — `blueprint.md`):**

| Nội dung | Độ tin cậy | Ghi chú |
| --- | --- | --- |
| Danh sách & thứ tự 24 duyên | Cao | Khớp *Paccayuddesa*; `tool/check_paccaya_data.py` khoá cứng thứ tự. |
| Pháp năng duyên / sở duyên | Cao | Theo công thức *Paccayaniddesa*. |
| Công thức Pāḷi | Chỉ ghi ở 3 duyên đã đối chiếu được nguyên văn (Nhân, Vô gián, Tiền sanh) | Các duyên khác để `paliFormula: null` thay vì đoán. |
| **Thuật ngữ tiếng Việt** (Nhân duyên, Cảnh duyên, Trưởng duyên…) | **Chưa đối chiếu với tài liệu trong repo** | Dùng thuật ngữ Vi Diệu Pháp thông dụng; cần thầy duyệt trước khi release. |
| `operatesInPaticca` (duyên nào vận hành trong chi nào) | Trung bình — **mới phủ một phần** | Chỉ ghi những chỗ có dẫn chứng (Thanh Tịnh Đạo XVII, Nyanatiloka *Guide* VII). Còn 10/24 duyên để trống, xem §4. |
| `group` (6 nhóm lọc UI) | Phân nhóm **do ứng dụng đặt ra** | Đã ghi rõ trong `meta.groupNote`; không phải phân loại gốc của Paṭṭhāna. |
| Chi pháp số lượng ("84 tâm", "54 tâm"…) | Cần duyệt | Vài mục còn câu ghi chú dạng "? — chính xác:" để nhắc người duyệt chốt con số. |

---

## 4. Việc còn lại cho tab Nhân Duyên

| ID | Việc | Ưu tiên | Ghi chú |
| --- | --- | --- | --- |
| M8-T1 | Duyệt thuật ngữ + chi pháp 24 duyên với bậc trưởng lão | **CAO** | `meta.reviewStatus` = `needs_senior_review`. Chốt xong thì đổi thành `reviewed`. |
| M8-T2 | Điền `operatesInPaticca` cho 10 duyên còn trống | CAO | Cần đối chiếu Thanh Tịnh Đạo XVII §§65–104 từng chi; hiện mới có 52 cặp duyên–chi, và PC_17 (Thiền duyên) chưa gắn chi nào. |
| ~~M8-T3~~ | ~~Bài học cho 10 chi còn lại (Thức → Lão Tử)~~ | **ĐÃ CÓ TRÊN `main`** | PR #5 (`f3228e1`) đã thêm module `M17_DUYEN_CHI_TIET` — "Duyên Khởi: Các Chi 3–12" (`lib/data/models/study_module.dart:522` trên `origin/main`). Nhánh này rẽ từ `43b48ed` nên chưa thấy. |
| M8-T4 | Thêm section nội dung học cho 24 duyên hệ | TRUNG BÌNH | Cần nguồn duyệt xong (M8-T1). **ID module phải từ `M18_` trở đi** — `M15_TAM_SO_PHOI_HOP`, `M16_NGUOI_VA_COI`, `M17_DUYEN_CHI_TIET` đã được dùng trên `main` (PR #5); hoặc mở rộng chính `M8_NHAN_DUYEN`. |
| M8-T5 | Flowchart 12 chi (`PaticcaViewTab.flowchart`) | TRUNG BÌNH | State + logic highlight xuôi/ngược đã có sẵn trong `paticca_flowchart_state.dart`, chỉ thiếu widget. |
| M8-T6 | Sơ đồ 3 kiếp (`PaticcaViewTab.threeKiep`) | TRUNG BÌNH | Dữ liệu `kiep` đã có trong từng chi. |
| M8-T7 | "Tầng 4: Duyên xung đột (Vô Minh + Trí Tuệ)" | THẤP | `blueprint.md:77` — cần rule trong validator. |
| M8-T8 | Đưa 24 duyên vào `VdpDataValidator` | THẤP | Hiện chỉ validate cittas/cetasikas; có thể thêm rule "đủ 24 duyên, thứ tự đúng". |
| M8-T9 | Quiz / review cards cho 24 duyên | THẤP | Sau M8-T4. |
| M8-T10 | Dịch tiếng Anh nội dung 24 duyên | THẤP | `content_en.json` đang `source_only` cho toàn bộ module. |

### Kiểm chứng đã chạy trong môi trường này

```
$ python3 tool/check_paccaya_data.py
PASS — 24 Duyên Hệ
  • 24/24 duyên, thứ tự khớp Paccayuddesa
  • nguồn canonical: 24/24
  • liên kết 12 chi: 52 cặp duyên–chi
```

### Ghi chú về `main`

Nhánh này rẽ từ `43b48ed` (tag `0.4.3`). `origin/main` đang hơn 1 commit (`f3228e1`, PR #5)
và **không trùng file nào** với thay đổi ở đây (`git diff --name-only 43b48ed origin/main`
so với `git diff --name-only 43b48ed HEAD` → giao rỗng), nên PR về `main` dự kiến không xung đột.

`flutter analyze` / `flutter test` **không chạy được ở sandbox này** vì host tải
Flutter SDK (`storage.googleapis.com`) bị chặn — cần chạy lại trên máy có SDK:

```
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # không bắt buộc: model mới không dùng codegen
flutter analyze
flutter test test/paccaya_data_test.dart
```
