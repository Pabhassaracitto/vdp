# VDP | Audio — Đề án Tab Nghe đa bài + Nút Tiến/Lùi

> **Vai trò:** Lead Designer + Staff Engineer (kinh nghiệm Apple / Spotify / Google)  
> **Ngày:** 2026-10-27  •  Nhánh: `arena/74183d76-vdp` rebased trên `main@dd8ccc3`  
> **Yêu cầu gốc:** *“khảo sát dự án và lên phương án cho việc tích hợp cho tab nghe khả năng phát được nhiều bài. Và thêm nút tiến và lùi bài.”*

---

## 0. Tóm tắt điều hành (Executive Summary)

Hiện tại VDP **không có Tab Nghe độc lập**. Chức năng nghe sống rải rác:
- Trong `ModuleDetailScreen > _StudyTab` (mỗi module = 1 playlist cô lập)
- Trong `MatrixScreen` (121 Tâm / 52 Tâm Sở) và `PaticcaScreen`
- Điều khiển toàn cục chỉ có `GlobalAudioBubble` (1 bubble nổi)

Hệ quả: người học **không thể nghe liên tục nhiều bài (nhiều module / nhiều chương)**. Muốn nghe `M1 → M2 → M3` phải thoát module, mở module kế, bấm “Nghe toàn bộ” lại — đứt quãng, mất vị trí, không có `⏮ Bài trước / ⏭ Bài kế`.

**Đề án này đề xuất:**

1. **Dữ liệu:** Mở rộng `AudioPlayerProvider` từ *playlist 1 module* sang *queue đa bài (cross-module)*, giữ nguyên engine TTS.
2. **UX:** Thêm **Tab Nghe** thứ 6 vào `HomeScreen` (hoặc nâng `GlobalAudioBubble` thành mini-player cố định) — chuẩn Spotify/YouTube Music/Apple Podcasts.
3. **Điều khiển:** Bổ sung 2 nút **⏮ Bài trước / ⏭ Bài kế** + 2 nút **⏮/⏭ Cấu phần trong bài** ở mọi nơi (bubble, full sheet, playlist, tab).
4. **Triển khai an toàn:** 3 pha, không phá playlist cũ, test hồi quy đầy đủ.

---

## 1. Khảo sát hiện trạng (Audit)

### 1.1 Kiến trúc hiện tại

```
HomeScreen (5 tabs)
 ├─ MatrixScreen ──▶ AudioPlayerProvider (AudioSourceKind.matrixCitta / matrixCetasika)
 ├─ StudyScreen ──▶ ModuleDetailScreen (M1..M10)
 │                   └─ _StudyTab ──▶ _buildStudyTracks() = PlaylistBuilder + EntityPlaylistBuilder
 │                          │                moduleId = M1_BASICS, 1 playlist / 1 module
 │                          └─ _ListenActionsRow (Nghe toàn bộ / Danh sách nghe)
 ├─ PaticcaScreen
 └─ GlobalAudioBubble (1 bubble, vẽ 1 lần ở main.dart, ngoài Navigator)
```

