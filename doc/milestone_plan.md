
# VDP PROJECT — MILESTONE PLAN & AI TASK MANAGEMENT

---

## PHẦN 1: MILESTONE PLAN

---

### MILESTONE 0: ĐÃ HOÀN THÀNH ✅
**Tên:** Foundation & Data  
**Trạng thái:** Done

| Hạng mục | Trạng thái |
|----------|-----------|
| Flutter project setup | ✅ |
| Models (Freezed + JSON) | ✅ |
| Repository + Validator | ✅ |
| Splash + Onboarding | ✅ |
| Home + Bottom Nav | ✅ |
| MatrixScreen cơ bản | ✅ |
| StudyScreen + ModuleDetail | ✅ |
| QuizScreen | ✅ |
| SettingsScreen | ✅ |
| Progress local | ✅ |
| Data 121 Tâm + 52 Tâm Sở | ✅ |
| displayIndex cho Matrix | ✅ |
| Warning dismiss | ✅ |

---

### MILESTONE 5: DATA INTEGRATION (M5) ✅
**Tên:** Tích hợp Dữ liệu M5 (Rupa, Kamma, Paticca, Vithi)  
**Trạng thái:** Done

| Task ID | Tên task | Mô tả | Status |
|---------|----------|-------|--------|
| DATA-04 | Tích hợp M5 | Tích hợp 4 models mới vào VdpRepository | ✅ DONE |

---

### MILESTONE 1: STABILIZE
**Mục tiêu:** App chạy ổn định, không còn lỗi layout / overflow / crash  
**Thời gian dự kiến:** 1-2 ngày  
**Ưu tiên:** CAO

| Task ID | Tên task | Mô tả |
|---------|----------|-------|
| M1-T1 | Sửa overflow pixel | Hết hoàn toàn lỗi 0.5px / 1.5px ở Matrix cả portrait và landscape |
| M1-T2 | Kiểm tra data consistency | Xác nhận 121 Tâm + 52 Tâm Sở load đúng, validator pass sạch, không còn warning |
| M1-T3 | Fix ID mismatch | Kiểm tra cetasika ID trong cittas.json khớp với cetasikas.json (ví dụ CS_JIVITA vs CS_JIVITINDRIYA) |
| M1-T4 | Xóa debug log | Dọn các debugPrint tạm trước khi release |
| M1-T5 | flutter_tts fix hoặc remove | Sửa lỗi cache flutter_tts hoặc tạm bỏ khỏi pubspec nếu chưa dùng |

---

### MILESTONE 2: UX POLISH
**Mục tiêu:** Trải nghiệm người dùng mượt mà, dễ hiểu  
**Thời gian dự kiến:** 3-5 ngày  
**Ưu tiên:** CAO

| Task ID | Tên task | Mô tả |
|---------|----------|-------|
| M2-T1 | Landscape Matrix tối ưu | Giảm cellSize, headerWidth khi ngang. Ẩn legend/filter nếu cần. Full-screen matrix mode |
| M2-T2 | Unlock All Modules | Thêm toggle trong Settings với dialog xác nhận. Áp dụng vào StudyScreen |
| M2-T3 | Warning banner persist | Khi user dismiss warning, ghi nhớ bằng SharedPreferences. Không hiện lại mỗi lần mở app |
| M2-T4 | Matrix search | Thêm ô tìm kiếm Tâm / Tâm Sở ngay trên Matrix. Highlight kết quả |
| M2-T5 | Scroll-to-top button | Khi cuộn xa xuống trong Matrix, hiện FAB quay về đầu |
| M2-T6 | Detail sheet polish | Cải thiện UI bottom sheet chi tiết Tâm / Tâm Sở cho đẹp hơn |

---

### MILESTONE 3: STUDY & QUIZ ENHANCE
**Mục tiêu:** Nội dung học tập phong phú, quiz hoàn thiện  
**Thời gian dự kiến:** 3-5 ngày  
**Ưu tiên:** TRUNG BÌNH

| Task ID | Tên task | Mô tả |
|---------|----------|-------|
| M3-T1 | Module content từ data | Mỗi module tự lấy đúng cittas + cetasikas từ JSON thay vì hardcode |
| M3-T2 | Quiz nâng cao | Thêm câu hỏi dạng: kéo thả association, ghép cặp Tâm-Tâm Sở |
| M3-T3 | Spaced repetition | Nhắc nhở ôn bài theo khoảng thời gian |
| M3-T4 | Progress chi tiết | Hiển thị % từng module rõ hơn. Biểu đồ tiến độ |
| M3-T5 | Bookmark / Ghi chú | Cho phép user đánh dấu Tâm / Tâm Sở quan trọng |

