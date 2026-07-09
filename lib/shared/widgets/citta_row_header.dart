// lib/shared/widgets/citta_row_header.dart
// Header hàng ngang cho mỗi Tâm trong Bảng Tương Ưng
// FIX M2-T7: Thêm IntrinsicHeight + flexible layout để tránh
//            Bottom overflowed khi Text Scaling cao

import 'package:flutter/material.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/citta_model.dart';

class CittaRowHeader extends StatelessWidget {
  final CittaModel citta;
  final bool isSelected;
  final double width;

  /// [height] là chiều cao MẶC ĐỊNH (khi scale = 1.0).
  /// Widget sẽ tự mở rộng nếu text cần thêm không gian.
  final double height;
  final int displayIndex;
  final bool useHighContrast; // M1-T4: HC mode flag

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

    // Tính chiều cao tối thiểu thích ứng với text scaling
    final textScale = MediaQuery.textScalerOf(context).scale(1.0);
    // Cho phép ô cao hơn tối đa 1.5× so với mặc định khi scale lớn
    final double minHeight = height;
    final double maxHeight = height * textScale.clamp(1.0, 1.5);

    return Semantics(
      label: 'Tâm hàng $displayIndex: ${citta.nameVietnamese}, '
          'số gốc ${citta.orderIndex}, '
          'nhóm ${_getBhumiName(citta.bhumiGroup)}, '
          'thọ ${_getVedanaName(citta.vedana)}. '
          '${isSelected ? "Đang được chọn" : "Nhấn để xem chi tiết"}',
      button: true,
      selected: isSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: width,
        // ── FIX: dùng constraints thay vì height cứng ──
        constraints: BoxConstraints(
          minHeight: minHeight,
          maxHeight: maxHeight,
        ),
        decoration: BoxDecoration(
          // M1-T4: HC fix — nền tối khi HC, không dùng màu bhumi mờ
          color: isSelected
              ? bhumiColor.withValues(alpha: 0.25)
              : (useHighContrast
                  ? HCColors.surface
                  : bhumiColor.withValues(alpha: 0.08)),
          border: Border(
            left: BorderSide(color: bhumiColor, width: 4),
            bottom: BorderSide(
              // M1-T4: HC fix — border rõ trên nền tối
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
        // ── FIX: padding linh hoạt, giảm khi landscape ──
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: isLandscape ? 1 : 2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Số thứ tự: chiều rộng cố định, không co giãn ──
            SizedBox(
              width: 24,
              child: Text(
                '$displayIndex',
                style: TextStyle(
                  fontSize: isLandscape ? 9.0 : 10.0,
                  // M1-T4: HC fix — số thứ tự rõ trên nền tối
                  color: useHighContrast
                      ? HCColors.textMuted
                      : bhumiColor.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                ),
                // Không scale quá mức để vừa SizedBox
                textScaler: TextScaler.noScaling,
              ),
            ),

            // ── Tên Tâm: Expanded để chiếm không gian còn lại ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tên tiếng Việt — cho phép xuống hàng khi text lớn
                  Text(
                    citta.nameVietnamese,
                    style: TextStyle(
                      // fontSize cơ bản — để hệ thống scale bình thường
                      fontSize: isLandscape ? 9.0 : 10.5,
                      height: 1.2,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      // M1-T4: HC fix — màu trắng trên nền tối
                      color: useHighContrast
                          ? HCColors.textPrimary
                          : VdpColors.onBackground,
                    ),
                    // ── FIX: maxLines 2 thay vì 1 để tránh overflow ──
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // ── Dual Encoding symbols: không scale, cố định ──
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
    );
  }

  String _getVedanaSymbol(Vedana vedana) {
    switch (vedana) {
      case Vedana.pleasant:
        return VdpSymbols.pleasant;
      case Vedana.unpleasant:
        return VdpSymbols.unpleasant;
      case Vedana.neutral:
        return VdpSymbols.neutral;
      case Vedana.joy:
        return VdpSymbols.joy;
    }
  }

  String _getVedanaName(Vedana vedana) {
    switch (vedana) {
      case Vedana.pleasant:
        return 'Lạc thọ';
      case Vedana.unpleasant:
        return 'Khổ thọ';
      case Vedana.neutral:
        return 'Xả thọ';
      case Vedana.joy:
        return 'Hỷ thọ';
    }
  }

  String _getBhumiName(BhumiGroup bhumi) {
    switch (bhumi) {
      case BhumiGroup.akusala:
        return 'Bất Thiện';
      case BhumiGroup.ahetuka:
        return 'Vô Nhân';
      case BhumiGroup.sobhanaKamavacara:
        return 'Tịnh Hảo Dục Giới';
      case BhumiGroup.rupavacara:
        return 'Sắc Giới';
      case BhumiGroup.arupavacara:
        return 'Vô Sắc Giới';
      case BhumiGroup.lokuttara:
        return 'Siêu Thế';
    }
  }
}