| Thành phần | File | Ghi chú |
|---|---|---|
| Model | `lib/features/audio/models/audio_track.dart` | `AudioTrack(id, moduleId, title, cues, audioAsset, durationHint)` — 1 track = 1 `LessonSection` |
| Builder | `lib/features/audio/data/playlist_builder.dart` | `PlaylistBuilder.build(moduleId, sections)` → `List<AudioTrack>` |
| Builder | `lib/features/audio/data/entity_playlist_builder.dart` | Ghép Tâm/Tâm Sở/Kamma… vào cùng playlist |
| State | `lib/features/audio/providers/audio_player_provider.dart` | `moduleId`, `playlist`, `currentIndex`, `currentCueIndex`, `repeatMode`, `playScope`, `sleepTimer`… `canResume`, `finishedTrackIds` |
| Player | `lib/features/audio/players/tts_track_player.dart` | `SharedTtsEngine` → `flutter_tts` (Web Speech) / `SherpaTtsTrackPlayer` (native) |
| UI nổi | `lib/features/audio/widgets/global_audio_bubble.dart` | 1 bubble, 2 cấp (gọn / mở rộng), xử lý web inset |
| UI chi tiết | `lib/features/audio/widgets/playlist_sheet.dart` | List tile `_TrackRow`, tap → `playFrom(track.id)` |
| UI full | `lib/features/audio/widgets/full_player_sheet.dart` | Transport ⏮/⏯/⏭ (chỉ trong-module), `PlayModeSelector`, sleep timer |
| Lưu | `lib/features/audio/services/listening_position_store.dart` | `savePosition(moduleId, ListeningPosition)` — key = moduleId |

### 1.2 Điểm mạnh cần giữ

- **Idempotent prepare:** `prepareModule()` gọi lại vô hại — rất ổn định.
- **Audio Coordinator:** `PaliTtsHelper.onBeforeSpeak` → pause phiên nghe, tránh 2 engine nói chồng.
- **Karaoke highlight:** `currentCueKey` + `wordIndex` đồng bộ mắt-tai (V1.9.2).
- **Watchdog 18s:** tự chữa “đọc đoạn đầu rồi im”.
- **Web voice tail 8s:** bắt `NamMinh` muộn (IN4-74).

### 1.3 Điểm yếu gây yêu cầu “đa bài”

| Vấn đề | Chi tiết |
|---|---|
| **Playlist cô lập theo module** | `state.moduleId` là `String?` đơn, `prepareModule` ghi đè playlist cũ. Không có khái niệm *queue nhiều module*. |
| **Không có khái niệm Bài** | `AudioTrack.id = LessonSection.id (M1_S01)` nhưng UI chưa từng nhóm track thành “Bài” (chương) để tiến/lùi cấp Bài. |
| **Transport chỉ trong-module** | `previous()/next()` chỉ `index ±1` trong `state.playlist`. Hết playlist → dừng (hoặc loop), không sang module kế. |
| **Lưu vị trí theo module** | `loadPosition(moduleId)` chỉ nhớ 1 module cuối. Nghe 3 bài liên tiếp thì chỉ nhớ bài cuối. |
| **Tab Nghe không tồn tại** | Người học phải nhớ mình đang ở module nào để tìm lại. Không có nơi tập trung “tiếp tục nghe”. |
| **Thiếu nút Bài trước/kế** | Bubble cấp 1 chỉ có ⏯. Full sheet có ⏮/⏭ track, nhưng không có ⏮ Bài / ⏭ Bài (nhảy giữa các `LessonSection` nhóm). |

---

## 2. Định nghĩa “Bài” trong VDP

Từ `assets/content/content_*.json` + `lib/data/models/lesson_content.dart`:

```
StudyModule (M1_BASICS — 7 Biến Hành)
 └─ ModuleLessonContent (studyModules.M1_BASICS)
     ├─ lessonSections: List<LessonSection>  ← “Bài” cấp 1 (ví dụ M1_S01, M1_S02…)
     ├─ reviewCards
     └─ quizSeeds

LessonSection
 ├─ id: "M1_S01"          // ổn định giữa locale
 ├─ title, summary, body[], keyTerms, sourceRefs
 └─ audioRef? (file dựng sẵn, optional)
```

**Quyết định thiết kế:** *1 Bài = 1 `LessonSection`* (độ granular đã chốt ở `doc/audio_plan.md §4.3`). Lý do:
- Quá nhỏ (từng `AudioCue`) → playlist 50+ mục, rối.
- Quá lớn (cả `StudyModule`) → không thể ôn lẻ “Xúc – Phassa”.
- Entity (Citta/Cetasika) đã được ghép vào playlist như track riêng, vẫn giữ được.

