# VDP | AUDIO — Kế hoạch tích hợp "Nghe bài học"

> **Mục tiêu:** Biến tab **Học** từ không gian *đọc bằng mắt* thành không gian *nghe bằng tai*
> — mở ra là nghe được ngay, dưới dạng **danh sách phát (playlist)**, có **đọc lặp** và
> **đổi tốc độ** — để tiện nghe trong lúc không nhìn được màn hình.
>
> Tài liệu này là **plan**, chưa phải implementation. Mọi quyết định được ghi kèm lý do
> theo thói quen sử dụng thật của người học.

---

## 1. Bối cảnh hiện có (audit nhanh)

| Thành phần | Trạng thái | Ghi chú |
|---|---|---|
| `flutter_tts` | ✅ Đã dùng | `lib/core/utils/pali_tts_helper.dart` — phát âm **một từ Pāli** (ưu tiên `hi-IN → en-US`), đang gắn ở detail sheet Tâm/Tâm Sở |
| `just_audio` | ⚠️ Khai trong `pubspec.yaml` nhưng **chưa dùng ở `lib/`** | Sẵn sàng làm engine cho audio file thu âm |
| `audio_session` | Có sẵn (transitive) | Chưa cấu hình — cần cho "nghe tắt màn hình" (P2) |
| Nội dung tab Học | ✅ `assets/content/content_<locale>.json` → `lessonSections` | Mỗi section: `title`, `summary`, `body[]`, `keyTerms` (có `pali`), `sourceRefs` — ID ổn định (`M1_S01`…) |
| UI tab Học | `module_detail_screen.dart` → `_StudyTab`, `_LessonSectionCard` (dạng ExpansionTile) | Chưa có bất kỳ nút nghe nào |
| Lưu trữ thói quen | `SharedPreferences` qua `ProgressNotifier` | Pattern sẵn để lưu tốc độ / chế độ lặp / vị trí nghe dở |
| Kiểu nút điều khiển | `vithi_playback_controls.dart` (play/pause/prev/next/counter) | **Giữ cùng ngôn ngữ thiết kế** cho player để app nhất quán |
| Chuẩn QA | `doc/QA_CHECKLIST_VDP_M3_M4.md` có mục TTS | Cần mở rộng cho player |

**Kết luận:** Không phải bắt đầu từ số 0. Việc cần làm là *tầng Playlist + Player + UX*,
còn TTS và thư viện phát audio đã có sẵn.

---

## 2. Thói quen người nghe → hệ quả thiết kế

Đây là phần quyết định "hợp lý" của kế hoạch. Người học VDP (giáo lý, nhiều liệt kê phải
thuộc: 7 Biến hành, 12 Nhân, 24 Duyên…) không nghe audio để giải trí — họ nghe để
**thuộc lòng** và **nghe rải vụn trong ngày**. Cụ thể:

| # | Thói quen thật | Hệ quả thiết kế |
|---|---|---|
| H1 | **Nghe khi không nhìn được**: đi xe, làm việc nhà, đi bộ, trước khi ngủ | Phát tiếp tục **tự chuyển mục** hết section này sang section khác; điều khiển nằm ở **đáy màn hình (ngón cái)**; P2: nghe được khi tắt màn hình + nút trên tai nghe/bluetooth |
| H2 | **Nghe lặp để thuộc**: tua đi tua lại một đoạn cho tới khi thuộc | **Chế độ lặp**: `Tắt / Lặp mục này / Lặp cả danh sách` + hành động nhanh **"Lặp đoạn này ×3"** (phục vụ học thuộc có chủ đích — xem §6.3) |
| H3 | **Đổi tốc độ theo mục đích**: nghe lướt → 1.25–1.5×; nghe thuộc câu chữ → 0.75× | Tốc độ dạng **preset bấm được ngay** (không slider mơ hồ): `0.75× · 1.0× · 1.25× · 1.5× · 2.0×`, **nhớ vĩnh viễn** tốc độ đã chọn |
| H4 | **Nghe rải đoạn (micro-session)** 3–10 phút/lần | **Nhớ chính xác vị trí nghe dở** theo từng module (mục nào, tới đoạn nào) — mở lại là phát tiếp, không lục lại |
| H5 | **Vừa nghe vừa liếc mắt theo chữ** (đôi khi) | **Highlight đồng bộ** paragraph đang được đọc trong tab Học — khớp đúng triết lý "Dual Encoding" của app (thấy bằng mắt + nghe bằng tai cùng lúc) |
| H6 | **Nghe để thuộc từng mục riêng lẻ** (ví dụ chỉ ôn "Xúc – Phassa") | Playlist cho phép **bấm nghe từ một mục bất kỳ** (tap vào row), không bắt buộc nghe từ đầu |
| H7 | Danh sách = cảm giác "bài học có cấu trúc", không phải file lạc lõng | Playlist hiển thị **đánh số + ước lượng thời lượng** từng mục — người nghe biết "mục này dài 4 phút, mục kia 2 phút" để chọn nghe theo quỹ thời gian |