---

### MILESTONE 4: AUDIO & ACCESSIBILITY
**Mục tiêu:** Hỗ trợ phát âm Pali, screen reader, high contrast hoàn chỉnh  
**Thời gian dự kiến:** 3-5 ngày  
**Ưu tiên:** TRUNG BÌNH

| Task ID | Tên task | Mô tả |
|---------|----------|-------|
| M4-T1 | Phát âm Pali | Tích hợp audio file hoặc TTS cho tên Pali của Tâm / Tâm Sở |
| M4-T2 | High contrast hoàn chỉnh | Kiểm tra toàn bộ app trong chế độ high contrast |
| M4-T3 | Screen reader test | Test với TalkBack (Android) và VoiceOver (iOS). Sửa semantics |
| M4-T4 | Text scale test | Kiểm tra app ở scale 80% đến 150% |

---

### MILESTONE 5: ADVANCED FEATURES
**Mục tiêu:** Các tính năng nâng cao theo Blueprint ban đầu  
**Thời gian dự kiến:** 5-10 ngày  
**Ưu tiên:** THẤP (phase sau)

| Task ID | Tên task | Mô tả |
|---------|----------|-------|
| M5-T1 | Flowchart Nhân Duyên | Trực quan hóa 12 Nhân Duyên |
| M5-T2 | Kamma Trace | Liên kết N-M giữa Tâm và Nghiệp |
| M5-T3 | Lộ trình Tâm 17 sát-na | Animation lộ trình nhận thức |
| M5-T4 | Sắc Pháp module | 28 loại Sắc |
| M5-T5 | Export / Share | Chia sẻ tiến độ hoặc biểu đồ |

---

### MILESTONE 6: RELEASE
**Mục tiêu:** Phát hành lên Google Play / App Store  
**Thời gian dự kiến:** 2-3 ngày  
**Ưu tiên:** SAU KHI M1-M3 XONG

| Task ID | Tên task | Mô tả |
|---------|----------|-------|
| M6-T1 | App icon + splash chính thức | Thiết kế icon chuẩn |
| M6-T2 | Build release APK/AAB | Ký và build bản release |
| M6-T3 | Store listing | Mô tả app, screenshot, metadata |
| M6-T4 | Testing trên nhiều thiết bị | Ít nhất 3 kích thước màn hình |

---

## PHẦN 2: TỔNG QUAN TIMELINE

```
Tuần 1:  M1 (Stabilize)
Tuần 2:  M2 (UX Polish)
Tuần 3:  M3 (Study & Quiz)
Tuần 4:  M4 (Audio & Accessibility)
Tuần 5+: M5 (Advanced) + M6 (Release)
```

---

## PHẦN 3: AI TASK PROMPTS

Dưới đây là **prompt chuẩn cho từng task**, kèm **danh sách file cần đính kèm** để AI có đủ ngữ cảnh.

---

### TASK M1-T1: Sửa overflow pixel

**File đính kèm:**
- `lib/features/matrix/matrix_screen.dart`
- `lib/shared/widgets/citta_row_header.dart`
- `lib/shared/widgets/cetasika_header.dart`
- `lib/shared/widgets/association_cell.dart`

**Prompt:**
```text
# TASK: Sửa lỗi overflow pixel trong Matrix Screen

## Bối cảnh
App Flutter "Vi Diệu Pháp" có tab Ma Trận hiển thị 121 hàng × 52 cột.
Đang bị overflow 0.5px đến 1.5px ở một số hàng, đặc biệt khi xoay ngang.

## File đính kèm
[đính kèm 4 file trên]

## Yêu cầu
1. Tìm tất cả chỗ có thể gây overflow sub-pixel
2. Sửa bằng cách:
   - floor chiều cao
   - clamp giá trị
   - giảm padding nếu cần
   - KHÔNG thay đổi logic dữ liệu
3. Đảm bảo hoạt động cả portrait và landscape
4. Kiểm tra khi cellSize = 44 (portrait) và 38 (landscape)
5. Trả về file đã sửa hoàn chỉnh, có comment giải thích chỗ sửa

## Không được
- Xóa displayIndex
- Đổi cấu trúc scroll controller
- Sửa file dữ liệu JSON
```

---

### TASK M1-T2: Kiểm tra data consistency

**File đính kèm:**
- `assets/data/cittas.json` (hoặc file tương đương)
- `assets/data/cetasikas.json`
- `lib/core/validators/data_validator.dart`

