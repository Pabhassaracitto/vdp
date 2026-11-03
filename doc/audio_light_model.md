# Mô hình hoá — Phương án Nhẹ: Nút Bài trước/kế

> Nhánh: `arena/74183d76-vdp@a21b85d` (đã push) — chỉ thay đổi **trong player**, không thêm Tab.

---

## 1. Bản đồ file thay đổi (Change Map)

```mermaid
flowchart LR
    subgraph Giữ nguyên [Giữ nguyên]
        A[HomeScreen<br/>5 tabs]
        B[StudyScreen<br/>cây 3 tầng]
        C[ModuleDetailScreen<br/>_StudyTab]
        D[Matrix / Paticca]
    end

    subgraph Thay đổi [Thay đổi — 4 files]
        E[AudioPlayerState<br/>+next/prevModuleId]
        F[study_module_playlist_builder.dart<br/>MỚI — chung]
        G[FullPlayerSheet<br/>3 nút → 5 nút]
        H[GlobalAudioBubble<br/>cấp 2 +2 nút]
    end

    C --> F
    F --> E
    E --> G
    E --> H

    style F fill:#C8E6C9,stroke:#2E7D32
    style G fill:#FFF9C4,stroke:#F57F17
    style H fill:#FFF9C4,stroke:#F57F17
    style E fill:#BBDEFB,stroke:#1565C0
```

*Chỉ 4 files, ~374 dòng thêm — không đụng `pubspec`, không đụng `kStudyModules`, không đụng l10n.*

---

## 2. Trước vs Sau — Kiến trúc Audio

### Trước (hiện tại trên `main@dd8ccc3`)

```mermaid
flowchart TD
    M[ModuleDetailScreen<br/>M1_BASICS] --> B[_buildStudyTracks<br/>trong file]
    B --> P[AudioPlayerProvider<br/>moduleId=M1<br/>playlist=6 tracks<br/>previous()/next() chỉ index±1]
    P --> S1[FullPlayerSheet<br/>⏮ / ⏯ / ⏭]
    P --> S2[GlobalAudioBubble<br/>⏮ / ⏭ + speed]

    style P fill:#E3F2FD
    style S1 fill:#FFF3E0
```

*Hết playlist M1 → dừng. Muốn nghe M2 phải thoát M1, mở M2, bấm “Nghe toàn bộ”.*

### Sau (phương án nhẹ)

```mermaid
flowchart TD
    M1[M1_BASICS] --> F[study_module_playlist_builder.dart<br/>chung]
    M2[M11_BIET_CANH] --> F
    M3[M2_SI_PHAN] --> F
    F --> P[AudioPlayerProvider<br/>+ orderedModuleIds<br/>+ next/prevModuleId<br/>hasNext/PreviousModule]
    P --> S1[FullPlayerSheet<br/>⏮ Bài / ⏮ / ⏯ / ⏭ / Bài ⏭]
    P --> S2[GlobalAudioBubble cấp 2<br/>Bài ⏮ / ⏮ / ⏭ / Bài ⏭ + speed]

    style F fill:#C8E6C9
    style P fill:#BBDEFB
    style S1 fill:#FFF9C4
    style S2 fill:#FFF9C4
```

*`nextModuleId` tính từ `kStudyModules` sắp theo `recommendedOrder` (18 module).*

---

## 3. Luồng bấm “Bài kế” (Sequence)

```mermaid
sequenceDiagram
    participant U as Người học
    participant F as FullPlayerSheet<br/>(5 nút)
    participant P as AudioPlayerProvider
    participant B as Builder chung
    participant R as VdpRepository<br/>(121 Tâm/52 Sở)
    participant T as TTS Engine

    U->>F: Bấm “Bài kế” (last_page)
    F->>P: hasNextModule? → true<br/>nextModuleId = M11_BIET_CANH
    F->>R: đọc repoState (đã load)
    F->>B: buildStudyModuleTracks(M11, repoState, locale=vi)
    B-->>F: 7 tracks (M11_S01.. + 6 cetasika)
    F->>P: prepareModule(M11, tracks, locale vi)
    P->>T: stop() phiên M1 cũ
    P->>P: state = M11, playlist mới
    F->>P: playAll(resume:false)
    P->>T: play() track 1/7
    P-->>U: Nghe “Tầm — Vitakka” (M11)
```