---

## 3. Phạm vi

**Trong phạm vi (P1 – bắt buộc):**
1. Danh sách phát (playlist) các mục học trong tab **Học** của một module.
2. Nút **Nghe** mở player ngay trong tab bài học (mini player + bảng đầy đủ).
3. **Chế độ lặp**: tắt / lặp 1 mục / lặp cả danh sách.
4. **Đổi tốc độ** 0.75×–2.0×, áp dụng ngay khi đang phát, có ghi nhớ.
5. Tự phát tuần tự; tua tới/lùi mục; phát từ 1 mục bất kỳ.
6. Nhớ & phục hồi vị trí nghe dở, tốc độ, chế độ lặp (offline-first như mọi phần khác).
7. Nguồn âm: **TTS đọc nội dung bài học** (mặc định) — mọi module, mọi locale có chữ là nghe được ngay.

**Ngoài phạm vi giai đoạn đầu (đưa vào P2/P3, có chủ đích):**
- Nghe khi tắt màn hình / lock screen / nút tai nghe (P2 — cần `audio_service`).
- File thu âm giảng thật (P2 — xem §4 nguyên tắc Hybrid, hợp đồng dữ liệu đã để ngỏ).
- Hẹn giờ tắt (sleep timer) cho thói quen nghe trước khi ngủ (P2).
- Nghe ở tab Ôn tập / flashcard (P3).
- Listening quiz kiểu `Vong_Lap_Tinh_Hoa.dm` (P3).

---

## 4. Kiến trúc đề xuất

### 4.1. Nguyên tắc Hybrid: "file trước, TTS sau"

```
Muốn phát 1 track →
   ├─ có audioRef (file dựng sẵn) trong content? → just_audio phát file
   └─ không có                                   → TrackPlayer đọc nội dung text
        ├─ P1: TtsTrackPlayer (flutter_tts — giọng hệ thống)
        └─ P2+: SherpaTtsTrackPlayer (sherpa-onnx — giọng neural offline, chân thật)
```

- **Lý do:** dự án đã tự định hướng đúng từ `milestone_plan.md` (M4-T1) và
  `Vong_Lap_Tinh_Hoa.dm` ("nếu có audio file → phát audio; nếu không → TTS").
- **QUYẾT ĐỊNH (đã chốt 2026-09):** dự án **không có file thu âm sẵn** và **không thu mới**.
  Giọng đọc sẽ được nâng cấp bằng **sherpa-onnx** (TTS neural offline, chất lượng gần
  giọng thật) trong P2. Kiến trúc `TrackPlayer`抽象 sẵn để sherpa trượt vào thay
  `TtsTrackPlayer` mà **không đổi UI/provider/playlist**. `audioRef` vẫn giữ làm hợp đồng
  để ngỏ cho file xuất sẵn từ pipeline (nếu cần).- Hợp đồng `audioRef` để ngỏ trong schema content (không bắt buộc, không phá dữ liệu cũ):

```jsonc
// content_<locale>.json → studyModules.<ID>.lessonSections[i]
{
  "id": "M1_S01",
  "title": "...",
  "body": ["..."],
  "audioRef": {              // OPTIONAL — thêm sau này, không cần migration
    "file": "assets/audio/vi/M1_S01.mp3",
    "durationSec": 245
  }
}
```

### 4.2. Lớp module (thư mục mới `lib/features/audio/`)

