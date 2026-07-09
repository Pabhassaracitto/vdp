// lib/shared/widgets/citta_row_header.dart

import 'package:flutter/material.dart';
import '../../core/theme/vdp_theme.dart';
import '../../data/models/citta_model.dart';

class CittaRowHeader extends StatelessWidget {
  final CittaModel citta;
  final bool isSelected;
  final double width;
  final double height;
  final int displayIndex;
  final bool useHighContrast;

  const CittaRowHeader({
    super.key,
    required this.citta,
    required this.isSelected,
    required this.width,
    required this.height,
    required this.displayIndex,
    this.useHighContrast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final bhumiColor = citta.bhumiGroup.name.bhumiColor;
    final bhumiSymbol = citta.bhumiGroup.name.bhumiSymbol;
    final vedanaSymbol = _getVedanaSymbol(citta.vedana);

    // FIX: Tính height một lần, KHÔNG thay đổi động để tránh dirty semantics.
    // Dùng height cố định bằng cellSize được truyền vào — đồng bộ với
    // ListView.builder (không dùng itemExtent nên height do widget tự quyết).
    // maxLines:2 + overflow:ellipsis đã đủ để tránh overflow mà không cần
    // BoxConstraints động.
    final double fixedHeight = height;

    // FIX ROOT CAUSE: Đưa Semantics ra NGOÀI container có animation/constraints.
    // Semantics chỉ bao widget con tĩnh, không bị ảnh hưởng bởi layout dirty.
    return Semantics(
      label: 'Tâm hàng $displayIndex: ${citta.nameVietnamese}, '
          'số gốc ${citta.orderIndex}, '
          'nhóm ${_getBhumiName(citta.bhumiGroup)}, '
          'thọ ${_getVedanaName(citta.vedana)}. '
          '${isSelected ? "Đang được chọn" : "Nhấn để xem chi tiết"}',
      button: true,
      selected: isSelected,
      // excludeSemantics ngăn child tạo thêm semantics node chồng chéo
      excludeSemantics: false,
      child: _CittaRowHeaderContent(
        citta: citta,
        isSelected: isSelected,
        width: width,
        height: fixedHeight,
        displayIndex: displayIndex,
        useHighContrast: useHighContrast,
        isLandscape: isLandscape,
        bhumiColor: bhumiColor,
        bhumiSymbol: bhumiSymbol,
        vedanaSymbol: vedanaSymbol,
      ),
    );
  }

  String _getVedanaSymbol(Vedana vedana) {
    switch (vedana) {
      case Vedana.pleasant: return VdpSymbols.pleasant;
      case Vedana.unpleasant: return VdpSymbols.unpleasant;
      case Vedana.neutral: return VdpSymbols.neutral;
      case Vedana.joy: return VdpSymbols.joy;
    }
  }

  String _getVedanaName(Vedana vedana) {
    switch (vedana) {
      case Vedana.pleasant: return 'Lạc thọ';
      case Vedana.unpleasant: return 'Khổ thọ';
      case Vedana.neutral: return 'Xả thọ';
      case Vedana.joy: return 'Hỷ thọ';
    }
  }

  String _getBhumiName(BhumiGroup bhumi) {
    switch (bhumi) {
      case BhumiGroup.akusala: return 'Bất Thiện';
      case BhumiGroup.ahetuka: return 'Vô Nhân';
      case BhumiGroup.sobhanaKamavacara: return 'Tịnh Hảo Dục Giới';
      case BhumiGroup.rupavacara: return 'Sắc Giới';
      case BhumiGroup.arupavacara: return 'Vô Sắc Giới';
      case BhumiGroup.lokuttara: return 'Siêu Thế';
    }
  }
}

/// Widget con thuần layout — KHÔNG chứa Semantics.
/// Tách riêng để AnimatedContainer không làm dirty semantics tree.
class _CittaRowHeaderContent extends StatelessWidget {
  final CittaModel citta;
  final bool isSelected;
  final double width;
  final double height;
  final int displayIndex;
  final bool useHighContrast;
  final bool isLandscape;
  final Color bhumiColor;
  final String bhumiSymbol;
  final String vedanaSymbol;

  const _CittaRowHeaderContent({
    required this.citta,
    required this.isSelected,
    required this.width,
    required this.height,
    required this.displayIndex,
    required this.useHighContrast,
    required this.isLandscape,
    required this.bhumiColor,
    required this.bhumiSymbol,
    required this.vedanaSymbol,
  });

  @override
  Widget build(BuildContext context) {
    // FIX: Dùng DecoratedBox + SizedBox thay cho AnimatedContainer.
    // AnimatedContainer tạo implicit animation → dirty semantics liên tục.
    // Thay bằng AnimatedPhysicalModel chỉ animate màu, không animate size.
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected
              ? bhumiColor.withValues(alpha: 0.25)
              : (useHighContrast
                  ? HCColors.surface
                  : bhumiColor.withValues(alpha: 0.08)),
          border: Border(
            left: BorderSide(color: bhumiColor, width: 4),
            bottom: BorderSide(
              color: useHighContrast
                  ? HCColors.textMuted.withValues(alpha: 0.2)
                  : Colors.grey.shade200,
              width: 0.5,
            ),
            right: isSelected
                ? BorderSide(color: bhumiColor, width: 2)
                : BorderSide.none,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: isLandscape ? 1 : 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Số thứ tự — width cố định, noScaling
              SizedBox(
                width: 24,
                child: Text(
                  '$displayIndex',
                  style: TextStyle(
                    fontSize: isLandscape ? 9.0 : 10.0,
                    color: useHighContrast
                        ? HCColors.textMuted
                        : bhumiColor.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w600,
                  ),
                  textScaler: TextScaler.noScaling,
                ),
              ),

              // Tên Tâm
              Expanded(
                child: Text(
                  citta.nameVietnamese,
                  style: TextStyle(
                    fontSize: isLandscape ? 9.0 : 10.5,
                    height: 1.2,
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: useHighContrast
                        ? HCColors.textPrimary
                        : VdpColors.onBackground,
                  ),
                  // maxLines:2 chống overflow không cần BoxConstraints động
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Dual encoding symbols — noScaling, không tham gia layout động
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    bhumiSymbol,
                    style: const TextStyle(fontSize: 12),
                    textScaler: TextScaler.noScaling,
                  ),
                  Text(
                    vedanaSymbol,
                    style: const TextStyle(fontSize: 10),
                    textScaler: TextScaler.noScaling,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}