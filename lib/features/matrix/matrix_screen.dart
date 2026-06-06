// lib/features/matrix/matrix_screen.dart
// Matrix Layer - Trực quan hóa quan hệ 121 Tâm × 52 Tâm Sở
// Accessibility-First + Dual Encoding (Màu + Hình + Text)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../shared/widgets/association_cell.dart';
import '../../shared/widgets/cetasika_header.dart';
import '../../shared/widgets/citta_row_header.dart';
import '../detail/cetasika_detail_sheet.dart';
import '../detail/citta_detail_sheet.dart';

/// Provider cho Tâm đang được chọn (highlight)
final selectedCittaProvider = StateProvider<String?>((ref) => null);

/// Provider cho Tâm Sở đang được chọn (highlight + dim conflicts)
final selectedCetasikaProvider = StateProvider<String?>((ref) => null);

/// Provider cho danh sách Tâm Sở bị dim (conflict detection)
final dimmedCetasikasProvider = Provider<Set<String>>((ref) {
  final selected = ref.watch(selectedCetasikaProvider);
  if (selected == null) return {};
  return ref.read(vdpRepositoryProvider.notifier).getDimmedCetasikas(selected);
});

class MatrixScreen extends ConsumerStatefulWidget {
  const MatrixScreen({super.key});

  @override
  ConsumerState<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends ConsumerState<MatrixScreen> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  // Filter state
  BhumiGroup? _filterBhumi;
  bool _showHighContrastMode = false;

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataState = ref.watch(vdpRepositoryProvider);

    if (!dataState.isReady) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final cittas = _filterBhumi != null
        ? dataState.cittas.where((c) => c.bhumiGroup == _filterBhumi).toList()
        : dataState.cittas;
    final cetasikas = dataState.cetasikas
      ..sort((a, b) => a.traditionalOrder.compareTo(b.traditionalOrder));