```
lib/features/audio/
├── models/
│   ├── audio_track.dart          # 1 mục phát được (thuần Dart, không freezed)
│   └── player_state.dart         # enum RepeatMode {off, one, all} + PlayerState
├── data/
│   ├── playlist_builder.dart     # ModuleLessonContent → List<AudioTrack>
│   └── tts_locale_map.dart       # locale nội dung → mã giọng TTS (§7)
├── players/
│   ├── track_player.dart         # abstract: play/pause/stop/seekCue/setSpeed
│   ├── tts_track_player.dart     # flutter_tts, đọc theo từng cue (đoạn)
│   └── file_track_player.dart    # just_audio (P2, khi có audioRef)
├── providers/
│   └── audio_player_provider.dart# StateNotifier/Riverpod: playlist + vị trí + speed + repeat
├── widgets/
│   ├── listen_section_button.dart# 🔊 trên từng _LessonSectionCard
│   ├── playlist_sheet.dart       # bảng "Danh sách nghe" (list!)
│   ├── mini_player_bar.dart      # thanh nhỏ đáy tab Học
│   └── full_player_sheet.dart    # bảng điều khiển đầy đủ (lặp, tốc độ…)
└── services/
    └── listening_position_store.dart # SharedPreferences: vị trí/tốc độ/lặp
```

**Quy ước:** model audio là **thuần Dart** (giống `lesson_content.dart`) — không cần
`build_runner`, parse phòng thủ, lỗi một track không sập cả playlist.

### 4.3. Hợp đồng track (tóm tắt)

```dart
class AudioTrack {
  final String id;              // = sectionId, ví dụ "M1_S02" — ổn định giữa các locale
  final String moduleId;
  final String locale;
  final String title;
  final List<AudioCue> cues;    // 1 cue ≈ 1 đoạn body/summary/keyTerms
  final String? audioAsset;     // null → dùng TTS
  final Duration? durationHint; // file có duration thật; TTS ước tính ≈ số từ / 150wpm
}

class AudioCue {
  final String text;            // nguyên văn để đọc (đã gộp nhãn "Từ khóa:" nếu có)
  final String? highlightRef;   // id paragraph trong section để UI highlight
}
```

**Độ granular:** 1 track = 1 `LessonSection` (không nhỏ tới từng đoạn, không lớn tới cả module).
- Quá nhỏ (từng đoạn) → playlist dài loằng ngoằng, lặp phải bấm nhiều lần.
- Quá lớn (toàn module) → không nghe được "mục lẻ" theo thói quen H6.
- Cue = đoạn văn (`body[i]`) để **highlight mắt-nhìn-tai-nghe** được chính xác (H5) và
  tránh TTS nuốt/chết trên văn bản quá dài (xem rủi ro §10).

---

## 5. UX chi tiết trong tab bài học

### 5.1. Điểm mở (entry points) — "tiện mở nghe"

```
┌─ Tab "Học" (ModuleDetailScreen) ──────────────────────────────┐
│  ┌─ Module header ─────────────────────────────────────────┐  │
│  │  [Module info …]                                        │  │
│  │  [ ▶ Nghe toàn bộ ]   [ ☰ Danh sách nghe (7) ]        │  │  ← 2 nút này
│  └─────────────────────────────────────────────────────────┘  │
│  ┌─ Mục 1 ────────────────────────────────── [🔊] [▶] ────┐  │
│  │  (ExpansionTile như hiện tại)                           │  │  ← 🔊 = nghe
│  └─────────────────────────────────────────────────────────┘     riêng mục này
│  ┌─ Mục 2 ────────────────────────────────── [🔊] [▶] ────┐  │
│  …                                                            │
│                                                               │
│  ══ mini player [▶ 2. Xúc và Thọ · 1:12/4:05 · 1.25× ⟳] ══ │  ← nổi ở đáy tab
└───────────────────────────────────────────────────────────────┘
```

1. **"Nghe toàn bộ"** (module header): build playlist theo thứ tự `lessonSections`, phát từ
   đầu — hoặc **từ vị trí nghe dở** nếu có (H4; có chip nhỏ "Tiếp tục mục 3").
2. **"Danh sách nghe (n)"**: mở `playlist_sheet` — **dạng list** đúng như yêu cầu.
3. **Nút trên từng section card**: `▶` nghe riêng mục này; đang phát mục nào thì card đó
   đổi thành nút Pause và **đè sáng (highlight)**.