Với đa bài, *queue* sẽ là `List<AudioTrack>` nối từ nhiều `LessonSection` của nhiều `StudyModule`.

---

## 3. Nguyên tắc thiết kế (Hãng đầu)

| Nguyên tắc | Nguồn | Áp dụng VDP |
|---|---|---|
| **One-hand thumb zone** | Apple HIG, Material 3 | Transport ⏮/⏯/⏭ đặt đáy, chip lớn ≥48dp, không để nút quan trọng ở góc trên |
| **Glanceable Now Playing** | Spotify | Bubble luôn hiện `Bài đang phát · 2/14 · “Tâm Sở Phassa”` — 1 ánh nhìn biết đang đâu |
| **Continuous queue** | YouTube Music | Hết bài tự sang bài kế, không hỏi. Người nghe chọn “Nghe nhiều bài” là muốn trôi chảy. |
| **Explicit queue** | Apple Podcasts | Cho xem toàn bộ queue, kéo sắp lại, xóa bài khỏi queue — không giấu. |
| **Respect system** | iOS AVSession / Android Media3 | Dừng khi có cuộc gọi, tôn trọng nút tai nghe/bluetooth (đã có `VdpAudioSession`) |
| **Offline-first, không giật** | VDP Accuracy-first | Mọi thao tác queue phải hoạt động offline; prepare không chặn UI. |

---

## 4. Phương án đề xuất

### 4.1 Kiến trúc dữ liệu mới (không phá cũ)

#### 4.1.1 Mở rộng `AudioPlayerState`

```dart
// Cũ:
String? moduleId;            // 1 module
String moduleTitle;
List<AudioTrack> playlist;    // chỉ 1 module

// Mới (giữ tương thích):
String? moduleId;             // giữ cho deep-link cũ
String moduleTitle;            // giữ
List<AudioTrack> playlist;     // giờ là queue đa bài (cross-module)

String? queueTitle;            // ví dụ "Lộ trình Nền tảng (M1→M3)" hoặc "Đã chọn 4 bài"
List<String> queueModuleIds;   // ["M1_BASICS", "M2_SI_PHAN", ...] — để lưu/restore
AudioSourceKind sourceKind;    // thêm .multiModuleStudy
int? queueVersion;             // bump khi user thêm/xóa bài → invalidate savedPosition
```

*Migration:* `ListeningPosition` vẫn `String trackId + cueIndex`, nhưng key lưu đổi từ `moduleId` sang `queueId` (hash của `queueModuleIds`). Các cài đặt cũ có `moduleId` → tự map thành queue 1 phần tử, không mất dữ liệu.

#### 4.1.2 Builder mới

```dart
// lib/features/audio/data/multi_module_playlist_builder.dart

List<AudioTrack> buildMultiModuleTracks({
  required BuildContext context,
  required List<StudyModule> modules,        // user đã chọn, giữ order
  required VdpRepository repo,               // để filter cittas/cetasikas/...
}) {
  final all = <AudioTrack>[];
  for (final m in modules) {
    final lesson = m.lessonContent(context);
    all.addAll(_buildStudyTracks(
      context,
      moduleId: m.id,
      sections: lesson.sections,
      cittas: _filterCittas(repo.cittas, m.cittaIds),
      cetasikas: _filterCetasikas(repo.cetasikas, m.cetasikaIds),
      // ... kammas, paticcas, rupas, vithis
    ));
  }
  return List.unmodifiable(all);
}
```

Tái dùng 100% `_buildStudyTracks()` hiện có — không duplicate logic.

#### 4.1.3 Provider API mới