**Prompt:**
```text
# TASK: Kiểm tra tính nhất quán dữ liệu VDP

## Bối cảnh
App Vi Diệu Pháp dùng 2 file JSON chứa 121 Tâm và 52 Tâm Sở.
Cần kiểm tra dữ liệu trước khi release.

## File đính kèm
[đính kèm 3 file trên]

## Yêu cầu kiểm tra
1. cittas.json có đúng 121 phần tử không?
2. cetasikas.json có đúng 52 phần tử không?
3. Mỗi Tâm có đủ 52 cetasikaAssociations không?
4. Tất cả cetasikaId trong associations có khớp với id trong cetasikas.json không?
   - Ví dụ: CS_JIVITA vs CS_JIVITINDRIYA — nếu không khớp thì liệt kê
5. orderIndex trong cittas có bị trùng không?
6. traditionalOrder trong cetasikas có bị trùng không?
7. Tất cả association type=sometimes có note không? Liệt kê chỗ thiếu.
8. Tâm Bất Thiện có Tâm Sở Tịnh Hảo nào type=always không? (vi phạm rule)
9. Tâm Siêu Thế có vatthurSaca không? (vi phạm rule)

## Output
- Bảng tóm tắt: PASS / FAIL cho từng mục
- Danh sách chi tiết lỗi nếu có
- Gợi ý sửa cho từng lỗi
- KHÔNG tự sửa file, chỉ báo cáo
```

---

### TASK M1-T3: Fix ID mismatch

**File đính kèm:**
- `assets/data/cittas.json`
- `assets/data/cetasikas.json`

**Prompt:**
```text
# TASK: Sửa ID không khớp giữa cittas và cetasikas

## Bối cảnh
Có khả năng các cetasikaId trong cittas.json dùng tên khác
với id trong cetasikas.json.
Ví dụ: cittas dùng "CS_JIVITINDRIYA" nhưng cetasikas dùng "CS_JIVITA".

## File đính kèm
[đính kèm 2 file trên]

## Yêu cầu
1. Trích xuất tất cả cetasikaId duy nhất từ cittas.json
2. Trích xuất tất cả id duy nhất từ cetasikas.json
3. So sánh 2 danh sách
4. Liệt kê các ID:
   - có trong cittas nhưng KHÔNG có trong cetasikas
   - có trong cetasikas nhưng KHÔNG được tham chiếu trong cittas nào
5. Đề xuất mapping sửa (ví dụ: CS_JIVITINDRIYA → CS_JIVITA)
6. Hỏi tôi xác nhận trước khi sửa

## Output
- Bảng so sánh ID
- Danh sách mismatch
- Đề xuất sửa
```

---

### TASK M2-T1: Landscape Matrix tối ưu

**File đính kèm:**
- `lib/features/matrix/matrix_screen.dart`
- `lib/shared/widgets/citta_row_header.dart`
- `lib/shared/widgets/cetasika_header.dart`
- `lib/shared/widgets/association_cell.dart`

**Prompt:**
```text
# TASK: Tối ưu Matrix Screen cho chế độ ngang (Landscape)

## Bối cảnh
App Vi Diệu Pháp có Ma Trận 121 Tâm × 52 Tâm Sở.
Khi xoay ngang, nội dung vẫn chật, chưa tận dụng không gian.

## File đính kèm
[đính kèm 4 file trên]

## Hiện tại khi landscape
- cellSize giảm từ 44 → 38
- headerWidth giảm từ 200 → 160
- cetasikaHeaderHeight giảm từ 110 → 80
- Nhưng vẫn chưa đủ thoáng

## Yêu cầu
1. Khi landscape, tự động:
   - ẩn legend bar (chỉ hiện qua nút info)
   - ẩn bhumi filter (chuyển vào menu popup)
   - giảm thêm header nếu cần
2. Thêm option "Compact Mode" cho matrix:
   - cellSize = 32
   - headerWidth = 140
   - font nhỏ hơn
3. Giữ displayIndex hoạt động đúng
4. KHÔNG sửa logic scroll sync
5. Trả về file hoàn chỉnh

## Gợi ý UX
- Khi landscape + compact: người dùng thấy được ~15 cột × ~8 hàng cùng lúc
- Nên có tooltip khi hover/tap ô nhỏ
```

---

### TASK M2-T2: Unlock All Modules

**File đính kèm:**
- `lib/features/settings/settings_screen.dart`
- `lib/features/study/study_screen.dart`
- `lib/data/models/study_module.dart`
- `lib/shared/providers/progress_provider.dart`