4. **Mini player**: bám đáy tab Học mọi lúc khi có phiên nghe (cả khi đã sang tab Ôn tập/Kiểm tra
   trong cùng module). Bấm vào thân thanh → mở `full_player_sheet`.

### 5.2. Danh sách nghe (`playlist_sheet`) — "dạng list"

```
┌ Danh sách nghe · M1 — Biến hành ───────── [▶ Phát tất cả] ┐
│  1  Tâm sở Tợ tha và nhóm Biến hành        ≈ 4 phút   ▶   │  ← tap = phát từ đây
│  2  Xúc (Phassa) và Thọ (Vedanā)           ≈ 6 phút   ▶   │
│  3  Tưởng, Tư, Nhất hành          ▶ ĐANG NGHE  1:12/5:20 │  ← row active + progress
│  4  Mạng quyền và Tác ý                     ≈ 3 phút   ▶   │
│  …                                                          │
│  ── Tùy chọn ─────────────────────────────────────────────  │
│  Lặp:     [Tắt] [Mục này] [Cả danh sách]                   │
│  Tốc độ:  [0.75×] [1.0×] [1.25×] [1.5×] [2.0×]            │
└─────────────────────────────────────────────────────────────┘
```

- Row active: viền màu module + progress mảnh; row xong (khi phát tuần tự) tick nhẹ.
- Thời lượng `≈ n phút` với TTS = ước tính `số từ / 150wpm / tốc độ hiện tại` (H7);
  với file = `durationSec` thật. Ghi rõ "≈" để không hứa hẹn sai.

### 5.3. Bảng điều khiển đầy đủ (`full_player_sheet`)

```
┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
│  M1 · Biến hành                                             │
│  3/7  Tưởng, Tư, Nhất hành                                  │
│                                                             │
│        ⏮        ⏯ (lớn)        ⏭                           │
│   ⟲ Lặp mục này (×2 còn lại)     [Tốc độ 1.25×]            │
│                                                             │
│  Đoạn 2/5 · gạch chân text đang đọc khi mở tab Học          │
└ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
```

- Nút **⏮/⏭** = mục trước/sau (giống `vithi_playback_controls` cho quen tay).
- Nút **lặp** bấm xoay vòng `Tắt → Mục này → Cả danh sách → Tắt`; icon đổi theo
  (`repeat_one_rounded`, `repeat_rounded`) — quen mặt với mọi app nghe nhạc.
- Nút **tốc độ** bấm mở hàng preset; chip hiển thị giá trị hiện tại.
- Nút Play/Pause **to nhất** — thói quen một tay, đang nghe chỉ cần bấm mù cũng trúng.

### 5.4. Đồng bộ mắt–tai (H5)

Khi một cue đang được đọc và tab Học đang hiển thị section tương ứng: paragraph tương ứng
(`highlightRef`) được **đè nền màu module nhạt + gạch chân động**. Không tự cuộn ồn ào —
chỉ auto-scroll khi paragraph đang đọc **ra khỏi khung nhìn**. Triết lý app vốn là
"THẤY bằng mắt, HIỂU bằng tim" — audio không thay thế đôi mắt, nó **cộng hưởng**.

### 5.5. Ngôn ngữ thiết kế

Tái dùng đúng phong cách `vithi_playback_controls.dart`: container bo góc 14, nút tròn,
`Tooltip` + `Semantics(button:, label:)` cho mọi control, tôn trọng `context.isHighContrast`
và text scale (đối chiếu `QA_CHECKLIST_VDP_M3_M4.md` M4-T2/M4-T4).

---

## 6. Tốc độ & Lặp — hành vi chi tiết

### 6.1. Tốc độ

| Preset | Dùng khi | Ghi chú |
|---|---|---|
| 0.75× | Nghe thuộc từng câu chữ, ghi chép | Hợp với nội dung giáo lý dày thuật ngữ Pāli |
| 1.0× | Mặc định | |
| 1.25× | Ôn lại lần 2+ | Khuyến nghị ngầm: preset nhớ lâu dài theo **người dùng**, không theo module |
| 1.5× | Nghe lướt toàn module | |
| 2.0× | Đã thuộc, nghe rà | |