```dart
class AudioPlayerNotifier {
  // Cũ — giữ nguyên, delegate sang mới:
  Future<void> prepareModule({required String moduleId, ... List<AudioTrack> tracks})

  // Mới:
  Future<void> prepareQueue({
    required String queueId,                 // ví dụ "queue:phase1" hoặc "queue:custom:<hash>"
    required String queueTitle,
    required List<String> queueModuleIds,
    required List<AudioTrack> tracks,
    required String contentLocaleTag,
    AudioSourceKind sourceKind = AudioSourceKind.study,
  });

  Future<void> playAllInQueue({bool resume = true});
  Future<void> appendToQueue(List<AudioTrack> tracks); // thêm bài vào cuối queue đang phát
  Future<void> removeFromQueue(String trackId);

  // Tiến/lùi cấp Bài (mới) vs cấp Track (cũ):
  Future<void> nextTrack();        // cũ: next() → đổi tên rõ nghĩa
  Future<void> previousTrack();
  Future<void> nextLesson();       // nhảy tới track đầu của LessonSection kế (nhóm body+terms)
  Future<void> previousLesson();
  Future<void> nextModule();       // nhảy tới module kế trong queueModuleIds
  Future<void> previousModule();

  // Helpers:
  bool get hasNextTrack;
  bool get hasPreviousTrack;
  bool get hasNextModule;
  bool get hasPreviousModule;
  AudioTrack? get nextTrackPreview;
  AudioTrack? get previousTrackPreview;
}
```

*Không xóa `previous()/next()` cũ — mark `@Deprecated` và forward sang `nextTrack()` để không gãy test.*

### 4.2 UX — Tab Nghe + Nút Tiến/Lùi

#### 4.2.1 Vị trí Tab Nghe

**Lựa chọn A (khuyến nghị):** Thêm tab thứ 6 vào `HomeScreen`:

```
[ Ma trận | Học | Duyên | Lộ tâm | 🎧 Nghe | Cài đặt ]
```

- Tab Nghe là **Now Playing + Queue**, không phải duplicate StudyScreen.
- `home_tab_index.dart` thêm `kHomeTabListen = 4`, dịch các tab sau lên 1.
- Khi chưa có phiên nghe → hiện `ContinueListeningCard` + gợi ý “Chọn bài”.
- Khi có phiên nghe → hiện mini-player cố định trên + danh sách queue.

**Lựa chọn B (nếu không muốn tăng tab):** Biến `GlobalAudioBubble` thành **mini-player bar cố định** đáy màn hình (như Spotify) — luôn chiếm `navigationBarHeight + 56dp`, không còn dạng bubble nổi che NavigationBar. Tradeoff: mất 1 hàng chiều cao nội dung.

> **Khuyến nghị A** vì ít rủi ro layout web, phù hợp VDP đã có 5 tab.

#### 4.2.2 Wireframe Tab Nghe

```
┌─────────────────────────────────────────┐
│ 🎧 Đang nghe · M1→M2 (4 bài)  [⋯] [×]  │  ← queueTitle + queueModuleIds count
│ ┌─────────────────────────────────────┐ │
│ │ ☸  Xúc — Phassa                     │ │  ← currentTrack.title (2 dòng)
│ │ M1 · 2/8 · ≈ 3′ · vi               │ │  ← moduleId · index · duration
│ │ [⏮ Bài] [⏮] [⏯] [⏭] [⏭ Bài]     │ │  ← 5 nút transport mới (xem 4.2.3)
│ │ ████████░░░░  02:14 / 08:30        │ │  ← progress (cues / cueCount)
│ │ [Chỉ bài này] [Tịnh tiến] [Lặp]  │ │  ← PlayModeSelector (reuse)
│ └─────────────────────────────────────┘ │
│                                         │
│ Tiếp theo (3) ─────────── [Sắp xếp]    │
│  ▶  3. Thọ — Vedanā          M1 4′ ✓  │
│  ○  4. Tưởng — Saññā        M1 5′     │  ← queue list, isCurrent highlight
│  ○  M2_S01 — Si Phần         M2 6′    │
│                                         │
│ [+ Thêm bài]  [Lưu queue]  [Xóa hết]  │
└─────────────────────────────────────────┘
```

