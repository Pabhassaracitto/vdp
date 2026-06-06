// lib/shared/widgets/citta_row_header.dart
// Header hàng ngang cho mỗi Tâm trong Ma Trận
// Dual Encoding: Màu theo Bhumi + Hình theo Vedana

import 'package:flutter/material.dart';
import '../../data/models/citta_model.dart';
import '../../core/theme/vdp_theme.dart';

class CittaRowHeader extends StatelessWidget {
  final CittaModel citta;
  final bool isSelected;
  final double width;
  final double height;
  
  const CittaRowHeader({
    super.key,
    required this.citta,
    required this.isSelected,
    required this.width,
    required this.height,
  });
  
  @override
  Widget build(BuildContext context) {
    final bhumiColor = citta.bhumiGroup.name.bhumiColor;
    final bhumiSymbol = citta.bhumiGroup.name.bhumiSymbol;
    final vedanaSymbol = _getVedanaSymbol(citta.vedana);
    
    return Semantics(
      label: 'Tâm số ${citta.orderIndex}: ${citta.nameVietnamese}, '
             'nhóm ${_getBhumiName(citta.bhumiGroup)}, '
             'thọ ${_getVedanaName(citta.vedana)}. '
             '${isSelected ? "Đang được chọn" : "Nhấn để xem chi tiết"}',
      button: true,
      selected: isSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected 
              ? bhumiColor.withOpacity(0.25)
              : bhumiColor.withOpacity(0.08),
          border: Border(
            left: BorderSide(color: bhumiColor, width: 4),
            bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
            right: isSelected 
                ? BorderSide(color: bhumiColor, width: 2)
                : BorderSide.none,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          children: [
            // Số thứ tự
            SizedBox(
              width: 24,
              child: Text(
                '${citta.orderIndex}',
                style: TextStyle(
                  fontSize: 10,
                  color: bhumiColor.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            
            // Tên Tâm
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    citta.nameVietnamese,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: VdpColors.onBackground,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            
            // Dual Encoding Symbols
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bhumiSymbol, style: const TextStyle(fontSize: 12)),
                Text(vedanaSymbol, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ],
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