- **Áp dụng tức thì** khi đang phát (không gián đoạn cue đang đọc: áp dụng từ cue kế tiếp
  với TTS, tức thì với file).
- Ánh xạ về engine:
  - `flutter_tts.setSpeechRate` — **chuẩn hóa** vì thang đo khác nhau theo nền tảng
    (Android 0.0–1.0 với ~0.5 là "bình thường"; iOS 0.0–1.0 với ~0.5 là mặc định).
    `tts_locale_map.dart` chứa hệ số chuẩn hóa riêng cho từng nền tảng (chi tiết triển khai).
  - `just_audio.setSpeed` — dùng trực tiếp.

### 6.2. Lặp cơ bản (bắt buộc)

| Chế độ | Icon | Hành vi |
|---|---|---|
| `Tắt` | `repeat` mờ | Hết mục → mục kế; hết playlist → dừng |
| `Mục này` | `repeat_one` | Lặp vô hạn track hiện tại (mặc định bấm nhanh trên mini player) |
| `Cả danh sách` | `repeat` | Vòng playlist; quay về mục 1 sau mục cuối |

### 6.3. "Lặp đoạn ×N" — tính năng mấu chốt cho học thuộc (H2)

Ngoài lặp vô hạn, thêm hành động **"Nghe lại ×3"** trong `full_player_sheet`:
phát lại track hiện tại đúng 3 lần rồi tự chuyển mục. Triết lý: người học giáo lý thuộc
theo *nhịp lặp có đếm* ("nghe 3 lần câu này rồi qua câu sau") — giống cách tụng niệm
lặp biến số. Biến thể ×2/×3/×5. **Không** lưu vào preset chung (chỉ dùng tại chỗ).

---

## 7. Ngôn ngữ, TTS và Pāli

| Việc | Quyết định |
|---|---|
| Giọng đọc nội dung | Theo **locale nội dung** (không theo locale UI — nguyên tắc sẵn có của app): `vi → vi-VN`, `en → en-US`, `hi → hi-IN`, `my → my-MM`, `si → si-LK`, `zh → zh-CN`, `ja → ja-JP`… |
| Thiếu giọng (đặc biệt `my`, `si`, `bo`) | Chuỗi fallback: giọng locale → `en-US` → ẩn nút nghe + toast nhẹ "Thiết bị chưa có giọng đọc cho ngôn ngữ này" (không giả tạo doctrine bằng giọng sai) |
| Thuật ngữ **Pāli** (`keyTerms.pali`) | Khi cue tới phần từ khóa: đọc `term` bằng giọng nội dung, phát `pali` bằng **`PaliTtsHelper`** (đúng `hi-IN → en-US` như hiện tại) — nhất quán với nút nghe phát âm Pāli sẵn có |
| Ngắt nghỉ | Giữa các cue: pause ~350ms; sau tiêu đề mục: ~600ms |
| Chunking | 1 cue = 1 đoạn `body[]` (thường 1–3 câu) — tránh lỗi nuốt chữ / dừng sớm của TTS trên văn bản dài |

> Về lâu dài, khi có ≥5 locale nội dung (theo `doc/localization_content_plan.md`),
> cân nhắc pipeline **pre-synth offline** (gộp cue → mp3 theo `Vong_Lap_Tinh_Hoa.dm`
> `getAudioPath`) để chất lượng ổn định và phát được cả khi TTS thiết bị yếu. Không chặn P1.

---

## 8. Lưu trữ thói quen (SharedPreferences)

Pattern giống `ProgressNotifier`, prefix riêng để không đụng dữ liệu cũ:

| Key | Giá trị | Ghi nhớ cho |
|---|---|---|
| `audio.speed` | `double` (mặc định `1.0`) | H3 — tốc độ dùng chung |
| `audio.repeatMode` | `off` / `one` / `all` | H2 |
| `audio.pos.<moduleId>` | `{"trackId":"M1_S02","cueIndex":2}` | H4 — nghe dở mỗi module |
| `audio.finished.<moduleId>` | `List<trackId>` đã nghe hết | tick ✓ trong playlist, thống kê sau này |

Ghi debounce (sau cue / khi pause / khi thoát), đọc 1 lần lúc mở player — nhẹ, offline-first.

---

## 9. l10n — chuỗi mới cần thêm

