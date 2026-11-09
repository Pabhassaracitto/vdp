# ☸ VDP — Ứng dụng học Vi Diệu Pháp

VDP là ứng dụng Flutter học Abhidhamma tương tác theo giáo trình King Milanda A. Ứng dụng kết hợp bảng Tâm–Tâm Sở, bài học, ôn tập và các mô hình Nhân Duyên, Lộ Trình Tâm. Phiên bản khai báo hiện tại là **0.10.2+7** trong [`pubspec.yaml`](pubspec.yaml) (hiển thị trong ứng dụng là 0.10.2).

## Chức năng hiện có

Ứng dụng có năm tab chính:

- **Bảng Tương Ưng**: khám phá quan hệ giữa 121 Tâm và 52 Tâm Sở; xem chi tiết và nghe nội dung. Các trạng thái phối hợp được phân biệt bằng cả hình thức và màu sắc.
- **Học**: 17 mô-đun bài học, thẻ ôn tập, câu hỏi, tiến độ, đánh dấu và ghi chú. Tiến độ được lưu cục bộ bằng `shared_preferences`.
- **Nhân Duyên**: danh sách 12 chi Duyên khởi và 24 Duyên Hệ, bộ lọc, chi tiết và chức năng nghe. Đây là các danh sách tương tác, không phải sơ đồ luồng Nghiệp hoàn chỉnh.
- **Lộ Trình Tâm**: chọn và trình diễn từng sát-na của các lộ, bao gồm lộ ngũ môn 17 sát-na, với điều khiển bước và tự động phát.
- **Cài đặt**: ngôn ngữ giao diện và nội dung, khả năng tiếp cận, tiến độ và thiết lập nghe.

Chức năng nghe dùng TTS, có danh sách phát, tốc độ, lặp, tô sáng và thanh nghe nổi. Web dùng giọng của trình duyệt; bản native mặc định dùng TTS hệ thống qua `flutter_tts` (chưa đóng gói model Sherpa). Giọng, chất lượng, khả năng chạy nền và hoạt động offline phụ thuộc thiết bị, hệ điều hành và trình duyệt. Xem [hướng dẫn Web TTS](docs/audio-web-tts.md).

## Dữ liệu và ngôn ngữ

Dữ liệu cấu trúc được đóng gói trong `assets/data/`, nội dung bài học và bản dịch trong `assets/content/`. Số lượng trong repository hiện tại:

| Dữ liệu | Số lượng | Tệp |
|---|---:|---|
| Tâm | 121 | `cittas.json` |
| Tâm Sở | 52 | `cetasikas.json` |
| Sắc pháp | 28 | `rupas.json` |
| Nghiệp | 16 | `kammas.json` |
| Chi Duyên khởi | 12 | `paticca.json` |
| Duyên Hệ | 24 | `paccayas.json` |
| Mô hình Lộ Trình Tâm | 4 | `vithis.json` |
| Mô-đun học | 17 | `lib/data/models/study_module.dart`, `assets/content/` |

- **Giao diện** có 26 locale: `vi`, `en`, `zh`, `zh_TW`, `hi`, `my`, `si`, `ar`, `bn`, `bo`, `de`, `es`, `fr`, `id`, `it`, `ja`, `km`, `ko`, `lo`, `mn`, `mr`, `pt`, `ru`, `ta`, `te`, `th`. Có thể chọn độc lập với ngôn ngữ nội dung; các bản dịch giao diện vẫn cần được kiểm tra hoàn thiện.
- **Nội dung** có 9 lựa chọn: `vi` (nguồn), `en` và bảy bản nháp `hi`, `zh`, `zh_TW`, `si`, `my`, `ja`, `th`. Các bản nháp có thể thiếu bản dịch và cần duyệt giáo lý. Trong catalog tiếng Anh, M15, M16 và M17 cũng được đánh dấu nháp.
- Khi thiếu nội dung ở các bản nháp, ứng dụng có thể dùng tiếng Anh; `zh_TW` có thể dùng `zh` trước. Nội dung không phải tiếng Việt không dùng tiếng Việt làm fallback. Ngôn ngữ mặc định được chọn theo thiết bị, với tiếng Anh làm fallback quốc tế; có thể đổi trong Cài đặt. Xem [`content_languages.dart`](lib/core/localization/content_languages.dart) và [công cụ nội dung](tool/content/README.md).
- Nội dung và font được bundle để hỗ trợ sử dụng cục bộ. Không nên hiểu điều này là bảo đảm mọi chức năng đều offline: ví dụ TTS phụ thuộc engine/giọng sẵn có trên thiết bị.

Tài liệu PDF nguồn nằm ở [`reference/`](reference/); dấu vết nguồn bài học và các khoảng trống được ghi tại [`docs/study-content-sources.md`](docs/study-content-sources.md). Nội dung và bản dịch vẫn cần được con người đối chiếu, duyệt giáo lý; test tự động không chứng minh toàn bộ nội dung là chính xác.

## Cài đặt và chạy

### Yêu cầu