**Prompt:**
```text
# TASK: Thêm tính năng "Mở khóa tất cả bài học"

## Bối cảnh
App Vi Diệu Pháp có 10 module học theo lộ trình tuần tự.
Mỗi module có prerequisite — phải hoàn thành module trước mới mở tiếp.
Một số người dùng đã có nền tảng muốn truy cập trực tiếp module bất kỳ.

## File đính kèm
[đính kèm 4 file trên]

## Yêu cầu
1. Trong SettingsScreen, thêm SwitchListTile "Mở khóa tất cả bài học"
2. Khi bật, hiện dialog xác nhận với nội dung:
   - giải thích lộ trình tuần tự có lợi
   - phù hợp cho ai đã có nền tảng
   - có thể quay lại chế độ tuần tự
   - nút "Giữ tuần tự" và "Mở khóa"
3. Khi unlockAll = true, StudyScreen bỏ qua prerequisite check
4. Thêm field unlockAllModules vào AppSettings
5. Persist setting qua SharedPreferences
6. Khi tắt lại, quay về logic prerequisite bình thường
7. Hiện banner nhỏ dưới switch khi đang bật, nhắc nhẹ về lộ trình

## Tone
- Tôn trọng, không phán xét
- Phong cách Phật giáo: nhẹ nhàng, khuyến khích
```

---

### TASK M2-T3: Warning banner persist

**File đính kèm:**
- `lib/features/matrix/matrix_screen.dart`
- `lib/features/settings/settings_screen.dart`

**Prompt:**
```text
# TASK: Persist trạng thái dismiss warning banner

## Bối cảnh
MatrixScreen có banner cảnh báo dữ liệu.
Hiện khi user bấm X để đóng, nó chỉ ẩn trong phiên hiện tại.
Mở lại app thì banner hiện lại.

## File đính kèm
[đính kèm 2 file trên]

## Yêu cầu
1. Khi user bấm X đóng warning:
   - lưu vào SharedPreferences key "vdp_warning_dismissed"
2. Khi app mở lại:
   - đọc key đó
   - nếu đã dismiss thì không hiện banner
3. Trong Settings, thêm option "Hiện lại cảnh báo dữ liệu"
   - cho phép reset trạng thái dismiss
4. Nếu dữ liệu thay đổi (version mới), tự động reset dismiss

## Không được
- Xóa logic validator
- Ẩn warning khi data thực sự có hard error
```

---

### TASK M3-T1: Module content từ data

**File đính kèm:**
- `lib/features/study/study_screen.dart`
- `lib/features/study/module_detail_screen.dart`
- `lib/data/models/study_module.dart`
- `lib/data/repositories/vdp_repository.dart`
- `assets/data/cittas.json` (mẫu 5-10 entries đầu)
- `assets/data/cetasikas.json` (mẫu 5-10 entries đầu)

**Prompt:**
```text
# TASK: Liên kết module học với dữ liệu thật

## Bối cảnh
App có 10 module học được định nghĩa trong kStudyModules (study_module.dart).
Mỗi module có danh sách cittaIds và cetasikaIds.
ModuleDetailScreen cần hiển thị đúng các Tâm / Tâm Sở thuộc module đó.

## File đính kèm
[đính kèm 6 file trên]

## Yêu cầu
1. Kiểm tra cittaIds và cetasikaIds trong kStudyModules
   có khớp với id thật trong JSON không
2. Nếu không khớp, đề xuất sửa kStudyModules
3. ModuleDetailScreen tab "Học" phải hiển thị đúng nội dung
4. Tab "Ôn Tập" (Blur/Reveal) phải tạo câu hỏi từ data thật
5. Tab "Kiểm Tra" phải link đúng sang QuizScreen

## Không được
- Sửa file JSON data
- Thay đổi cấu trúc model
```

---

### TASK M4-T1: Phát âm Pali

**File đính kèm:**
- `lib/features/detail/citta_detail_sheet.dart`
- `lib/features/detail/cetasika_detail_sheet.dart`
- `pubspec.yaml`
- `assets/data/cetasikas.json` (mẫu 5 entries có ipaTranscription)

**Prompt:**
```text
# TASK: Tích hợp phát âm Pali cho Tâm và Tâm Sở

## Bối cảnh
App Vi Diệu Pháp có tên Pali cho mỗi Tâm / Tâm Sở.
Một số có ipaTranscription.
Cần cho phép user nghe phát âm khi nhấn giữ tên Pali.

## File đính kèm
[đính kèm 4 file trên]

## Yêu cầu
1. Dùng package flutter_tts hoặc just_audio
2. Khi user long-press tên Pali trong detail sheet:
   - nếu có audio file → phát audio
   - nếu không có audio → dùng TTS với ngôn ngữ Pali gần nhất
3. Hiện icon speaker nhỏ bên cạnh tên Pali
4. Xử lý trường hợp TTS không khả dụng (hiện toast)
5. KHÔNG bắt buộc — nếu flutter_tts lỗi thì graceful fallback

## Lưu ý
- flutter_tts hiện có thể bị lỗi cache
- nếu lỗi, đề xuất alternative hoặc tạm disable
```