Thêm khóa vào `app_vi.arb` + `app_en.arb` (các locale còn lại fallback), tối thiểu:

`listenAll`, `listenFromHere`, `listeningQueue`, `nowPlaying`, `repeatOff`, `repeatOne`,
`repeatAll`, `listenAgainTimes`, `playbackSpeed`, `resumeListening`, `playingSection`,
`ttsUnavailableForLanguage`, `estimatedMinutes`, `sleepTimer` (P2).

Tái dùng sẵn: `listenPaliPronunciation` (đã có).

---

## 10. Lộ trình triển khai

### P0 — Chốt contract (0.5 ngày)
| Task | Nội dung | Done khi |
|---|---|---|
| A0-1 | Model `AudioTrack`/`AudioCue` + `PlaylistBuilder` tách từ `ModuleLessonContent` | Unit test: đủ 7 mục của `M1_BASICS`, đúng thứ tự, cue map về `highlightRef` |
| A0-2 | Quy ước `audioRef` (optional) trong schema + cập nhật `tool/check_localizations.py` bỏ qua field mới | JSON cũ load bình thường |

### P1 — Nghe trong tab bài học (2–3 ngày) ★ lõi yêu cầu
| Task | Nội dung | Done khi |
|---|---|---|
| A1-1 | `TtsTrackPlayer` (cue queue, pause/continue, đổi tốc độ từ cue sau, cleanup) | Nghe trọn 1 section không đứt đoạn, pause/resume không nhảy chữ |
| A1-2 | `audio_player_provider` (playlist, index, repeat, speed, sự kiện hoàn thành cue/track) | Unit test chuyển mục theo 3 chế độ lặp |
| A1-3 | Mini player + entry points ở `_StudyTab` (Nghe toàn bộ / Danh sách / nút section) | Mở tab Học → 2 lần bấm là phát được (kể cả lần đầu cài app) |
| A1-4 | `playlist_sheet` dạng list + `full_player_sheet` (tốc độ, lặp, lặp ×N) | Đủ 3 chế độ lặp + 5 mức tốc độ hoạt động khi đang phát |
| A1-5 | `ListeningPositionStore` + "Tiếp tục mục 3" | Thoát app giữa chừng → mở lại phát tiếp đúng đoạn |
| A1-6 | Highlight cue trong `_LessonSectionCard` + auto-scroll khi cần | Paragraph đang đọc nổi bật, không cuộn giật |
| A1-7 | Semantics/tooltip/high-contrast + chuỗi l10n | Pass mục TTS trong QA checklist (bổ sung case mới) |

### P2 — Nghe như app nghe nhạc (2–3 ngày)
| Task | Nội dung |
|---|---|
| A2-1 | `audio_session` cấu hình loại `AudioSessionContentType.speech` — ưu tiên tai nghe, không duck nhạc đột ngột |
| A2-2 | Nền/lock screen/tai nghe: `audio_service` + notification điều khiển (play/pause/next, tốc độ nhảy 1 nấc) |
| A2-3 | **Spike sherpa-onnx**: `SherpaTtsTrackPlayer` implements `TrackPlayer` — giọng neural offline (vi trước), so sánh chất lượng với flutter_tts; giữ `FileTrackPlayer` (`just_audio`) + `audioRef` làm đường phụ cho file xuất sẵn |
| A2-4 | Sleep timer (15/30/60 phút, fade-out 3s) — thói quen nghe trước khi ngủ |
| A2-5 | Hàng "Tiếp tục nghe" ở màn hình Học (`study_screen`) |

### P3 — Mở rộng (chọn sau)
- Nghe flashcard tab Ôn tập (hỏi–đáp–lặp có pause để tự trả lời — phong cách "mind game").
- Listening quiz theo `Vong_Lap_Tinh_Hoa.dm` (phase `listening_quiz`, `SafeAudioService`).
- Pre-synth pipeline tạo mp3 cho 5 locale nội dung ưu tiên; thống kê "đã nghe bao nhiêu %".

---

## 11. Rủi ro & giảm thiểu