- Flutter SDK kênh stable và toolchain cho nền tảng muốn chạy; kiểm tra bằng `flutter doctor`.
- `pubspec.yaml` khai báo Dart `>=3.2.0 <4.0.0`, nhưng `pubspec.lock` hiện yêu cầu **Dart >=3.11.0 và Flutter >=3.38.4** cho bộ dependency đã khóa. CI dùng Flutter stable. Chạy `flutter pub get` cần truy cập các package registry.
- Repository có thư mục dự án Android, iOS, Web, Windows, Linux và macOS. Việc build/chạy từng nền tảng cần SDK, công cụ và cấu hình tương ứng; sự hiện diện của thư mục không bảo đảm mọi tính năng hoạt động trên mọi nền tảng.

```bash
git clone https://github.com/Pabhassaracitto/vdp.git
cd vdp
flutter doctor
flutter pub get
flutter devices
flutter run                    # hoặc: flutter run -d chrome
```

Các file Dart sinh ra cho model và localization đã có trong repository. Sau khi sửa model Freezed/JSON, có thể tạo lại bằng:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Sau khi sửa ARB, chạy `flutter gen-l10n` theo cấu hình [`l10n.yaml`](l10n.yaml); `flutter: generate: true` cũng được bật trong `pubspec.yaml`. Xem các thay đổi generated trước khi commit.

### Web và phát hành

```bash
flutter build web --release
# Khi triển khai dưới đường dẫn project site /vdp/:
flutter build web --release --base-href /vdp/
```

Workflow [`deploy_web.yml`](.github/workflows/deploy_web.yml) build và triển khai GitHub Pages khi push lên `main` hoặc chạy thủ công. Repo cần được cấu hình **Settings → Pages → Source: GitHub Actions**; URL dự kiến là `https://pabhassaracitto.github.io/vdp/` nếu Pages đã được bật. Các workflow build/release khác nằm trong [`.github/workflows/`](.github/workflows/); điều kiện và artifact khác nhau tùy workflow. Ví dụ build iOS trong `final_build.yml` dùng `--no-codesign`, không phải bản IPA đã ký sẵn để cài đặt.

## Kiểm thử và kiểm tra dữ liệu

```bash
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
python3 tool/check_localizations.py
python3 tool/check_paccaya_data.py
python3 -m unittest tool.test_report_flutter_analyze
```

CI [`pr_analysis.yml`](.github/workflows/pr_analysis.yml) chạy analyzer và Flutter test, báo cáo warnings/infos nhưng verdict dựa trên lỗi analyzer và kết quả test. Kiểm tra localization là công cụ riêng: tại trạng thái repository hiện tại, `check_localizations.py` báo thiếu/sai key và bản dịch rỗng cho nhóm `suggestCorrection` ở nhiều locale; cần xử lý trước khi coi kiểm tra này là đạt.

[`VdpDataValidator`](lib/core/validators/data_validator.dart) kiểm tra một số quy tắc cứng và cảnh báo trên dữ liệu Tâm/Tâm Sở khi khởi tạo. Khi phát hiện lỗi cứng, repository đánh dấu `validationFailed` và giao diện hiện lỗi; cảnh báo mềm không chặn tải. Đây không phải kiểm định toàn diện: validator chỉ chạy khi cả hai danh sách không rỗng, và repository hiện bỏ qua exception phát sinh trong lúc validation. Các kiểm tra riêng gồm [`study_module_coverage_test.dart`](test/study_module_coverage_test.dart) và [`paccaya_data_test.dart`](test/paccaya_data_test.dart).

## Cấu trúc repository

```text
lib/
  main.dart                 Điểm vào ứng dụng
  core/                     Giao diện, localization, navigation, validation
  data/                     Models và repositories tải dữ liệu bundle
  features/                 Matrix, study, quiz, review, paticca, vithi, audio, settings…
  l10n/                     ARB và mã localization sinh ra
  shared/                   Provider tiến độ và widget dùng chung
assets/data/                Dữ liệu cấu trúc giáo lý
assets/content/             Nội dung và bản dịch theo locale
assets/fonts/               Font bundle và Noto subsets
reference/                  Tài liệu PDF nguồn
test/                       Flutter tests
tool/                       Công cụ kiểm tra, nội dung và localization
doc/, docs/                 Thiết kế, kế hoạch, QA và hướng dẫn
```

Các dependency chính gồm Flutter/Riverpod (UI và state), Freezed/JSON Serializable (model), `shared_preferences` (lưu cục bộ), `flutter_tts` và các package audio. Danh sách và phiên bản đầy đủ nằm trong [`pubspec.yaml`](pubspec.yaml) và [`pubspec.lock`](pubspec.lock).

## Tài liệu phát triển

- [Kế hoạch localization nội dung](doc/localization_content_plan.md) và [hướng dẫn công cụ biên dịch nội dung](tool/content/README.md).
- [Nguồn nội dung học](docs/study-content-sources.md) và [hướng dẫn audio Web](docs/audio-web-tts.md).
- [Blueprint](doc/blueprint.md), [kế hoạch milestone](doc/milestone_plan.md) và [chính sách phiên bản](doc/versioning_policy.md) là tài liệu thiết kế/kế hoạch; không mặc định coi mọi mục trong đó đã được triển khai.
