// lib/shared/widgets/cetasika_header.dart
// Header cột dọc cho mỗi Tâm Sở trong Bảng Tương Ưng
// Hiển thị thẳng đứng để tiết kiệm không gian

import 'package:flutter/material.dart';
import '../../data/models/cetasika_model.dart';
import '../../core/theme/vdp_theme.dart';

class CetasikaHeader extends StatelessWidget {
  final CetasikaModel cetasika;
  final bool isSelected;
  final bool isDimmed;
  final double width;
  final double height;
  final int displayIndex;

  const CetasikaHeader({
    super.key,
    required this.cetasika,
    required this.isSelected,
    required this.isDimmed,
    required this.width,
    required this.height,
    required this.displayIndex,
  });

  @override
  Widget build(BuildContext context) {
    final groupColor = _getGroupColor(cetasika.group);
    final groupSymbol = _getGroupSymbol(cetasika.group);

    return Semantics(
      label: 'Tâm Sở ${cetasika.nameVietnamese} (${cetasika.namePali}), '
          'nhóm ${_getGroupName(cetasika.group)}. '
          '${isSelected ? "Đang được chọn" : ""}'
          '${isDimmed ? "Bị mờ do xung đột" : ""}'
          ' Nhấn để xem chi tiết',
      button: true,
      selected: isSelected,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isDimmed ? 0.25 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: isSelected
                ? groupColor.withOpacity(0.25)
                : groupColor.withOpacity(0.08),
            border: Border(
              top: BorderSide(color: groupColor, width: 3),
              right: BorderSide(color: Colors.grey.shade200, width: 0.5),
              bottom: isSelected
                  ? BorderSide(color: groupColor, width: 2)
                  : BorderSide.none,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          child: Column(
            children: [
              // Symbol nhóm
              Text(
                groupSymbol,
                style: TextStyle(fontSize: 12, color: groupColor),
              ),
              const SizedBox(height: 4),

              // Tên xoay dọc
              Expanded(
                child: RotatedBox(
                  quarterTurns: 3, // Xoay 90 độ ngược chiều kim đồng hồ
                  child: Text(
                    cetasika.nameShort,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: VdpColors.onBackground,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              // Số thứ tự
              Text(
                '$displayIndex',
                style: TextStyle(
                  fontSize: 9,
                  color: groupColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getGroupColor(CetasikaGroup group) {
    switch (group) {
      case CetasikaGroup.sabbacittasadharana:
        return VdpColors.sabbacittasadharana;
      case CetasikaGroup.pakinnaka:
        return VdpColors.pakinnaka;
      case CetasikaGroup.akusala:
        return VdpColors.cetasikaAkusala;
      case CetasikaGroup.sobhana:
        return VdpColors.cetasikaSobhana;
    }
  }

  String _getGroupSymbol(CetasikaGroup group) {
    switch (group) {
      case CetasikaGroup.sabbacittasadharana:
        return VdpSymbols.sabbacittasadharana;
      case CetasikaGroup.pakinnaka:
        return VdpSymbols.pakinnaka;
      case CetasikaGroup.akusala:
        return VdpSymbols.cetasikaAkusala;
      case CetasikaGroup.sobhana:
        return VdpSymbols.cetasikaSobhana;
    }
  }

  String _getGroupName(CetasikaGroup group) {
    switch (group) {
      case CetasikaGroup.sabbacittasadharana:
        return '7 Tâm Sở Biến Hành';
      case CetasikaGroup.pakinnaka:
        return '6 Tâm Sở Biệt Cảnh';
      case CetasikaGroup.akusala:
        return '14 Tâm Sở Bất Thiện';
      case CetasikaGroup.sobhana:
        return '25 Tâm Sở Tịnh Hảo';
    }
  }
}
