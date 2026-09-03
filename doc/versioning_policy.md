# 📋 VDP VERSIONING & RELEASE POLICY
**Phiên bản:** v1.0
**Ngày tạo:** 2026-06-08
**Áp dụng cho:** Dự án Vi Diệu Pháp (VDP / Abhidhamma Interactive)

---

## 1. HỆ THỐNG VERSION

### Chuẩn: Semantic Versioning (SemVer)
MAJOR.MINOR.PATCH

text


| Thành phần | Tăng khi | Ví dụ |
|-----------|---------|-------|
| **MAJOR** | Public release / thay đổi lớn không tương thích | `v1.0.0` → `v2.0.0` |
| **MINOR** | Hoàn thành Milestone (M) | `v0.1.0` → `v0.2.0` |
| **PATCH** | Hoàn thành Task (T) hoặc fix bug | `v0.2.0` → `v0.2.1` |

### Trong pubspec.yaml

```yaml
version: 0.2.0+15
0.2.0 = version name (hiển thị cho user)
+15 = build number (bắt buộc tăng mỗi lần build release, đặc biệt khi đẩy lên Store)
2. QUY ƯỚC TAG
Tag chính thức (Stable) — Kích hoạt GitHub Actions
Chỉ tạo khi hoàn thành toàn bộ Milestone.

text

v0.1.0    → M1 Stabilize hoàn thành
v0.2.0    → M2 UX Polish hoàn thành
v0.3.0    → M3 Study & Quiz hoàn thành
v0.4.0    → M4 Audio & Accessibility hoàn thành
v0.5.0    → M5 Advanced Features hoàn thành
v1.0.0    → M6 Public Release đầu tiên
Tag thử nghiệm (Pre-release) — KHÔNG kích hoạt GitHub Actions
Tạo khi cần đánh dấu bản review / test nội bộ của Task.

text

v0.2.1-rc.1      → Release Candidate lần 1 cho task trong M2
v0.2.1-rc.2      → Release Candidate lần 2
v0.2.1-beta.1    → Beta test
Không cần tag
Các commit thông thường trong quá trình làm task không bắt buộc phải tag.
Chỉ tag khi:

cần đánh dấu mốc review
cần chia sẻ APK test cho người khác
hoàn thành milestone
3. BẢNG VERSION ÁNH XẠ VỚI MILESTONE
Giai đoạn phát triển (Pre-release)
Milestone	Version Stable	Mô tả
M0 Foundation & Data	v0.0.1	App khung, data sample
M0 Data Full	v0.1.0	121 Tâm + 52 Tâm Sở
M1 Stabilize	v0.1.x	Fix lỗi, ổn định lõi
M2 UX Polish	v0.2.0	Landscape, Unlock, Warning persist
M3 Study & Quiz	v0.3.0	Module content, Quiz nâng cao
M4 Audio & A11y	v0.4.0	Phát âm Pali, Screen reader
M5 Advanced	v0.5.0	Nhân Duyên, Kamma, Sắc Pháp
Giai đoạn phát hành
Milestone	Version	Mô tả
M6 Release	v1.0.0	Public release đầu tiên
Cập nhật sau release	v1.1.0	Thêm tính năng
Sửa lỗi sau release	v1.1.1	Hotfix
Thay đổi lớn	v2.0.0	Restructure / breaking change
4. GITHUB ACTIONS — RELEASE WORKFLOW
Trigger
YAML

on:
  push:
    tags:
      - 'v*'
Chỉ chạy job khi tag là Stable (không chứa -)
YAML

jobs:
  build-release:
    # Chỉ chạy cho stable tags: v0.2.0, v1.0.0
    # Bỏ qua prerelease tags: v0.2.1-rc.1, v0.2.1-beta.1
    if: ${{ !contains(github.ref_name, '-') }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      # ... các step build tiếp theo
Giải thích
Tag	Actions chạy?	Lý do
v0.2.0	✅	Stable milestone release
v1.0.0	✅	Public release
v0.2.1-rc.1	❌	Pre-release, có dấu -
v0.2.1-beta.1	❌	Pre-release, có dấu -
v0.2.1-alpha	❌	Pre-release, có dấu -
5. QUY TRÌNH RELEASE
5.1 Khi hoàn thành Task (T)
Bash

# 1. Stage & commit
git add .
git commit -m "feat(settings): add unlock all modules toggle"

# 2. Push code
git push origin main

# 3. (Tùy chọn) Nếu muốn đánh dấu bản review
git tag -a v0.2.1-rc.1 -m "RC: M2-T3 warning persist"
git push origin v0.2.1-rc.1
# → Actions KHÔNG chạy

# 4. Cập nhật kanban: task → DONE
5.2 Khi hoàn thành Milestone (M)
Bash

# 1. Bump version trong pubspec.yaml
#    Ví dụ: version: 0.2.0+15

# 2. Commit
git add .
git commit -m "release(m2): complete UX polish milestone"

# 3. Tạo tag stable
git tag -a v0.2.0 -m "Milestone M2: UX Polish complete"

# 4. Push code + tag
git push origin main --tags
# → Actions CHẠY

# 5. Cập nhật handoff version
# 6. Cập nhật kanban: milestone → DONE
5.3 Khi public release (M6)
Bash

# 1. Bump version
#    version: 1.0.0+30

# 2. Commit
git add .
git commit -m "release(v1): first public release"

# 3. Tag
git tag -a v1.0.0 -m "VDP v1.0.0 - First public release"

# 4. Push
git push origin main --tags
# → Actions CHẠY → Build APK/AAB → Upload Store
6. QUY ƯỚC COMMIT MESSAGE
Chuẩn: Conventional Commits
text

<type>(<scope>): <mô tả ngắn>
Các type
Type	Dùng khi	Ví dụ
feat	Thêm tính năng	feat(settings): add unlock all modules
fix	Sửa lỗi	fix(matrix): reduce landscape overflow
refactor	Tái cấu trúc code	refactor(repository): split load methods
docs	Cập nhật tài liệu	docs(handoff): update to v2.1
chore	Config, package, CI	chore(pubspec): remove unused flutter_tts
style	Format code, không đổi logic	style(matrix): fix indentation
perf	Tối ưu hiệu năng	perf(matrix): reduce rebuild count
test	Thêm/sửa test	test(validator): add hard rule tests
release	Mốc milestone	release(m2): UX polish complete
data	Thay đổi dữ liệu giáo lý	data(cetasika): add Tu Nghia fields
Scope gợi ý cho VDP
Scope	Khu vực
matrix	Bảng Tương Ưng
study	Học tập, module
quiz	Kiểm tra
settings	Cài đặt
detail	Detail sheet
data	Dữ liệu JSON
model	Freezed models
validator	Content governance
repository	Data loading
progress	User progress
a11y	Accessibility
audio	Phát âm Pali
handoff	Tài liệu bàn giao
ci	GitHub Actions
10 commit message mẫu
Bash

feat(matrix): add compact mode for landscape
fix(matrix): floor body height to prevent sub-pixel overflow
feat(settings): add unlock all modules with confirmation dialog
fix(data): resolve duplicate traditionalOrder in cetasikas
docs(handoff): update project status to v2.1
chore(pubspec): comment out unused flutter_tts dependency
data(cetasika): add Tu Nghia (4 aspects) for all 52 cetasikas
refactor(study): use settings provider for unlock check
release(m2): complete UX polish milestone v0.2.0
perf(matrix): lazy build association cells for better scroll
7. BUILD NUMBER POLICY
Quy tắc
Khi nào	Build number
Commit thường	Không cần tăng
Tag RC/beta	Tăng +1
Tag stable milestone	Tăng +1
Upload Store	Bắt buộc tăng +1 so với bản trước
Ví dụ timeline
text

v0.1.0+1   → M0 data full
v0.1.1+2   → M1-T2 fix
v0.1.2+3   → M1-T3 fix
v0.2.0+4   → M2 stable
v0.2.1-rc.1+5 → test nội bộ
v0.2.1-rc.2+6 → test lần 2
v0.3.0+7   → M3 stable
...
v1.0.0+20  → public release
8. CHECKLIST RELEASE
Cho mỗi Task
 Code đã chạy flutter analyze không lỗi
 Commit message đúng quy ước
 Push code lên main
 (Tùy chọn) Tag -rc nếu cần review
 Cập nhật kanban
Cho mỗi Milestone
 Tất cả task trong milestone đã DONE
 Bump version trong pubspec.yaml
 Bump build number
 Commit với prefix release(mX):
 Tạo tag stable vX.Y.0
 Push tag → Actions chạy
 Kiểm tra Actions pass
 Cập nhật handoff version
 Cập nhật kanban milestone → DONE
Cho Public Release (v1.0.0)
 Tất cả milestone M1-M5 đã DONE (hoặc đủ scope release)
 Test trên ít nhất 3 thiết bị
 App icon chính thức
 Store listing chuẩn bị xong
 Version = 1.0.0+N
 Tag = v1.0.0
 Build APK/AAB signed
 Upload Play Console / App Store Connect
9. SƠ ĐỒ TÓM TẮT
text

Commit (task work)
  │
  ├─ Không cần tag
  │   └─ Push → chỉ lưu code
  │
  ├─ Tag -rc (tùy chọn)
  │   └─ Push tag → Actions BỎ QUA
  │
  └─ Tag stable (khi xong milestone)
      └─ Push tag → Actions CHẠY → Build release
Hết tài liệu versioning_policy.md

text