#### 4.2.3 Bộ nút Tiến/Lùi (2 cấp)

| Nút | Icon | Hành vi | Khi disable |
|---|---|---|---|
| **⏮ Bài trước** | `skip_previous_rounded` bọc `queue` (hoặc `first_page`) | `previousModule()` — nhảy về track đầu của module trước đó trong `queueModuleIds` | `!hasPreviousModule` → opacity 0.35 + `Semantics(enabled:false)` |
| **⏮ Cấu phần trước** | `skip_previous_rounded` | `previousTrack()` — track trước trong queue | `!hasPreviousTrack` |
| **⏯ Phát/Tạm dừng** | `play_arrow / pause` (filled) | `togglePlayPause()` | — |
| **⏭ Cấu phần kế** | `skip_next_rounded` | `nextTrack()` | `!hasNextTrack` |
| **⏭ Bài kế** | `skip_next_rounded` bọc `queue` (hoặc `last_page`) | `nextModule()` | `!hasNextModule` |

*Đặt 5 nút thẳng hàng, nút giữa (⏯) lớn hơn 1.3×, 4 nút biên nhỏ hơn — chuẩn Apple Music.*

Hiển thị ở 4 nơi (reuse 1 widget `MultiLessonTransport`):

1. **Tab Nghe** — hàng chính
2. **GlobalAudioBubble cấp 2** — mở rộng bubble hiện có (`_expanded`) thêm 2 nút Bài
3. **FullPlayerSheet** — thay hàng `⏮/⏯/⏭` hiện tại bằng 5 nút
4. **PlaylistSheet** — header thêm `⏮ Bài / ⏭ Bài` icon-only

#### 4.2.4 Chọn nhiều bài

Ở `StudyScreen > _ModuleGraph` (cây 3 tầng đã có ở `doc/audio_ux_0.10.3.md`):

- Thêm checkbox tròn (hoặc long-press) ở mỗi `_ModuleNode` và `_SectionLeaf`.
- Thanh hành động nổi khi chọn ≥1: `Đã chọn 3 bài [Nghe ngay] [Thêm vào queue]`.
- `Nghe ngay` → `prepareQueue(queueTitle: "Đã chọn (3)", tracks: selected)` + `playAllInQueue(resume:false)`.
- `Thêm vào queue` → `appendToQueue(selected)` nếu đã có queue.

Preset nhanh ở Tab Nghe:

- `Giai đoạn 1 (Nền tảng)` — `M1, M11, M2…` (phase 1)
- `Toàn bộ Lộ trình` — `M1→M10` theo `recommendedOrder`
- `Ôn tập đến hạn` — dùng `isModuleDueForReview()`

### 4.3 Điều hướng & Deep-link

- `GlobalAudioBubble._goToSource()` hiện chỉ push `ModuleDetailScreen(moduleData: module!)` với `moduleId` đơn. Mới: nếu `sourceKind == multiModuleStudy`, push `ListenQueueScreen(queueId, queueModuleIds)` hoặc tab Nghe.
- `StudyScreen` lá cây: nút 🎧 hiện chỉ `playFrom(sectionId)` trong-module. Mới: thêm long-press “Thêm vào Nghe” (queue).

### 4.4 Lưu trữ & Khôi phục

```
// SharedPreferences keys (mới):
audio.queueId               // "queue:phase1" hoặc "queue:custom:abc123"
audio.queueTitle
audio.queueModuleIds        // json list ["M1_BASICS","M2_SI_PHAN"]
audio.queueTrackIds         // để rebuild queue sau restart (phòng locale đổi)
audio.queuePosition         // {queueId, trackId, cueIndex}

// Cũ giữ lại 1 phiên bản để migration:
audio.lastPositionByModule  // map moduleId → ListeningPosition (đã có)
```