    return Scaffold(
      appBar: _buildAppBar(context, cittas.length),
      body: Column(
        children: [
          // Bộ lọc Bhumi Groups
          _buildBhumiFilter(),

          // Validation Warnings Banner (nếu có)
          if (dataState.hasValidationWarnings) _buildWarningBanner(dataState),

          // Legend / Hướng dẫn Dual Encoding
          _buildLegend(),

          // Ma trận chính
          Expanded(
            child: _buildMatrix(context, cittas, cetasikas),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, int cittaCount) {
    return AppBar(
      title: Semantics(
        label: 'Ma trận Vi Diệu Pháp, đang hiển thị $cittaCount Tâm',
        child: const Column(
          children: [
            Text('Ma Trận Vi Diệu Pháp', style: TextStyle(fontSize: 18)),
            Text('Abhidhamma Matrix',
                style: TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
      ),
      actions: [
        // High Contrast Toggle - Accessibility
        Semantics(
          label: 'Bật/tắt chế độ tương phản cao',
          child: IconButton(
            icon: Icon(_showHighContrastMode
                ? Icons.contrast
                : Icons.contrast_outlined),
            onPressed: () =>
                setState(() => _showHighContrastMode = !_showHighContrastMode),
            tooltip: 'Chế độ tương phản cao',
          ),
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showHelp(context),
          tooltip: 'Hướng dẫn',
        ),
      ],
    );
  }

  Widget _buildBhumiFilter() {
    return Semantics(
      label: 'Bộ lọc theo cõi giới',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            _buildFilterChip(null, 'Tất cả', '🌐'),
            const SizedBox(width: 8),
            _buildFilterChip(
                BhumiGroup.akusala, 'Bất Thiện', VdpSymbols.akusala),
            const SizedBox(width: 8),
            _buildFilterChip(BhumiGroup.ahetuka, 'Vô Nhân', '⬜'),
            const SizedBox(width: 8),
            _buildFilterChip(BhumiGroup.sobhanaKamavacara, 'Tịnh Hảo DG',
                VdpSymbols.sobhanaKama),
            const SizedBox(width: 8),
            _buildFilterChip(
                BhumiGroup.rupavacara, 'Sắc Giới', VdpSymbols.rupavacara),
            const SizedBox(width: 8),
            _buildFilterChip(
                BhumiGroup.arupavacara, 'Vô Sắc', VdpSymbols.arupavacara),
            const SizedBox(width: 8),
            _buildFilterChip(
                BhumiGroup.lokuttara, 'Siêu Thế', VdpSymbols.lokuttara),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(BhumiGroup? bhumi, String label, String symbol) {
    final isSelected = _filterBhumi == bhumi;
    final color = bhumi == null ? VdpColors.primary : bhumi.name.bhumiColor;

    return Semantics(
      label: 'Lọc: $label',
      selected: isSelected,
      button: true,
      child: FilterChip(
        label: Text('$symbol $label'),
        selected: isSelected,
        onSelected: (_) => setState(() => _filterBhumi = bhumi),
        selectedColor: color.withOpacity(0.3),
        checkmarkColor: color,
        side: BorderSide(color: isSelected ? color : Colors.grey.shade300),
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Colors.grey.shade50,
      child: Semantics(
        label:
            'Giải thích ký hiệu: Hình vuông vàng là cố định, vòng tròn vàng là bất định, dấu X xám là không có',
        child: Row(
          children: [
            const Text('Ký hiệu:',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            const SizedBox(width: 12),
            _buildLegendItem(VdpSymbols.always, 'Cố định', VdpColors.always),
            const SizedBox(width: 16),
            _buildLegendItem(
                VdpSymbols.sometimes, 'Bất định', VdpColors.sometimes),
            const SizedBox(width: 16),
            _buildLegendItem(VdpSymbols.never, 'Không có', VdpColors.never),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String symbol, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(symbol, style: TextStyle(color: color, fontSize: 16)),
        const SizedBox(width: 4),
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
      ],
    );
  }

  Widget _buildWarningBanner(VdpDataState dataState) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.orange.shade50,
      child: Row(
        children: [
          Icon(Icons.warning_amber, color: Colors.orange.shade700, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${dataState.validationResult!.warnings.length} cảnh báo dữ liệu. '
              'Dữ liệu vẫn được tải nhưng cần kiểm tra.',
              style: TextStyle(fontSize: 12, color: Colors.orange.shade900),
            ),
          ),
          TextButton(
            onPressed: () => _showWarnings(dataState),
            child: const Text('Xem', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildMatrix(
    BuildContext context,
    List<CittaModel> cittas,
    List<CetasikaModel> cetasikas,
  ) {
    const double cellSize = 40.0;
    const double headerWidth = 180.0;
    const double cetasikaHeaderHeight = 100.0;

    final selectedCitta = ref.watch(selectedCittaProvider);
    final selectedCetasika = ref.watch(selectedCetasikaProvider);
    final dimmedCetasikas = ref.watch(dimmedCetasikasProvider);

    return Row(
      children: [
        // Cột cố định: Header Tâm (bên trái)
        SizedBox(
          width: headerWidth,
          child: Column(
            children: [
              // Corner cell
              Container(
                height: cetasikaHeaderHeight,
                decoration: BoxDecoration(
                  color: VdpColors.primary,
                  border: Border.all(color: Colors.white30),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Tâm\nTâm Sở',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Tâm rows
              Expanded(
                child: ListView.builder(
                  controller: _verticalController,
                  itemCount: cittas.length,
                  itemBuilder: (context, index) {
                    final citta = cittas[index];
                    final isSelected = selectedCitta == citta.id;
                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedCittaProvider.notifier).state =
                            isSelected ? null : citta.id;
                        if (!isSelected) {
                          _showCittaDetail(context, citta);
                        }
                      },
                      child: CittaRowHeader(
                        citta: citta,
                        isSelected: isSelected,
                        width: headerWidth,
                        height: cellSize,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Vùng cuộn ngang: Cetasika headers + Matrix cells
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalController,
            child: Column(
              children: [
                // Cetasika Headers (cố định trên)
                Row(
                  children: cetasikas.map((cetasika) {
                    final isSelected = selectedCetasika == cetasika.id;
                    final isDimmed = dimmedCetasikas.contains(cetasika.id);
                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedCetasikaProvider.notifier).state =
                            isSelected ? null : cetasika.id;
                        if (!isSelected) {
                          _showCetasikaDetail(context, cetasika);
                        }
                      },
                      child: CetasikaHeader(
                        cetasika: cetasika,
                        isSelected: isSelected,
                        isDimmed: isDimmed,
                        width: cellSize,
                        height: cetasikaHeaderHeight,
                      ),
                    );
                  }).toList(),
                ),

                // Matrix body (cuộn cả hai chiều)
                Expanded(
                  child: ListView.builder(
                    controller: _verticalController,
                    itemCount: cittas.length,
                    cacheExtent: 500, // Tăng cache để cuộn mượt hơn
                    itemBuilder: (context, rowIndex) {
                      final citta = cittas[rowIndex];
                      final isCittaSelected = selectedCitta == citta.id;

                      return Row(
                        children: List.generate(cetasikas.length, (colIndex) {
                          final cetasika = cetasikas[colIndex];
                          return AssociationCell(
                            cittaId: citta.id,
                            cetasikaId: cetasika.id,
                            type: _getAssocType(citta, cetasika.id),
                            isCittaHighlighted: isCittaSelected,
                            isCetasikaHighlighted:
                                selectedCetasika == cetasika.id,
                            isDimmed: dimmedCetasikas.contains(cetasika.id),
                            size: cellSize,
                            useHighContrast: _showHighContrastMode,
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AssociationType _getAssocType(CittaModel citta, String cetasikaId) {
    final assoc = citta.cetasikaAssociations
        .where((a) => a.cetasikaId == cetasikaId)
        .firstOrNull;
    return assoc?.type ?? AssociationType.never;
  }

  void _showCittaDetail(BuildContext context, CittaModel citta) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => CittaDetailSheet(citta: citta),
    );
  }

  void _showCetasikaDetail(BuildContext context, CetasikaModel cetasika) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => CetasikaDetailSheet(cetasika: cetasika),
    );
  }

  void _showHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hướng dẫn Ma Trận'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('📖 Cách đọc Ma Trận:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('• Hàng ngang: 121 Tâm (Citta)\n'
                  '• Cột dọc: 52 Tâm Sở (Cetasika)\n'
                  '• Ô giao nhau: Mối quan hệ phối hợp'),
              SizedBox(height: 12),
              Text('✦ Ký hiệu:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('✦ = Cố định (luôn phối hợp)\n'
                  '◎ = Bất định (có thể có)\n'
                  '✕ = Không có'),
              SizedBox(height: 12),
              Text('💡 Mẹo:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('• Nhấn vào Tâm để xem chi tiết\n'
                  '• Nhấn vào Tâm Sở để xem xung đột\n'
                  '• Dùng bộ lọc để thu hẹp hiển thị'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đã hiểu'),
          ),
        ],
      ),
    );
  }

  void _showWarnings(VdpDataState dataState) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cảnh báo Dữ liệu'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: dataState.validationResult!.warnings
                .map(
                  (w) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('⚠️ '),
                        Expanded(
                            child: Text(w.message,
                                style: const TextStyle(fontSize: 13))),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }
}