| Rủi ro | Mức | Giảm thiểu |
|---|---|---|
| `flutter_tts` dừng sớm / nuốt chữ trên đoạn dài | Cao | Chunk theo cue (đoạn); test thiết bị thật Android + iOS ở A1-1; không bao giờ speak >1 paragraph/lần |
| Thang `setSpeechRate` khác nhau theo nền tảng | TB | Bảng chuẩn hóa trong `tts_locale_map.dart`, test tay 5 preset × 2 nền tảng |
| Thiếu giọng TTS (`my`, `si`, `bo`…) | TB | Fallback chain (§7); ẩn quyền + thông báo rõ ràng, không nghe giọng sai thuật ngữ |
| Phát âm Pāli giữa câu nghe "đổi giọng" | TB | Cố ý: Pāli = giọng `hi-IN` (trùng nút phát âm Pāli hiện có); chỉ đọc Pāli ở đoạn "Từ khóa" để người nghe quen nhịp |
| TTS không tự chạy tiếp khi tắt màn hình (P1) | Chấp nhận | Ghi rõ trong QA "P1 là nghe khi mở app"; P2 xử lý dứt điểm bằng `audio_service` |
| Duration ước tính sai lệch | Thấp | Luôn hiển thị "≈"; cập nhật lại ước tính theo tốc độ hiện tại |
| Xung đột với phát âm Pāli ở detail sheet | Thấp | Một `AudioCoordinator` duy nhất: mở player → stop `PaliTtsHelper`, và ngược lại |

---

## 12. Kịch bản thử nghiệm (rút gọn)

1. **Lần đầu:** mở M1 → tab Học → "Nghe toàn bộ" → phát mục 1 bằng tiếng Việt, không cần cấu hình gì.
2. **List:** mở "Danh sách nghe" → thấy 7 mục đánh số + thời lượng ≈ → tap mục 4 → phát từ mục 4.
3. **Lặp:** chọn "Mục này" → nghe 3 vòng liên tục một mục; chọn "Cả danh sách" → hết mục cuối quay mục 1.
4. **Tốc độ:** đang phát → 1.5× → tốc độ đổi không gián đoạn; kill app → mở lại vẫn 1.5×.
5. **Nghe dở:** thoát ở giữa mục 3 → mở lại module → "Tiếp tục mục 3" → phát đúng cue.
6. **Pāli:** tới cue "Từ khóa" → nghe "Aññasamāna" bằng giọng Pāli quen thuộc.
7. **Song song:** đang nghe → mở detail sheet Tâm → bấm phát âm Pāli → player tự pause (hoặc PaliTtsHelper tự dừng — theo A1 quyết định 1 lần).
8. **Fallback:** đổi nội dung sang locale không có giọng TTS trên máy → toast + ẩn nút phát, không crash.

---

## 13. Quyết định đã chốt

1. **File thu âm:** KHÔNG có file thu sẵn và KHÔNG thu mới. Giọng đọc nâng cấp bằng
   **sherpa-onnx** ở P2 (`SherpaTtsTrackPlayer` implements `TrackPlayer`). `audioRef` giữ
   làm hợp đồng để ngỏ cho file xuất sẵn từ pipeline nếu cần.
2. **Mặc định tốc độ lần đầu:** `1.0×`. Chip tốc độ trên mini player bấm xoay vòng preset
   (một tay, không cần mở sheet).
3. **Mặc định lặp:** `Tắt` (tôn trọng kỳ vọng podcast/audiobook). "Mục này" và ×N nằm trong
   một nút bấm cho người cần học thuộc.

**Ghi chú hành vi khi triển khai P1 (đã áp dụng):**
- Nút ▶ trên từng mục học = **phát từ mục đó trong hàng đợi của module** (tự chuyển tiếp
  các mục sau) — khác một chút soo với wording "nghe riêng mục này" ở §5.1; ai cần "riêng"
  một mục chọn *Lặp mục này*. Lý do: phục vụ thói quen nghe liền mạch (H1) tốt hơn.
- P1 hiển thị vị trí phát dạng **"mục 3/7 · đoạn 2/5"** thay vì đồng hồ phút:giây — TTS
  không có mặt số thời gian thật, hiển thị sai thì thà không hiển thị (thời lượng hàng
  playlist vẫn là "≈ n phút" theo §5.2). Khi có sherpa/file (P2) sẽ có timeline thật.

---

*Tài liệu phục vụ milestone M4 (Audio & Accessibility) — bổ sung cho `doc/milestone_plan.md`,
không thay thế QA checklist hiện có.*