*Nếu đang ở M1 đầu lộ trình → `hasPreviousModule=false` → nút Bài trước disable (xám, không bấm được).*

---

## 4. Trạng thái nút (State)

```mermaid
stateDiagram-v2
    [*] --> DangNgheM1: prepareModule(M1)
    DangNgheM1 --> DangNgheM11: Bấm Bài kế
    DangNgheM11 --> DangNgheM2: Bấm Bài kế
    DangNgheM2 --> DangNgheM11: Bấm Bài trước
    DangNgheM1 --> DangNgheM1: Bấm Bài trước → disable (không đổi)

    note right of DangNgheM1
        hasPreviousModule = false
        hasNextModule = true
        (đầu lộ trình)
    end note
    note right of DangNgheM11
        hasPreviousModule = true
        hasNextModule = true
        (giữa lộ trình)
    end note
```

*Logic chỉ dùng `recommendedOrder`, không check prerequisite — đúng tinh thần “nghe nhẹ”.*

---

## 5. UI Trước/Sau — FullPlayerSheet

### Trước (3 nút)

```
┌─────────────────────────────────┐
│  Đang nghe: M1 · 2/6             │
│  “Xúc — Phassa”                 │
│                                 │
│      ⏮      ⏯      ⏭           │
│   Mục trước  Play  Mục kế       │
└─────────────────────────────────┘
```

### Sau (5 nút — bạn sẽ thấy khi mở sheet)

```
┌───────────────────────────────────────────┐
│  Đang nghe: M1 · 2/6 → M1_BASICS          │
│  “Xúc — Phassa”                           │
│                                           │
│  ⏮ Bài  ⏮    ⏯    ⏭   Bài ⏭             │
│  first  prev  Play  next  last            │
│  (xám nếu đầu/cuối lộ trình)              │
│                                           │
│  Chế độ nghe: Tịnh tiến · [chips]        │
└───────────────────────────────────────────┘
```

- `first_page` = Bài trước (module trước)
- `skip_previous` = Mục trước (track trong module)
- `last_page` = Bài kế (module kế)

### Trước/Sau — GlobalAudioBubble (khi mở rộng)

```
Trước cấp 2:
┌─────────────────────────────┐
│ ⏮  ⏭   [0.75× 1× 1.25×…]  │
└─────────────────────────────┘

Sau cấp 2:
┌──────────────────────────────────────┐
│ Bài ⏮  ⏮  ⏭  Bài ⏭   [0.75× 1×…]    │
│first  prev next last   speed chips    │
└──────────────────────────────────────┘
```

---

## 6. Không đổi gì (để bạn yên tâm)

| Giữ nguyên | Lý do |
|---|---|
| 5 tabs Home (không thêm Tab Nghe) | Tránh chật, tránh dịch 26 locale |
| `kStudyModules` + `recommendedOrder` | Không đụng data |
| `previous()/next()` trong-module | Vẫn hoạt động như cũ |
| `SharedTtsEngine` + Web tail 8s | Không đụng TTS |
| Lưu vị trí `moduleId` | Không migration |

---

## 7. Thử nhanh sau khi build

1. Mở `Học → M1_BASICS → Nghe toàn bộ`
2. Mở **FullPlayerSheet** (nút 3 chấm hoặc bubble → mở rộng)
3. Thấy 5 nút, 2 đầu là `first/last_page`
4. Bấm **Bài kế** → tự chuyển sang M11 và phát ngay, không cần thoát màn hình.

Nếu ở M1 (đầu) → Bài trước xám disable; ở M10 (cuối) → Bài kế xám.

---

*Cần preview Figma hay video thao tác trên web? Nói tôi render.*
