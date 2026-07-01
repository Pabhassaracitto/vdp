// lib/features/matrix/matrix_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../shared/providers/progress_provider.dart';
import '../../shared/widgets/association_cell.dart';
import '../../shared/widgets/cetasika_header.dart';
import '../../shared/widgets/citta_row_header.dart';
import '../detail/cetasika_detail_sheet.dart';
import '../detail/citta_detail_sheet.dart';

final selectedCittaProvider = StateProvider<String?>((ref) => null);
final selectedCetasikaProvider = StateProvider<String?>((ref) => null);
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
  final ScrollController _verticalController1 = ScrollController();
  final ScrollController _verticalController2 = ScrollController();

  BhumiGroup? _filterBhumi;
  bool _showHighContrastMode = false;
  bool _forceLandscape = false;
  bool _isSyncingScroll = false;

  @override
  void initState() {
    super.initState();
    _verticalController1.addListener(_syncScroll1);
    _verticalController2.addListener(_syncScroll2);
  }

  void _syncScroll1() {
    if (_isSyncingScroll) return;
    if (!_verticalController2.hasClients) return;
    final diff =
        (_verticalController2.offset - _verticalController1.offset).abs();
    if (diff > 0.5) {
      _isSyncingScroll = true;
      _verticalController2.jumpTo(_verticalController1.offset);
      _isSyncingScroll = false;
    }
  }

  void _syncScroll2() {
    if (_isSyncingScroll) return;
    if (!_verticalController1.hasClients) return;
    final diff =
        (_verticalController1.offset - _verticalController2.offset).abs();
    if (diff > 0.5) {
      _isSyncingScroll = true;
      _verticalController1.jumpTo(_verticalController2.offset);
      _isSyncingScroll = false;
    }
  }

  Future<void> _toggleOrientation() async {
    final goLandscape = !_forceLandscape;
    await SystemChrome.setPreferredOrientations(
      goLandscape
          ? [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]
          : [DeviceOrientation.portraitUp],
    );
    await Future.delayed(const Duration(milliseconds: 400));
    if (mounted) {
      setState(() => _forceLandscape = goLandscape);
      if (goLandscape) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                '📱 Nếu không xoay, hãy bật "Xoay tự động" trong cài đặt hệ thống.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _verticalController1.removeListener(_syncScroll1);
    _verticalController2.removeListener(_syncScroll2);
    _horizontalController.dispose();
    _verticalController1.dispose();
    _verticalController2.dispose();
    super.dispose();
  }

  // ════════════════════════════════════════════════════════════
  //  BUILD
  // ════════════════════════════════════════════════════════════

  @override
  Widget build(BuildContext context) {
    final dataState = ref.watch(vdpRepositoryProvider);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (!dataState.isReady) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final cittas = _filterBhumi != null
        ? dataState.cittas.where((c) => c.bhumiGroup == _filterBhumi).toList()
        : dataState.cittas;

    final cetasikas = List<CetasikaModel>.from(dataState.cetasikas)
      ..sort((a, b) => a.traditionalOrder.compareTo(b.traditionalOrder));

    return Scaffold(
      appBar: _buildAppBar(context, cittas.length),
      body: Column(
        children: [
          _buildBhumiFilter(),
          if (dataState.hasValidationWarnings &&
              !ref.read(progressProvider.notifier).warningDismissed)
            _buildWarningBanner(dataState),
          if (!isLandscape) _buildLegend(), // Ẩn legend khi landscape
          Expanded(child: _buildMatrix(context, cittas, cetasikas)),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  APP BAR
  // ════════════════════════════════════════════════════════════

  PreferredSizeWidget _buildAppBar(BuildContext context, int cittaCount) {
    return AppBar(
      title: Semantics(
        label: 'Bảng Tương Ưng Vi Diệu Pháp, đang hiển thị $cittaCount Tâm',
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bảng Tương Ưng Vi Diệu Pháp', style: TextStyle(fontSize: 18)),
            Text('Abhidhamma Matrix',
                style: TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(_forceLandscape
              ? Icons.stay_current_portrait
              : Icons.stay_current_landscape),
          onPressed: _toggleOrientation,
          tooltip: 'Xoay màn hình',
        ),
        IconButton(
          icon: Icon(
              _showHighContrastMode ? Icons.contrast : Icons.contrast_outlined),
          onPressed: () =>
              setState(() => _showHighContrastMode = !_showHighContrastMode),
          tooltip: 'Tương phản cao',
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showHelp(context),
          tooltip: 'Hướng dẫn',
        ),
      ],
    );
  }

  // ════════════════════════════════════════════════════════════
  //  BHUMI FILTER
  // ════════════════════════════════════════════════════════════

  Widget _buildBhumiFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _filterChip(null, 'Tất cả', '🌐'),
          _filterChip(BhumiGroup.akusala, 'Bất Thiện', VdpSymbols.akusala),
          _filterChip(BhumiGroup.ahetuka, 'Vô Nhân', '⬜'),
          _filterChip(BhumiGroup.sobhanaKamavacara, 'Tịnh Hảo DG',
              VdpSymbols.sobhanaKama),
          _filterChip(BhumiGroup.rupavacara, 'Sắc Giới', VdpSymbols.rupavacara),
          _filterChip(BhumiGroup.arupavacara, 'Vô Sắc', VdpSymbols.arupavacara),
          _filterChip(BhumiGroup.lokuttara, 'Siêu Thế', VdpSymbols.lokuttara),
        ],
      ),
    );
  }

  Widget _filterChip(BhumiGroup? bhumi, String label, String symbol) {
    final sel = _filterBhumi == bhumi;
    final c = bhumi == null ? VdpColors.primary : bhumi.name.bhumiColor;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text('$symbol $label'),
        selected: sel,
        onSelected: (_) => setState(() => _filterBhumi = bhumi),
        selectedColor: c.withOpacity(0.3),
        checkmarkColor: c,
        side: BorderSide(color: sel ? c : Colors.grey.shade300),
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  LEGEND
  // ════════════════════════════════════════════════════════════

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Colors.grey.shade50,
      child: Row(
        children: [
          const Text('Ký hiệu:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(width: 12),
          _legendItem(VdpSymbols.always, 'Cố định', VdpColors.always),
          const SizedBox(width: 16),
          _legendItem(VdpSymbols.sometimes, 'Bất định', VdpColors.sometimes),
          const SizedBox(width: 16),
          _legendItem(VdpSymbols.never, 'Không có', VdpColors.never),
        ],
      ),
    );
  }

  Widget _legendItem(String sym, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(sym, style: TextStyle(color: color, fontSize: 16)),
        const SizedBox(width: 4),
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
      ],
    );
  }

  // ════════════════════════════════════════════════════════════
  //  WARNING BANNER
  // ════════════════════════════════════════════════════════════

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
              '${dataState.validationResult!.warnings.length} cảnh báo dữ liệu.',
              style: TextStyle(fontSize: 12, color: Colors.orange.shade900),
            ),
          ),
          TextButton(
            onPressed: () => _showWarnings(dataState),
            child: const Text('Xem', style: TextStyle(fontSize: 12)),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 16),
            onPressed: () {
              ref.read(progressProvider.notifier).dismissWarning();
              setState(() {});
            },
            tooltip: 'Ẩn',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  MATRIX
  // ════════════════════════════════════════════════════════════

  Widget _buildMatrix(
    BuildContext context,
    List<CittaModel> cittas,
    List<CetasikaModel> cetasikas,
  ) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double cellSize = isLandscape ? 30.0 : 44.0;
    final double headerWidth = isLandscape ? 130.0 : 200.0;
    final double cetasikaHeaderHeight = isLandscape ? 60.0 : 110.0;
    final double matrixWidth = cetasikas.length * cellSize;

    final selectedCitta = ref.watch(selectedCittaProvider);
    final selectedCetasika = ref.watch(selectedCetasikaProvider);
    final dimmed = ref.watch(dimmedCetasikasProvider);

    return Row(
      children: [
        // ═══ Cột trái: tên Tâm ═══
        SizedBox(
          width: headerWidth,
          child: Column(
            children: [
              Container(
                height: cetasikaHeaderHeight,
                decoration: BoxDecoration(
                  color: VdpColors.primary,
                  border: Border.all(color: Colors.white30),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Tâm ↓\nTâm Sở →',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _verticalController1,
                  itemCount: cittas.length,
                  itemBuilder: (_, i) {
                    final citta = cittas[i];
                    final isSel = selectedCitta == citta.id;
                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedCittaProvider.notifier).state =
                            isSel ? null : citta.id;
                        if (!isSel) _showCittaDetail(context, citta);
                      },
                      child: CittaRowHeader(
                        citta: citta,
                        isSelected: isSel,
                        width: headerWidth,
                        height: cellSize,
                        displayIndex: i + 1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // ═══ Phần phải: header Tâm Sở + ô Bảng Tương Ưng ═══
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalController,
            child: SizedBox(
              width: matrixWidth,
              child: Column(
                children: [
                  // Header Tâm Sở
                  Row(
                    children: cetasikas.asMap().entries.map((entry) {
                      final colIdx = entry.key;
                      final cs = entry.value;
                      final isSel = selectedCetasika == cs.id;
                      final isDim = dimmed.contains(cs.id);
                      return GestureDetector(
                        onTap: () {
                          ref.read(selectedCetasikaProvider.notifier).state =
                              isSel ? null : cs.id;
                          if (!isSel) _showCetasikaDetail(context, cs);
                        },
                        child: CetasikaHeader(
                          cetasika: cs,
                          isSelected: isSel,
                          isDimmed: isDim,
                          width: cellSize,
                          height: cetasikaHeaderHeight,
                          displayIndex: colIdx + 1,
                        ),
                      );
                    }).toList(),
                  ),

                  // Ô Bảng Tương Ưng
                  Expanded(
                    child: ListView.builder(
                      controller: _verticalController2,
                      itemCount: cittas.length,
                      itemBuilder: (_, rowIdx) {
                        final citta = cittas[rowIdx];
                        final isCittaSel = selectedCitta == citta.id;
                        return Row(
                          children: List.generate(
                            cetasikas.length,
                            (colIdx) {
                              final cs = cetasikas[colIdx];
                              return AssociationCell(
                                cittaId: citta.id,
                                cetasikaId: cs.id,
                                type: _getAssocType(citta, cs.id),
                                isCittaHighlighted: isCittaSel,
                                isCetasikaHighlighted:
                                    selectedCetasika == cs.id,
                                isDimmed: dimmed.contains(cs.id),
                                size: cellSize,
                                useHighContrast: _showHighContrastMode,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  AssociationType _getAssocType(CittaModel citta, String cetasikaId) {
    final a = citta.cetasikaAssociations
        .where((x) => x.cetasikaId == cetasikaId)
        .firstOrNull;
    return a?.type ?? AssociationType.never;
  }

  // ════════════════════════════════════════════════════════════
  //  DETAIL SHEETS
  // ════════════════════════════════════════════════════════════

  void _showCittaDetail(BuildContext ctx, CittaModel citta) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => CittaDetailSheet(citta: citta),
    );
  }

  void _showCetasikaDetail(BuildContext ctx, CetasikaModel cetasika) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => CetasikaDetailSheet(cetasika: cetasika),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  DIALOGS
  // ════════════════════════════════════════════════════════════

  void _showHelp(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        title: const Text('Hướng dẫn Bảng Tương Ưng'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('📖 Cách đọc:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                  '• Hàng ngang: Tâm (Citta)\n• Cột dọc: Tâm Sở (Cetasika)\n• Ô giao nhau: Mối quan hệ'),
              SizedBox(height: 12),
              Text('✦ Ký hiệu:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('✦ = Cố định\n◎ = Bất định\n✕ = Không có'),
              SizedBox(height: 12),
              Text('💡 Mẹo:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                  '• Nhấn Tâm → xem chi tiết\n• Nhấn Tâm Sở → xem xung đột\n• Dùng bộ lọc → thu hẹp\n• Xoay ngang → xem rộng hơn'),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Đã hiểu')),
        ],
      ),
    );
  }

  void _showWarnings(VdpDataState dataState) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Cảnh báo Dữ liệu'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: dataState.validationResult!.warnings
                .map((w) => Padding(
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
                    ))
                .toList(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng')),
        ],
      ),
    );
  }
}
