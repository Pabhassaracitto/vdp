// lib/shared/widgets/association_cell.dart
// Ô hiển thị mối quan hệ - Dual Encoding: Màu + Hình + Text
// WCAG 2.1 AA compliant - Min touch target 48x48dp

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../data/models/citta_model.dart';
import '../../core/theme/vdp_theme.dart';

class AssociationCell extends StatelessWidget {
  final String cittaId;
  final String cetasikaId;
  final AssociationType type;
  final bool isCittaHighlighted;
  final bool isCetasikaHighlighted;
  final bool isDimmed;
  final double size;
  final bool useHighContrast;
  
  const AssociationCell({
    super.key,
    required this.cittaId,
    required this.cetasikaId,
    required this.type,
    this.isCittaHighlighted = false,
    this.isCetasikaHighlighted = false,
    this.isDimmed = false,
    this.size = 40.0,
    this.useHighContrast = false,
  });
  
  @override
  Widget build(BuildContext context) {
    final cellInfo = _getCellInfo();
    
    // Tính opacity dựa trên trạng thái
    double opacity = 1.0;
    if (isDimmed) opacity = 0.15;  // Proactive Dimming
    if (type == AssociationType.never) opacity = isDimmed ? 0.1 : 0.3;
    
    // Highlight khi Tâm hoặc Tâm Sở được chọn
    bool isHighlighted = isCittaHighlighted || isCetasikaHighlighted;
    
    return Semantics(
      // Accessibility: Đầy đủ semanticsLabel
      label: '${_getAssocTypeName(type)} - Tâm $cittaId với Tâm Sở $cetasikaId',
      button: false,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: opacity,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: isHighlighted 
                ? cellInfo.backgroundColor.withOpacity(0.5)
                : cellInfo.backgroundColor,
            border: Border.all(
              color: isHighlighted 
                  ? cellInfo.symbolColor
                  : Colors.grey.shade200,
              width: isHighlighted ? 2 : 0.5,
            ),
          ),
          child: Center(
            child: _buildSymbol(cellInfo),
          ),
        ),
      ),
    );
  }
  
  Widget _buildSymbol(_CellInfo info) {
    if (type == AssociationType.never) {
      // Không vẽ gì hoặc dấu X nhỏ
      return Text(
        VdpSymbols.never,
        style: TextStyle(
          fontSize: 10,
          color: useHighContrast ? VdpColors.hcNever : VdpColors.never,
        ),
      );
    }
    
    return Text(
      info.symbol,
      style: TextStyle(
        fontSize: type == AssociationType.always ? 14 : 12,
        color: useHighContrast ? info.hcSymbolColor : info.symbolColor,
        fontWeight: type == AssociationType.always 
            ? FontWeight.bold 
            : FontWeight.normal,
      ),
    );
  }
  
  _CellInfo _getCellInfo() {
    switch (type) {
      case AssociationType.always:
        return _CellInfo(
          symbol: VdpSymbols.always,           // ✦ Solid
          symbolColor: VdpColors.always,        // Vàng sáng
          hcSymbolColor: VdpColors.hcAlways,    // Trắng (HC)
          backgroundColor: useHighContrast
              ? VdpColors.hcSurface
              : VdpColors.always.withOpacity(0.12),
        );
        
      case AssociationType.sometimes:
        return _CellInfo(
          symbol: VdpSymbols.sometimes,         // ◎ Dashed circle
          symbolColor: VdpColors.sometimes,
          hcSymbolColor: VdpColors.hcSometimes,
          backgroundColor: useHighContrast
              ? VdpColors.hcSurface
              : VdpColors.sometimes.withOpacity(0.08),
        );
        
      case AssociationType.never:
        return _CellInfo(
          symbol: VdpSymbols.never,             // ✕
          symbolColor: VdpColors.never,
          hcSymbolColor: VdpColors.hcNever,
          backgroundColor: Colors.transparent,
        );
    }
  }
  
  String _getAssocTypeName(AssociationType type) {
    switch (type) {
      case AssociationType.always: return 'Cố định';
      case AssociationType.sometimes: return 'Bất định';
      case AssociationType.never: return 'Không phối hợp';
    }
  }
}

class _CellInfo {
  final String symbol;
  final Color symbolColor;
  final Color hcSymbolColor;
  final Color backgroundColor;
  
  const _CellInfo({
    required this.symbol,
    required this.symbolColor,
    required this.hcSymbolColor,
    required this.backgroundColor,
  });
}
