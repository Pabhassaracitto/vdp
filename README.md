# ☸ Vi Diệu Pháp (VDP) — Flutter App

> **"Ứng dụng VDP không phải là từ điển số hóa. Đây là không gian để người học THẤY bằng mắt, HIỂU bằng tim, và TỰ MÌNH khám phá cấu trúc của Tâm — đúng như cách giảng sư King Milanda A đã dạy."**

---

## 🏗️ Kiến Trúc Tổng Quan

```
vdp_app/
├── lib/
│   ├── main.dart                    # Entry point
│   ├── core/
│   │   ├── theme/vdp_theme.dart     # Design system + Dual Encoding colors
│   │   └── validators/data_validator.dart  # Content Governance Layer 2
│   ├── data/
│   │   ├── models/
│   │   │   ├── citta_model.dart     # 121 Tâm
│   │   │   ├── cetasika_model.dart  # 52 Tâm Sở
│   │   │   └── study_module.dart    # Study Graph + UserProgress
│   │   └── repositories/
│   │       └── vdp_repository.dart  # Offline-First data + Conflict detection
│   ├── features/
│   │   ├── onboarding/              # 3-slide onboarding
│   │   ├── home/                    # Bottom nav shell
│   │   ├── matrix/                  # Ma Trận 121×52 (Pha 1)
│   │   ├── detail/                  # Citta & Cetasika bottom sheets
│   │   ├── study/                   # Study Engine + Blur/Reveal (Pha 1-2)
│   │   ├── quiz/                    # Quiz 3 cấp (Pha 3)
│   │   └── settings/               # Accessibility settings
│   └── shared/
│       ├── widgets/
│       │   ├── association_cell.dart  # Dual Encoding cell
│       │   ├── citta_row_header.dart
│       │   └── cetasika_header.dart
│       └── providers/
│           └── progress_provider.dart # SharedPreferences persistence
└── assets/
    └── data/
        ├── cittas_sample.json        # Dữ liệu Tâm (mẫu 5/121)
        └── cetasikas.json            # Dữ liệu 28/52 Tâm Sở
```

---

## 🛡️ Content Governance (2 Lớp Bảo Vệ)

### Lớp 1 — Editorial Workflow (Con người)
```
Soạn dữ liệu → Peer Review → Senior Approval → Merge vào bundle
```

### Lớp 2 — Continuous Data Integrity (Kỹ thuật)
`lib/core/validators/data_validator.dart`

| Rule | Loại | Hành động |
|------|------|-----------|
| Tâm Siêu Thế ≠ Tạo sắc | **Hard** | Từ chối load |
| Nghiệp Dục giới ≠ Tạo Tâm Quả Sắc/Vô Sắc | **Hard** | Từ chối load |
| Tâm Sở Tịnh Hảo ≠ Phối hợp Tâm Bất Thiện | **Hard** | Từ chối load |
| Tâm Sở Bất Định trong Tâm Sân thiếu note | **Soft** | Warning + cho load |
| Tổng số Tâm ≠ 121 | **Soft** | Warning + cho load |

---

## ✦ Hệ Thống Dual Encoding (WCAG 2.1 AA)

| Trạng thái | Màu | Hình | Label |
|-----------|-----|------|-------|
| `always` | 🔆 Vàng sáng | ✦ Solid | "Cố định" |
| `sometimes` | 💛 Vàng nhạt | ◎ Dashed | "Bất định" |
| `never` | ⬛ Xám mờ | ✕ | "Không có" |

---

## 🚀 Cài Đặt & Chạy

### Yêu cầu
- Flutter SDK ≥ 3.2.0
- Dart ≥ 3.2.0

### Bước 1: Clone & Install
```bash
git clone <repo>
cd vdp_app
flutter pub get
```

### Bước 2: Tạo file generated (Freezed + Riverpod)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Bước 3: Chạy
```bash
flutter run
```

---

## 📦 Dependencies Chính

| Package | Mục đích |
|---------|---------|
| `flutter_riverpod` | State management |
| `freezed` | Immutable data models |
| `shared_preferences` | Offline progress storage |
| `flutter_animate` | Animations |
| `just_audio` | Pali pronunciation |
| `go_router` | Navigation |
| `flutter_tts` | Screen reader support |

---

## 🗺️ Lộ Trình Phát Triển

### ✅ Pha 1 — Foundation (Hoàn thành trong blueprint này)
- [x] Matrix Layer (121 Tâm × 52 Tâm Sở)
- [x] Dual Encoding (Màu + Hình + Text)
- [x] Content Governance (2 lớp)
- [x] Accessibility Base (Semantics, Min touch 48dp, High Contrast)
- [x] Data Validation (Hard + Soft rules)
- [x] Study Engine cơ bản
- [x] Blur/Reveal Active Recall
- [x] Quiz 3 cấp

### 🔜 Pha 2 — Causality
- [ ] Flow Layer (12 Nhân Duyên / 16 Nghiệp — Flowchart tương tác)
- [ ] Kamma Trace N-M (Matrix Tâm ↔ Flow Nghiệp)
- [ ] Proactive Conflict Guard 4 tầng
- [ ] Progress tracking nâng cao

### 🔜 Pha 3 — Mastery
- [ ] Lộ trình 17 sát-na (Vīthicitta)
- [ ] Pali Pronunciation (IPA + Audio)
- [ ] Smart Hints (Dwell > 3s hoặc error > 2 lần)
- [ ] Virtual Teacher (Optional, có thể tắt)

---

## 📐 Ba Nguyên Tắc Bất Biến

1. **Offline-First**: Hoạt động 100% không cần internet. Data bundle trong app.
2. **Accuracy-First**: Không bao giờ hiển thị dữ liệu sai giáo lý. Validation trước load.
3. **Accessibility-First**: Mọi người học đều được phục vụ, không phân biệt khả năng thể chất.

---

## 📊 Dữ Liệu Hiện Có (Mẫu)

| Loại | Số lượng hiện có | Mục tiêu |
|------|-----------------|---------|
| Tâm (Citta) | 5 | 121 |
| Tâm Sở (Cetasika) | 28 | 52 |
| Conflict Rules | 8 | Đầy đủ |
| Study Modules | 10 (định nghĩa) | 10 |

> ⚠️ Dữ liệu hiện tại là mẫu để demo. Cần bổ sung đầy đủ 121 Tâm và 52 Tâm Sở theo quy trình Editorial Workflow.

---

*Phát triển theo giáo trình King Milanda A — Abhidhamma Piṭaka*
