# VDP | Audio (tab Bảng Tương Ưng) — góp ý 0.10.3 và cách xử lý

> Nguồn: ghi chú người dùng ngày 2026-10-07 (4 mục, đánh số theo thứ tự góp ý).
> Phạm vi: `lib/features/audio/**`, `lib/features/matrix/**`,
> `lib/features/study/**`, `lib/l10n/**`.

---

## 1. "Người dùng sẽ không biết nhấn giữ Tâm/Tâm Sở để phát âm thanh"

**Vấn đề:** cử chỉ nhấn giữ (long-press) vốn vô hình — không có gì trên màn
hình gợi ý rằng hàng Tâm / cột Tâm Sở nghe được.

**Đã làm:**

| Lớp | Cách xử lý |
|---|---|
| Lần đầu mở tab | Tấm hướng dẫn `_MatrixListenHintCard` hiện phía trên bảng: nói rõ "Nhấn giữ để nghe từ mục này" + thân bài hướng dẫn (chuỗi `matrixListenFromHint` / `matrixListenHelpBody` đã có sẵn), kèm nút **Đã hiểu** và chip **Chế độ nghe** mở thẳng bảng chọn chế độ. |
| Nhớ trạng thái | `matrixListenHintSeenProvider` (`lib/features/matrix/matrix_listen_hint.dart`) đọc/ghi `SharedPreferences` khoá `vdp_matrix_listen_hint_seen`. Trạng thái ba giá trị: `null` = chưa đọc xong (không hiện gì, tránh nháy), `false` = hiện, `true` = thôi. |
| Tự tắt | Người dùng nhấn giữ nghe lần đầu → `markSeen()`; cử chỉ đã được khám phá thì không cần hướng dẫn nữa. |
| Mở lại | Hộp Trợ giúp (ⓘ) luôn có sẵn mục 🔊 "cách nghe" (`matrixListenHelpBody`) và thêm nút mở **Chế độ nghe**; tấm hướng dẫn một lần chỉ là lớp nhắc thêm cho người mới. |
| Ngay khi bắt đầu nghe | SnackBar `🎧 <tên mục>` kèm hành động **đổi nhanh chế độ**: "Chỉ mục này" ⇄ "Tịnh tiến" — người dùng khám phá ra khái niệm chế độ nghe ngay lúc cần. |

Ở landscape tấm hướng dẫn thu về một hàng chữ để không lấy đất của bảng.

---

## 2. "Không có chỗ chọn nghe 1 mục hay tịnh tiến, lặp hay hết là dừng"

**Vấn đề:** trước đây chỉ có `RepeatMode {off, one, all}` — thiếu nửa "phạm vi
phát" (có đi tiếp sang mục sau hay không), và các lựa chọn nằm rải rác.

**Mô hình mới (engine):**

```dart
enum PlayScope { onward, single }          // tịnh tiến | chỉ mục đang chọn
enum AudioPlayMode {                        // mặt tiền 4 lựa chọn cho UI
  singleOnce,     // "Chỉ mục này"      — đọc 1 lượt rồi dừng
  singleLoop,     // "Lặp mục này"      — lặp mãi một mục
  sequenceOnce,   // "Tịnh tiến"        — đọc tiếp, hết danh sách dừng
  sequenceLoop,   // "Lặp cả danh sách" — đọc tiếp và quay vòng
}
```

* `AudioPlayerState.playScope` (mặc định `onward` — giữ nguyên hành vi cũ) và
  getter `playMode` suy ra từ `(repeatMode × playScope)`.
* `setPlayMode(mode)` ghi cả hai nửa và **nhớ vĩnh viễn** (`audio.repeatMode`,
  `audio.playScope`) — cùng chỗ với tốc độ.
* Khi hết mục và `repeatMode == off`: dừng nếu `playScope == single` **hoặc**
  đang ở mục cuối danh sách.
* `playAll()` ("Nghe toàn bộ" / "Tiếp tục nghe") luôn đưa phiên về tịnh tiến —
  nhãn nút và hành vi khớp nhau.
* `ListeningPositionStore` thêm `loadPlayScope()/savePlayScope()` **có
  implementation mặc định** → mọi store giả trong test cũ không phải sửa, và
  bản cài cũ (chưa có khoá) giữ nguyên hành vi tịnh tiến.

**Bề mặt UI (3 cấp, dùng chung một widget `PlayModeSelector`):**

