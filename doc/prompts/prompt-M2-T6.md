┌─────────────────────────────────────────┐
│ ▬▬▬ (drag handle) │
│ │
│ [BhumiChip] [VedanaChip] [FuncChip] │ ← Row chip màu
│ │
│ Tên Pali (lớn, italic) │
│ Tên Tiếng Việt (nhỏ hơn) │
│ │
│ ═══════════════════════════════════ │
│ │
│ 📖 Giáo lý │ ← Section
│ [doctrinalNote text] │
│ │
│ 💡 Ví dụ thực tế │ ← Section (nếu có)
│ • Ví dụ 1 │
│ • Ví dụ 2 │
│ │
│ 🔗 Liên kết Nghiệp │ ← Section (nếu có)
│ [kammaLinks chips] │
│ │
│ 🔢 Tâm Sở phối hợp │ ← Section
│ always: X | sometimes: Y | never: Z │
└─────────────────────────────────────────┘

text


### Chi tiết từng phần:

**1. Header chips (màu theo nhóm):**
```dart
// BhumiChip: màu theo bhumiGroup
// Dùng extension hoặc switch để map BhumiGroup → màu + label
// Ví dụ: akusala → đỏ, sobhanaKamavacara → xanh lá, lokuttara → tím

// VedanaChip: màu theo vedana
// joy → vàng cam, pleasant → xanh, unpleasant → đỏ, neutral → xám

// FunctionChip: màu theo function
// kusala → xanh, akusala → đỏ, vipaka → xám xanh, kiriya → tím nhạt
2. Tên hiển thị:

dart

Text(citta.namePali,
  style: TextStyle(
    fontSize: 22,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
    color: VdpColors.primary,
  ),
),
Text(citta.nameVietnamese,
  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
),
3. Section widget dùng chung:

dart

Widget _buildSection(String emoji, String title, Widget content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 6),
        Text(title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: VdpColors.primary,
          ),
        ),
      ]),
      const SizedBox(height: 8),
      content,
      const Divider(height: 24),
    ],
  );
}
4. Tâm Sở phối hợp — summary dạng chip count:

dart

// Đếm từ cetasikaAssociations
final alwaysCount = citta.cetasikaAssociations
    .where((a) => a.type == AssociationType.always).length;
final sometimesCount = ...;

Row(children: [
  _countChip('Cố định', alwaysCount, VdpColors.always),
  const SizedBox(width: 8),
  _countChip('Bất định', sometimesCount, VdpColors.sometimes),
])
5. Ví dụ thực tế (nếu có):

Chỉ hiện section này khi citta.examples != null && citta.examples!.isNotEmpty
Dùng bullet point •
6. Liên kết Nghiệp (nếu có):

Chỉ hiện khi citta.kammaLinks.isNotEmpty
Hiển thị dạng Wrap + Chip nhỏ
Yêu cầu — CetasikaDetailSheet
Cấu trúc layout mới:
text

┌─────────────────────────────────────────┐
│  ▬▬▬  (drag handle)                     │
│                                         │
│  [GroupChip]  [SubGroupChip]           │  ← Row chip màu
│                                         │
│  Tên Pali (lớn, italic)                │
│  [IPA] (nếu có)                        │
│  Tên Tiếng Việt                        │
│                                         │
│  ═══════════════════════════════════   │
│                                         │
│  📝 Mô tả                              │
│  [descriptionVi]                       │
│                                         │
│  ✦ Tứ Nghĩa                           │  ← Section MỚI (4 aspects)
│  ┌─────────────────────────────────┐   │
│  │ Đặc tướng  │ [trangThai text]   │   │
│  │ Phận sự    │ [phanSu text]      │   │
│  │ Thành tựu  │ [thanhTuu text]    │   │
│  │ Nhân gần   │ [nhanGan text]     │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ⚡ Xung đột                           │  ← Section (nếu có rules)
│  [conflict rules list]                 │
└─────────────────────────────────────────┘
Chi tiết từng phần:
1. Tứ Nghĩa — Table layout (QUAN TRỌNG):

dart

Widget _buildTuNghia(CetasikaModel cs) {
  // Chỉ hiện section nếu ít nhất 1 trong 4 field khác null
  if ([cs.trangThai, cs.phanSu, cs.thanhTuu, cs.nhanGan]
      .every((v) => v == null)) return const SizedBox.shrink();

  return _buildSection('✦', 'Tứ Nghĩa', Column(
    children: [
      _tuNghiaRow('Đặc tướng', cs.trangThai),
      _tuNghiaRow('Phận sự', cs.phanSu),
      _tuNghiaRow('Thành tựu', cs.thanhTuu),
      _tuNghiaRow('Nhân gần', cs.nhanGan),
    ],
  ));
}

Widget _tuNghiaRow(String label, String? value) {
  if (value == null) return const SizedBox.shrink();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: VdpColors.primary,
            ),
          ),
        ),
        Expanded(
          child: Text(value,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    ),
  );
}
2. Conflict Rules (nếu có):

dart

// Chỉ hiện khi cs.conflictRules.isNotEmpty
// Mỗi rule: icon ⚡ + explanation text
// Màu nền: Colors.red.shade50, border: red.shade200
3. Symbol + màu trong header:

dart

// Hiện symbol (cs.symbol) với màu từ cs.colorCode
// Color.fromARGB(255, r, g, b) từ colorCode int
Container(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  decoration: BoxDecoration(
    color: Color(cs.colorCode).withOpacity(0.15),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Color(cs.colorCode).withOpacity(0.4)),
  ),
  child: Text(cs.symbol,
    style: TextStyle(
      fontSize: 18,
      color: Color(cs.colorCode),
    ),
  ),
),
Yêu cầu chung cho CẢ HAI sheet
DragHandle ở đầu:
dart

Center(
  child: Container(
    width: 40, height: 4,
    margin: const EdgeInsets.only(top: 12, bottom: 8),
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(2),
    ),
  ),
),
Padding tổng thể:
dart

DraggableScrollableSheet(
  initialChildSize: 0.6,
  minChildSize: 0.4,
  maxChildSize: 0.92,
  builder: (_, scrollController) => SingleChildScrollView(
    controller: scrollController,
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
    child: Column(...),
  ),
)
Empty/null guard:
Mọi section optional phải check null/empty trước khi render
Dùng SizedBox.shrink() thay vì Container() để tránh space thừa
Accessibility:
Wrap tên Pali với Semantics(label: '${cs.namePali}, ${cs.nameVietnamese}')
Tứ Nghĩa table: mỗi row có semantics label đầy đủ
'Đặc tướng: ${cs.trangThai}'
Ràng buộc KHÔNG được vi phạm
KHÔNG thay đổi cách gọi sheet từ MatrixScreen
(vẫn dùng showModalBottomSheet)
KHÔNG sửa CittaModel hoặc CetasikaModel
KHÔNG thêm provider mới — sheet là stateless display
KHÔNG xóa bất kỳ field data nào đang hiển thị
flutter analyze phải đạt 0 errors
Output yêu cầu
Trả về 2 file hoàn chỉnh:

text

lib/features/detail/citta_detail_sheet.dart
lib/features/detail/cetasika_detail_sheet.dart
Comment // M2-T6: [mô tả] tại các đoạn thay đổi chính.

Checklist tự kiểm tra
CittaDetailSheet:

 DragHandle ở đầu
 DraggableScrollableSheet với initialChildSize: 0.6
 3 chips: BhumiChip, VedanaChip, FunctionChip — màu đúng nhóm
 Tên Pali italic, lớn
 Section doctrinalNote (nếu có)
 Section examples với bullet (nếu có)
 Section kammaLinks với Chip Wrap (nếu có)
 Summary Tâm Sở: always/sometimes count chips
 Null guard đầy đủ
CetasikaDetailSheet:

 DragHandle ở đầu
 DraggableScrollableSheet với initialChildSize: 0.6
 GroupChip + SubGroupChip (nếu có)
 Symbol container màu từ colorCode
 Tên Pali italic, lớn + IPA (nếu có)
 Section descriptionVi
 Section Tứ Nghĩa — table 4 rows (chỉ hiện row có data)
 Section conflictRules (nếu có)
 Null guard đầy đủ
Chung:

 Accessibility semantics
 0 compile errors
text


---

## 📁 File cần đính kèm khi gửi Roo Cline

| File | Trạng thái |
|------|-----------|
| `lib/features/detail/citta_detail_sheet.dart` | ⚠️ **Cần bạn gửi** |
| `lib/features/detail/cetasika_detail_sheet.dart` | ⚠️ **Cần bạn gửi** |
| `lib/core/theme/vdp_theme.dart` | ⚠️ **Cần bạn gửi** |
| `lib/data/models/citta_model.dart` | ✅ Đã có |
| `lib/data/models/cetasika_model.dart` | ✅ Đã có |

> **Lưu ý:** Prompt này có thể gửi song song với M2-T5 vì hai task sửa **file khác nhau hoàn toàn** — không conflict.

---

## ⏭️ Sau khi cả M2-T5 và M2-T6 xong
M2 hoàn thành 6/6 tasks
↓
Tag v0.2.0
↓
Bắt đầu M3: Study & Quiz Enhance