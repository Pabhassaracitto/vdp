// lib/features/matrix/matrix_screen.dart

import 'dart:async';

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

// M2-T4: Search state
enum SearchType { citta, cetasika }

final matrixSearchQueryProvider = StateProvider<String>((ref) => '');
final matrixSearchTypeProvider =
    StateProvider<SearchType>((ref) => SearchType.citta);

final searchMatchedCittaIndicesProvider = Provider<Set<int>>((ref) {
  final query = ref.watch(matrixSearchQueryProvider).toLowerCase();
  final searchType = ref.watch(matrixSearchTypeProvider);
  if (query.isEmpty || searchType != SearchType.citta) return {};

  final cittas = ref.watch(cittasProvider);
  final matches = <int>{};
  for (int i = 0; i < cittas.length; i++) {
    if (cittas[i].nameVietnamese.toLowerCase().contains(query) ||
        cittas[i].namePali.toLowerCase().contains(query)) {
      matches.add(i);
    }
  }
  return matches;
});

final searchMatchedCetasikaIndicesProvider = Provider<Set<int>>((ref) {
  final query = ref.watch(matrixSearchQueryProvider).toLowerCase();
  final searchType = ref.watch(matrixSearchTypeProvider);
  if (query.isEmpty || searchType != SearchType.cetasika) return {};

  final cetasikas = ref.watch(cetasikasProvider);
  final matches = <int>{};
  for (int i = 0; i < cetasikas.length; i++) {
    if (cetasikas[i].nameVietnamese.toLowerCase().contains(query) ||
        cetasikas[i].namePali.toLowerCase().contains(query)) {
      matches.add(i);
    }
  }
  return matches;
});

class MatrixScreen extends ConsumerStatefulWidget {
  const MatrixScreen({super.key});

  @override
  ConsumerState<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends ConsumerState<MatrixScreen> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController1 = ScrollController();

  Timer? _searchDebounceTimer;