1. **Thanh nghe nổi — cấp 1** giữ nguyên thanh gọn; thêm nút mở **cấp 2**.
2. **Cấp 2** (mở rộng tại chỗ, `AnimatedSize`): ⏮ ⏭ + preset tốc độ + dòng
   "Chế độ nghe: …" + 4 chip chế độ. Mở/đóng không đổi đáy thanh → vẫn không
   đè thanh điều hướng (xem §4).
3. **Sheet đầy đủ** và **playlist sheet**: hàng chip lặp cũ được thay bằng 4
   chip chế độ + một dòng giải thích chế độ đang chọn.

Tab Bảng Tương Ưng thêm **chip chế độ nghe** ở đầu hàng lọc (chỉ hiện khi đang
có phiên nghe của bảng) → bấm là mở bảng chọn chế độ; hàng lọc vốn cuộn ngang
nên không tốn thêm chiều cao.

---

## 3. "Phần học tập chưa được hệ thống — phân nhóm, trượt ra như cây thư mục"

**Cũ:** `_ModuleGraph → _PhaseSection → _ModuleCard` — danh sách phẳng, không
mở ra được nội dung bên trong.

**Mới:** cây 3 tầng trong tab Học

```
Giai đoạn 1 (Nền tảng)        ← _TreeHeader (mở/đóng, đếm module + % hoàn thành)
  └ Module M1_BASICS          ← _ModuleNode (icon, Pali, tiến độ, khoá, nút mở bài)
      ├ 1. 7 Tâm Sở Biến Hành ← _SectionLeaf (bấm = mở đúng đoạn; 🎧 = nghe riêng)
      └ …
```

* Nút **Mở rộng toàn bộ** / **Thu gọn toàn bộ** trên thanh tiêu đề cây: thu cả
  cây về đúng các đầu mục (giai đoạn), mở ra thì thấy toàn bộ module + mục.
* Mặc định mở Giai đoạn 1 để người mới biết bắt đầu từ đâu; các nhánh khác đóng.
* Mục bị khoá (thiếu prerequisite, khi chưa bật "mở tất cả") không mở ra được,
  vẫn hiện ổ khoá như trước.
* `ModuleDetailScreen` nhận thêm `initialSectionId` + `autoPlaySection`:
  * mở thẳng đúng mục: thẻ mục `initiallyExpanded` + `Scrollable.ensureVisible`
    (thử lại vài nhịp vì ListView dựng con theo nhu cầu);
  * `autoPlaySection` (nút 🎧 ở lá) chuẩn bị playlist của module rồi
    `playFrom(sectionId)` — học và nghe nối liền một mạch.

---

## 4. "Thanh phát âm thanh che mất thanh điều hướng"

Cơ chế nhường chỗ đã có từ 0.10.2 (`homeTabsVisibleProvider` +
`HomeTabsVisibilitySync` + mixin `RouteAware`): khi route đáy HomeScreen ở trên
cùng, thanh nghe nâng đáy lên `navBarHeight + 10`; trên route đẩy lên (không có
NavigationBar) neo đáy 10px như cũ.

Bản 0.10.3 **không nới lỏng** ràng buộc đó và bổ sung kiểm chứng:

* Cấp 2 mới của thanh nghe phình lên TRÊN (đáy không đổi) → bất biến "đáy thanh
  ≤ đỉnh NavigationBar" vẫn đúng.
* `test/global_audio_bubble_web_test.dart` thêm ca: mở cấp 2 → chọn chế độ →
  khẳng định đáy thanh vẫn trên NavigationBar, không có Tooltip nào trong thanh
  (bug web cũ: tooltip ngoài Navigator làm treo input), thu gọn lại vẫn đúng.

---

## Kiểm thử

```bash
python3 tool/check_localizations.py     # 26 locale, 350 khoá UI + nội dung
python3 tool/add_audio_ux_keys.py       # chỉ chạy khi cần sinh lại 11 khoá mới
flutter analyze && flutter test         # CI: .github/workflows/pr_analysis.yml
```

Test mới/đổi:

* `test/audio_player_test.dart` — nhóm "chế độ nghe": sequenceOnce mặc định,
  singleOnce dừng tại chỗ, singleLoop, sequenceLoop, playAll ép tịnh tiến,
  khôi phục chế độ đã lưu, `setPlayMode` xoá "Nghe lại ×N".
* `test/global_audio_bubble_web_test.dart` — ca cấp 2 (mở, chọn chế độ, hình
  học so với NavigationBar, không Tooltip, thu gọn).
