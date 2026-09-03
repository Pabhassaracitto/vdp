📋 PROMPT CHO ROO CLINE — M2-T5: Scroll-to-top Button
text

# TASK M2-T5: Thêm nút Scroll-to-top vào Bảng Tương Ưng

## Vai trò
Bạn là Flutter developer cho dự án Vi Diệu Pháp (VDP).
Dự án dùng: Flutter + Riverpod + Freezed models.
Nguyên tắc bất biến: Offline-First, Accuracy-First, Accessibility-First.

## File được cung cấp
- lib/features/matrix/matrix_screen.dart   [FILE CHÍNH - sẽ sửa]

## Bối cảnh hiện tại
MatrixScreen đang có:
- `_verticalController1`: điều khiển ListView tên Tâm (cột trái)
- `_verticalController2`: điều khiển ListView ô matrix (phần phải)
- Hai controller được sync với nhau qua `_syncScroll1()` / `_syncScroll2()`
- `_horizontalController`: điều khiển scroll ngang
- Tính năng search vừa thêm (M2-T4): debounce, highlight, auto-scroll

## Yêu cầu tính năng

### 1. Logic hiển thị FAB
- FAB chỉ xuất hiện khi `_verticalController1.offset > 300.0`
- Khi scroll trở về đầu (offset <= 300): FAB tự ẩn
- Dùng `AnimatedOpacity` để transition mượt (duration: 200ms)
- FAB KHÔNG hiển thị khi đang ở đầu danh sách

### 2. Hành vi khi nhấn FAB
```dart
void _scrollToTop() {
  _verticalController1.animateTo(
    0,
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  );
  // _verticalController2 tự sync theo qua listener đã có
  // KHÔNG gọi animateTo trên _verticalController2 trực tiếp
}
3. Giao diện FAB
dart

FloatingActionButton.small(
  onPressed: _scrollToTop,
  tooltip: 'Về đầu danh sách',
  backgroundColor: VdpColors.primary,
  child: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
)
4. Vị trí FAB
Dùng Scaffold's floatingActionButton parameter
floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
Bọc trong AnimatedOpacity:
dart

floatingActionButton: AnimatedOpacity(
  opacity: _showScrollToTop ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 200),
  child: IgnorePointer(
    ignoring: !_showScrollToTop,
    // Quan trọng: khi ẩn phải ignore pointer
    // tránh user tap vô tình vào FAB invisible
    child: FloatingActionButton.small(...),
  ),
),
5. State tracking
Thêm vào _MatrixScreenState:

dart

bool _showScrollToTop = false;
Thêm vào initState() sau các listener hiện có:

dart

_verticalController1.addListener(_updateScrollToTopVisibility);
Thêm method mới:

dart

void _updateScrollToTopVisibility() {
  final shouldShow = _verticalController1.hasClients &&
      _verticalController1.offset > 300.0;
  if (shouldShow != _showScrollToTop) {
    setState(() => _showScrollToTop = shouldShow);
  }
}
Thêm vào dispose() TRƯỚC khi dispose controller:

dart

_verticalController1.removeListener(_updateScrollToTopVisibility);
6. Landscape behavior
FAB vẫn hiển thị khi landscape
Threshold giữ nguyên 300.0 (không đổi)
Size .small đã đủ gọn cho landscape
7. Accessibility
tooltip: 'Về đầu danh sách' — TalkBack đọc được
Khi _showScrollToTop == false: IgnorePointer(ignoring: true)
để screen reader không focus vào FAB ẩn
Ràng buộc KHÔNG được vi phạm
KHÔNG sửa _syncScroll1(), _syncScroll2()
KHÔNG gọi animateTo trực tiếp trên _verticalController2
— để sync listener tự xử lý
KHÔNG xóa hoặc sửa search logic từ M2-T4
KHÔNG thêm ScrollController mới
KHÔNG sửa file nào khác ngoài matrix_screen.dart
flutter analyze phải đạt 0 errors
Output yêu cầu
Trả về 1 file duy nhất hoàn chỉnh:

text

lib/features/matrix/matrix_screen.dart
Comment // M2-T5: [mô tả] tại mỗi đoạn code mới.

Checklist tự kiểm tra trước khi trả
 _showScrollToTop được khai báo trong State
 _updateScrollToTopVisibility() được thêm
 Listener được add trong initState()
 Listener được remove trong dispose() trước khi dispose controller
 Scaffold có floatingActionButton parameter
 FAB bọc trong AnimatedOpacity + IgnorePointer
 _scrollToTop() chỉ gọi _verticalController1.animateTo
 Code M2-T4 (search) còn nguyên vẹn
 0 compile errors
text


---

## 📁 File cần đính kèm

Chỉ cần **1 file**:

| File | Ghi chú |
|------|---------|
| `lib/features/matrix/matrix_screen.dart` | **Bản mới nhất sau M2-T4** |

> ⚠️ Quan trọng: Gửi đúng bản đã có search (M2-T4), không phải bản cũ trước đó.

---

## ⏭️ Sau M2-T5

Khi bạn báo cáo hoàn thành, tôi sẽ:

1. Update handoff → tiến độ M2: **5/6 tasks**
2. Đánh giá M2-T6 (Detail sheet polish) — task cuối của M2
3. Nếu M2-T6 xong → **tag v0.2.0**, chuyển sang M3