*Khi mở app, `AudioPlayerNotifier` thử `loadPosition(queueId)` trước, fallback `loadPosition(moduleId)` cũ.*

---

## 5. Lộ trình 3 pha (không gãy)

### Pha 1 — Nền (1–2 ngày, không đổi UI lớn)

- [ ] Thêm `prepareQueue/nextModule/previousModule/hasNextModule` vào `AudioPlayerProvider` + test `test/audio_player_test.dart` (group “multi-lesson queue”).
- [ ] Tạo `MultiLessonTransport` widget 5 nút, thay vào `FullPlayerSheet` và `GlobalAudioBubble` cấp 2 (reuse test `global_audio_bubble_web_test.dart`).
- [ ] Giữ `prepareModule` hoạt động như cũ — QA: phát 1 module, tiến/lùi track vẫn đúng.

**Tiêu chí xong:** Trong 1 module, ⏮ Bài / ⏭ Bài disable đúng; ⏮/⏭ track vẫn chạy; không regression.

### Pha 2 — Tab Nghe (2–3 ngày)

- [ ] Thêm `kHomeTabListen`, `ListenQueueScreen` (Now Playing + queue list).
- [ ] `StudyScreen` thêm chọn nhiều module (checkbox + action bar).
- [ ] `ContinueListeningCard` đổi thành “Tiếp tục queue” khi có `queueId`.

**Tiêu chí xong:** Chọn M1+M2, Nghe ngay → phát 8+6 track liên tiếp không ngắt; chuyển locale vẫn giữ queue.

### Pha 3 — Tinh chỉnh (1 ngày)

- [ ] Lưu queue cross-session, deep-link `/listen?queue=...`.
- [ ] A11y: Semantics `nextModule: "Bài kế: Thọ — Vedanā"`, haptic nhẹ khi đổi bài.
- [ ] Phân tích: log `queue_length`, `prev/next_module_count` (tôn trọng privacy, không log nội dung).

---

## 6. Rủi ro & Mitigation

| Rủi ro | Mitigation |
|---|---|
| Queue dài 50+ track → TTS timeout, memory | Builder chỉ tạo `AudioTrack` cho module đã chọn, không preload audio file; `TtsTrackPlayer` vẫn đọc từng `AudioCue` (sentence) như cũ. |
| Web voice list chưa kịp load → robot khi sang bài mới | Tái dùng `WebTtsVoiceCatalog.tail` đã có; `nextModule()` chờ `catalog.load()` nếu cần trước khi `setVoice`. |
| Phá vỡ `canResume` logic cũ | `canResume` đổi thành `queuePosition != đầu queue`; giữ `savedPosition` fallback. |
| NavigationBar che bubble | Bubble đã nâng `navBarHeight+10` (V1.9.2); Tab Nghe không có NavigationBar chồng → không cần fix thêm. |

---

## 7. Đề xuất bước tiếp theo

1. **Duyệt thiết kế này** (đặc biệt §4.2.1: Tab thứ 6 vs mini-bar cố định).
2. Tôi triển khai **Pha 1** ngay (provider + transport 5 nút) — ước 150 dòng + test, không đụng `content_*.json`.
3. Sau khi Pha 1 merge vào `main`, tiếp tục Pha 2 trên nhánh này.

---

## Phụ lục — File liên quan để chạm

- `lib/features/audio/providers/audio_player_provider.dart` — 80% logic
- `lib/features/audio/models/audio_track.dart` — không cần đổi
- `lib/features/audio/widgets/global_audio_bubble.dart` — thêm 2 nút
- `lib/features/audio/widgets/full_player_sheet.dart` — thay transport
- `lib/features/home/home_screen.dart` + `home_tab_index.dart` — thêm tab
- `lib/features/study/study_screen.dart` — thêm chọn nhiều bài
- `test/audio_player_test.dart`, `test/global_audio_bubble_web_test.dart` — mở rộng