---

## PHẦN 4: QUY TRÌNH GIAO VIỆC CHO AI

### Bước 1: Chọn task từ Milestone Plan
Ví dụ: **M1-T3** (Fix ID mismatch)

### Bước 2: Copy prompt tương ứng

### Bước 3: Đính kèm đúng file được liệt kê

### Bước 4: Gửi cho AI

### Bước 5: Khi AI trả kết quả
- Kiểm tra output có đúng yêu cầu không
- Chạy `flutter analyze`
- Chạy app kiểm tra thực tế
- Nếu lỗi, gửi lại lỗi cho AI kèm log

### Bước 6: Merge kết quả vào dự án

### Bước 7: Cập nhật trạng thái task

---

## PHẦN 5: BẢNG THEO DÕI TRẠNG THÁI

```text
| Task ID | Tên | Status | AI | Ghi chú |
|---------|-----|--------|-----|---------|
| M1-T1 | Overflow pixel | TODO | Còn cần rà landscape |
| M1-T2 | Data consistency | DONE | 121 cittas / 52 cetasikas, associations đủ, traditionalOrder đã chuẩn hóa |
| M1-T3 | ID mismatch | DONE | PASS |
| M1-T4 | Xóa debug log | TODO | Sau khi ổn định hoàn toàn |
| M1-T5 | flutter_tts | TODO | Chưa xử lý dứt điểm |
| UX-NAME-01 | Rename Matrix → Bảng Tương Ưng | DONE | Áp dụng toàn app |
| M2-T1 | Landscape | DONE | | |
| M2-T2 | Unlock modules | DONE | | |
| M2-T3 | Warning persist | TODO | | |
| M2-T4 | Matrix search | TODO | | |
| M2-T5 | Scroll-to-top | TODO | | |
| M2-T6 | Detail polish | TODO | | |
| M3-T1 | Module content | TODO | | |
| M3-T2 | Quiz nâng cao | TODO | | |
| M3-T3 | Spaced repetition | TODO | | |
| M3-T4 | Progress detail | TODO | | |
| M3-T5 | Bookmark | TODO | | |
| M4-T1 | Audio Pali | TODO | | |
| M4-T2 | High contrast | TODO | | |
| M4-T3 | Screen reader | TODO | | |
| M4-T4 | Text scale test | TODO | | |
| M5-T1 | Nhân Duyên | LATER | | |
| M5-T2 | Kamma Trace | LATER | | |
| M5-T3 | Lộ trình 17 | LATER | | |
| M5-T4 | Sắc Pháp | LATER | | |
| M5-T5 | Export/Share | LATER | | |
| M6-T1 | App icon | LATER | | |
| M6-T2 | Release build | LATER | | |
| M6-T3 | Store listing | LATER | | |
| M6-T4 | Device testing | LATER | | |
```

---

## PHẦN 6: LƯU Ý QUẢN LÝ

### Khi giao task cho AI:
1. **Luôn đính kèm đúng file** — AI không nhìn toàn bộ project
2. **Mỗi lần chỉ giao 1 task** — tránh AI làm quá nhiều rồi sai
3. **Yêu cầu trả file hoàn chỉnh** — không chỉ đoạn code rời
4. **Chạy `flutter analyze` sau mỗi lần nhận code** — bắt lỗi sớm
5. **Không bấm `R` khi đổi asset** — phải restart hoàn toàn

### Khi AI trả kết quả sai:
1. Copy **đúng dòng lỗi** từ console
2. Gửi lại kèm **file hiện tại** (không phải file cũ)
3. Nói rõ: "File này là bản mới nhất, lỗi ở dòng X"

### Khi chuyển sang AI khác:
1. Gửi **Handoff** (mục 18 trong bản handoff trước)
2. Gửi **Milestone Plan** (tài liệu này)
3. Gửi **file liên quan** của task đang làm
4. Nói rõ task nào đang dở, task nào đã xong

---

Bạn muốn bắt đầu giao task nào trước? Mình có thể giúp bạn:
- **Chọn task ưu tiên**
- **Chuẩn bị prompt + file đính kèm**
- **Review kết quả AI trả về**
