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

    final double textFontSize = isLandscape ? 8.0 : 10.5;
    final double indexFontSize = isLandscape ? 8.0 : 10.0;
    final double symbolFontSize = isLandscape ? 9.0 : 12.0;
    final double vedanaFontSize = isLandscape ? 7.0 : 10.0;

    return Semantics(
      label: 'Tâm hàng $displayIndex: ${citta.nameVietnamese}, '
          'số gốc ${citta.orderIndex}, '
          'nhóm ${_getBhumiName(citta.bhumiGroup)}, '
          'thọ ${_getVedanaName(citta.vedana)}. '
          '${isSelected ? "Đang được chọn" : "Nhấn để xem chi tiết"}',
      button: true,
      selected: isSelected,
      excludeSemantics: false,
      child: SizedBox(
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
              left: BorderSide(
                color: bhumiColor,
                width: isLandscape ? 3 : 4,
              ),
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
              horizontal: isLandscape ? 4 : 8,
              vertical: isLandscape ? 0 : 2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Số thứ tự
                SizedBox(
                  width: isLandscape ? 18 : 24,
                  child: Text(
                    '$displayIndex',
                    style: TextStyle(
                      fontSize: indexFontSize,
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
                      fontSize: textFontSize,
                      height: 1.15,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: useHighContrast
                          ? HCColors.textPrimary
                          : VdpColors.onBackground,
                    ),
                    maxLines: isLandscape ? 1 : 2,
                    overflow: TextOverflow.ellipsis,
                    textScaler: TextScaler.noScaling,
                  ),
                ),

                // Symbol Bhumi + Vedana
                if (isLandscape)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        bhumiSymbol,
                        style: TextStyle(fontSize: symbolFontSize),
                        textScaler: TextScaler.noScaling,
                      ),
                      const SizedBox(width: 1),
                      Text(
                        vedanaSymbol,
                        style: TextStyle(fontSize: vedanaFontSize),
                        textScaler: TextScaler.noScaling,
                      ),
                    ],
                  )
                else
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        bhumiSymbol,
                        style: TextStyle(fontSize: symbolFontSize),
                        textScaler: TextScaler.noScaling,
                      ),
                      Text(
                        vedanaSymbol,
                        style: TextStyle(fontSize: vedanaFontSize),
                        textScaler: TextScaler.noScaling,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
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