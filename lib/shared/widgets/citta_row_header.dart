// lib/shared/widgets/citta_row_header.dart

import 'package:flutter/material.dart';
import '../../core/localization/localized_content.dart';
import '../../core/theme/vdp_theme.dart';
import '../../data/models/citta_model.dart';
import '../../l10n/l10n.dart';

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
    final localizedName = citta.localizedName(context);

    final double textFontSize = isLandscape ? 8.0 : 10.5;
    final double indexFontSize = isLandscape ? 8.0 : 10.0;
    final double symbolFontSize = isLandscape ? 9.0 : 12.0;
    final double vedanaFontSize = isLandscape ? 7.0 : 10.0;

    return Semantics(
      label: context.l10n.rowCittaSemantics(
        displayIndex,
        localizedName,
        citta.orderIndex,
        citta.bhumiGroup.localizedName(context.l10n),
        citta.vedana.localizedName(context.l10n),
        isSelected ? context.l10n.selected : context.l10n.tapForDetails,
      ),
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
            border: BorderDirectional(
              start: BorderSide(
                color: bhumiColor,
                width: isLandscape ? 3 : 4,
              ),
              bottom: BorderSide(
                color: useHighContrast
                    ? HCColors.textMuted.withValues(alpha: 0.2)
                    : Colors.grey.shade200,
                width: 0.5,
              ),
              end: isSelected
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
                    localizedName,
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

}