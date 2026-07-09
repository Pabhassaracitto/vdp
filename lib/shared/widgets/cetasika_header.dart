// lib/shared/widgets/cetasika_header.dart

import 'package:flutter/material.dart';
import '../../core/theme/vdp_theme.dart';
import '../../data/models/cetasika_model.dart';

class CetasikaHeader extends StatelessWidget {
  final CetasikaModel cetasika;
  final bool isSelected;
  final bool isDimmed;
  final double width;
  final double height;
  final int displayIndex;
  final bool useHighContrast;

  const CetasikaHeader({
    super.key,
    required this.cetasika,
    required this.isSelected,
    required this.isDimmed,
    required this.width,
    required this.height,
    required this.displayIndex,
    this.useHighContrast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final groupColor = _getGroupColor(cetasika.group);
    final groupSymbol = _getGroupSymbol(cetasika.group);

    final displayName = isLandscape
        ? _abbreviate(cetasika.nameShort)
        : cetasika.nameShort;

    final double nameFontSize = isLandscape ? 7.5 : 11.0;
    final double symbolFontSize = isLandscape ? 8.0 : 12.0;
    final double indexFontSize = isLandscape ? 7.0 : 9.0;

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
        child: SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected
                  ? groupColor.withValues(alpha: 0.25)
                  : (useHighContrast
                      ? HCColors.surface
                      : groupColor.withValues(alpha: 0.08)),
              border: Border(
                top: BorderSide(
                  color: groupColor,
                  width: isLandscape ? 2 : 3,
                ),
                right: BorderSide(
                  color: useHighContrast
                      ? HCColors.textMuted.withValues(alpha: 0.2)
                      : Colors.grey.shade200,
                  width: 0.5,
                ),
                bottom: isSelected
                    ? BorderSide(color: groupColor, width: 2)
                    : BorderSide.none,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: isLandscape ? 2 : 6,
                horizontal: isLandscape ? 1 : 2,
              ),
              child: Column(
                children: [
                  // Symbol nhóm
                  Text(
                    groupSymbol,
                    style: TextStyle(
                      fontSize: symbolFontSize,
                      color: useHighContrast
                          ? _hcGroupColor(groupColor)
                          : groupColor,
                    ),
                    textScaler: TextScaler.noScaling,
                  ),
                  SizedBox(height: isLandscape ? 1 : 4),

                  // Tên xoay dọc
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        displayName,
                        style: TextStyle(
                          fontSize: nameFontSize,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: useHighContrast
                              ? HCColors.textPrimary
                              : VdpColors.onBackground,
                          height: 1.1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.noScaling,
                      ),
                    ),
                  ),

                  // Số thứ tự
                  Text(
                    '$displayIndex',
                    style: TextStyle(
                      fontSize: indexFontSize,
                      color: useHighContrast
                          ? HCColors.textMuted
                          : groupColor.withValues(alpha: 0.7),
                    ),
                    textScaler: TextScaler.noScaling,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  VIẾT TẮT THÔNG MINH cho Landscape
  // ════════════════════════════════════════════════════════════

  String _abbreviate(String name) {
    if (name.length <= 5) return name;

    final words = name.split(RegExp(r'\s+'));

    if (words.length == 1) {
      return '${name.substring(0, 4.clamp(0, name.length))}.';
    }

    if (words.length == 2) {
      final second = words[1];
      final secondDisplay =
          second.length > 5 ? '${second.substring(0, 4)}.' : second;
      return '${words[0][0]}.$secondDisplay';
    }

    final inits =
        words.sublist(0, words.length - 1).map((w) => w[0]).join('.');
    final lastWord = words.last;
    final lastDisplay =
        lastWord.length > 4 ? '${lastWord.substring(0, 3)}.' : lastWord;
    return '$inits.$lastDisplay';
  }

  // ════════════════════════════════════════════════════════════
  //  HELPERS
  // ════════════════════════════════════════════════════════════

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

  Color _hcGroupColor(Color groupColor) {
    if (groupColor == VdpColors.sabbacittasadharana) {
      return HCColors.hcSabbacittasadharana;
    }
    if (groupColor == VdpColors.pakinnaka) return HCColors.hcPakinnaka;
    if (groupColor == VdpColors.cetasikaAkusala) {
      return HCColors.hcCetasikaAkusala;
    }
    if (groupColor == VdpColors.cetasikaSobhana) {
      return HCColors.hcCetasikaSobhana;
    }
    return HCColors.textPrimary;
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