  BhumiGroup? _filterBhumi;
  bool _showHighContrastMode = false;
  bool get _isHC =>
      _showHighContrastMode || Theme.of(context).brightness == Brightness.dark;
  bool _forceLandscape = false;
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _verticalController1.addListener(_updateScrollToTopVisibility);
  }

  void _updateScrollToTopVisibility() {
    if (!mounted) return;
    final shouldShow = _verticalController1.offset > 200;
    if (_showScrollToTop != shouldShow) {
      setState(() {
        _showScrollToTop = shouldShow;
      });
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
    _verticalController1.removeListener(_updateScrollToTopVisibility);
    _horizontalController.dispose();
    _verticalController1.dispose();
    _searchDebounceTimer?.cancel();
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
      appBar: AppBar(
        title: Semantics(
          label:
              'Bảng Tương Ưng Vi Diệu Pháp, đang hiển thị ${cittas.length} Tâm',
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bảng Tương Ưng Vi Diệu Pháp',
                  style: TextStyle(fontSize: 18)),
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
            icon: Icon(_isHC ? Icons.contrast : Icons.contrast_outlined),
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
      ),
      body: Column(
        children: [
          _buildBhumiFilter(),
          _buildSearchBar(isLandscape),
          if (dataState.hasValidationWarnings &&
              !ref.read(progressProvider.notifier).warningDismissed)
            _buildWarningBanner(dataState),
          if (!isLandscape) _buildLegend(),
          Expanded(child: _buildMatrix(context, cittas, cetasikas)),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _showScrollToTop ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: IgnorePointer(
          ignoring: !_showScrollToTop,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {
              _verticalController1.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: const Icon(Icons.arrow_upward),
          ),
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  SEARCH BAR
  // ════════════════════════════════════════════════════════════

  Widget _buildSearchBar(bool isLandscape) {
    final query = ref.watch(matrixSearchQueryProvider);
    final searchType = ref.watch(matrixSearchTypeProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: isLandscape ? 4 : 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm Tâm hoặc Tâm Sở...',
                hintStyle: TextStyle(fontSize: isLandscape ? 13 : 14),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          ref.read(matrixSearchQueryProvider.notifier).state =
                              '';
                        },
                        tooltip: 'Xóa tìm kiếm',
                      )
                    : null,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: isLandscape ? 8 : 12,
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (val) {
                _searchDebounceTimer?.cancel();
                _searchDebounceTimer =
                    Timer(const Duration(milliseconds: 300), () {
                  ref.read(matrixSearchQueryProvider.notifier).state = val;

                  final matchedCittas =
                      ref.read(searchMatchedCittaIndicesProvider);
                  final matchedCetasikas =
                      ref.read(searchMatchedCetasikaIndicesProvider);

                  // Scroll to first match
                  if (searchType == SearchType.citta) {
                    _scrollToFirstMatch(
                        matchedCittas, _verticalController1, 44.0);
                  } else {
                    _scrollToFirstMatch(
                        matchedCetasikas, _horizontalController, 44.0);
                  }
                });
              },
            ),
          ),
          const SizedBox(width: 8),
          ToggleButtons(
            isSelected: [
              searchType == SearchType.citta,
              searchType == SearchType.cetasika
            ],
            onPressed: (idx) {
              ref.read(matrixSearchTypeProvider.notifier).state =
                  idx == 0 ? SearchType.citta : SearchType.cetasika;
            },
            children: const [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Tâm')),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Tâm Sở')),
            ],
          ),
          if (isLandscape) ...[
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                ref.read(matrixSearchQueryProvider.notifier).state = '';
              },
              tooltip: 'Ẩn',
            ),
          ],
        ],
      ),
    );
  }

  void _scrollToFirstMatch(
      Set<int> matchedIndices, ScrollController ctrl, double cellSize) {
    if (matchedIndices.isEmpty) return;
    final firstIdx = matchedIndices.reduce((a, b) => a < b ? a : b);
    final offset = (firstIdx * cellSize).clamp(
      0.0,
      ctrl.position.maxScrollExtent,
    );
    ctrl.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
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
        label: Text(
          '$symbol $label',
          style: TextStyle(
            // M1-T4: HC fix — label rõ trên nền tối
            color: _isHC ? HCColors.textPrimary : null,
          ),
        ),
        selected: sel,
        onSelected: (_) => setState(() => _filterBhumi = bhumi),
        // M1-T4: HC fix — không hiện nền trắng
        backgroundColor: _isHC ? HCColors.surface : null,
        selectedColor: c.withValues(alpha: 0.3),
        checkmarkColor: c,
        side: BorderSide(
          color: sel
              ? c
              : (_showHighContrastMode
                  ? HCColors.textMuted
                  : Colors.grey.shade300),
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  LEGEND
  // ════════════════════════════════════════════════════════════

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      // M1-T4: HC fix — không dùng Colors.grey.shade50 trong HC
      color: Colors.transparent,
      child: Row(
        children: [
          Text('Ký hiệu:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _showHighContrastMode ? HCColors.textPrimary : null,
              )),
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
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            // M1-T4: HC fix — label text rõ trên nền tối
            color: _showHighContrastMode
                ? HCColors.textSecondary
                : Colors.grey.shade700,
          ),
        ),
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
      // M1-T4: HC fix
      color:
          _showHighContrastMode ? HCColors.background : Colors.orange.shade50,
      child: Row(
        children: [
          Icon(
            Icons.warning_amber,
            color: _showHighContrastMode
                ? HCColors.textPrimary
                : Colors.orange.shade700,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${dataState.validationResult!.warnings.length} cảnh báo dữ liệu.',
              style: TextStyle(
                fontSize: 12,
                color: _showHighContrastMode
                    ? HCColors.textPrimary
                    : Colors.orange.shade900,
              ),
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

    final searchType = ref.watch(matrixSearchTypeProvider);
    final matchedCittas = ref.watch(searchMatchedCittaIndicesProvider);
    final matchedCetasikas = ref.watch(searchMatchedCetasikaIndicesProvider);

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
                    final isMatch = matchedCittas.contains(i);
                    final isDimmed = searchType == SearchType.citta &&
                        matchedCittas.isNotEmpty &&
                        !isMatch;

                    Widget child = GestureDetector(
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
                        // M1-T4: Truyền HC mode xuống header
                        useHighContrast: _isHC,
                      ),
                    );

                    if (isMatch) {
                      child = Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left:
                                BorderSide(color: Color(0xFFFFD700), width: 3),
                          ),
                        ),
                        child: child,
                      );
                    }

                    return Opacity(
                      opacity: isDimmed ? 0.35 : 1.0,
                      child: child,
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
                      final isMatch = matchedCetasikas.contains(colIdx);
                      final isSearchDim = searchType == SearchType.cetasika &&
                          matchedCetasikas.isNotEmpty &&
                          !isMatch;

                      Widget child = GestureDetector(
                        onTap: () {
                          ref.read(selectedCetasikaProvider.notifier).state =
                              isSel ? null : cs.id;
                          if (!isSel) _showCetasikaDetail(context, cs);
                        },
                        child: CetasikaHeader(
                          cetasika: cs,
                          isSelected: isSel,
                          isDimmed: isDim || isSearchDim,
                          width: cellSize,
                          height: cetasikaHeaderHeight,
                          displayIndex: colIdx + 1,
                          // M1-T4: Truyền HC mode xuống header
                          useHighContrast: _isHC,
                        ),
                      );

                      if (isMatch) {
                        child = Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Color(0xFFFFD700), width: 3),
                            ),
                          ),
                          child: child,
                        );
                      }

                      return Opacity(
                        opacity: isSearchDim ? 0.35 : 1.0,
                        child: child,
                      );
                    }).toList(),
                  ),

                  // Ô Bảng Tương Ưng
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(cittas.length, (rowIdx) {
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
                                  isDimmed: dimmed.contains(cs.id) ||
                                      (searchType == SearchType.cetasika &&
                                          matchedCetasikas.isNotEmpty &&
                                          !matchedCetasikas.contains(colIdx)) ||
                                      (searchType == SearchType.citta &&
                                          matchedCittas.isNotEmpty &&
                                          !matchedCittas.contains(rowIdx)),
                                  size: cellSize,
                                  useHighContrast: _isHC,
                                );
                              },
                            ),
                          );
                        }),
                      ),
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
      backgroundColor: Colors.transparent,
      builder: (_) => CittaDetailSheet(citta: citta),
    );
  }

  void _showCetasikaDetail(BuildContext ctx, CetasikaModel cetasika) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
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
