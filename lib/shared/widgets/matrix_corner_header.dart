// lib/shared/widgets/matrix_corner_header.dart
//
// Ô góc trái trên cùng của Bảng Tương Ưng.
// Thiết kế: đường gạch chéo chia ô thành 2 vùng:
//   • Góc TRÊN-PHẢI : "Tâm Sở →"
//   • Góc DƯỚI-TRÁI : "Tâm ↓"

import 'package:flutter/material.dart';

import '../../core/theme/vdp_theme.dart';
import '../../l10n/l10n.dart';

class MatrixCornerHeader extends StatelessWidget {
  final double width;
  final double height;
  final bool isHighContrast;

  const MatrixCornerHeader({
    super.key,
    required this.width,
    required this.height,
    required this.isHighContrast,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        isHighContrast ? HCColors.surface : VdpColors.primary;
    final Color textColor =
        isHighContrast ? HCColors.primary : Colors.white;
    final Color lineColor =
        isHighContrast ? HCColors.border : Colors.white38;

    return Semantics(
      label: context.l10n.matrixCornerSemantics,
      header: true,
      child: Container(
        // FIX (cột Tâm bị ẩn): phải khoá CHÍNH XÁC width × height.
        //
        // Stack bên dưới chỉ chứa children dạng Positioned (không có child
        // nào tham gia việc định kích thước), nên RenderStack tự co giãn theo
        // `constraints.biggest`. Với `minHeight` không có max, ô góc này phình
        // ra chiếm trọn chiều cao còn lại của cột trái, ép ListView danh sách
        // Tâm phía dưới về 0px → cột Tâm biến mất hoàn toàn.
        //
        // Khoá tight còn giữ ô góc thẳng hàng với hàng header Tâm Sở bên phải
        // (bên đó dùng SizedBox(height: cetasikaHeaderHeight) — cũng là tight).
        constraints: BoxConstraints.tightFor(width: width, height: height),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            right: BorderSide(
              color: isHighContrast ? HCColors.border : Colors.white24,
              width: 1,
            ),
            bottom: BorderSide(
              color: isHighContrast ? HCColors.border : Colors.white24,
              width: 1,
            ),
          ),
        ),
        child: ClipRect(
          child: CustomPaint(
            foregroundPainter: _DiagonalLinePainter(color: lineColor),
            child: Stack(
              children: [
                // ── Góc TRÊN-PHẢI: "Tâm Sở →" ──
                Positioned(
                  top: 8,
                  right: 6,
                  left: 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: _CornerLabel(
                      text: context.l10n.cetasika,
                      icon: '→',
                      color: textColor,
                      baseFontSize: 10,
                    ),
                  ),
                ),

                // ── Góc DƯỚI-TRÁI: "Tâm ↓" ──
                Positioned(
                  bottom: 8,
                  left: 6,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: _CornerLabel(
                      text: context.l10n.citta,
                      icon: '↓',
                      color: textColor,
                      baseFontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CornerLabel extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final double baseFontSize;

  const _CornerLabel({
    required this.text,
    required this.icon,
    required this.color,
    required this.baseFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(1.0);
    final effectiveFontSize =
        scale > 1.3 ? baseFontSize / scale * 1.3 : baseFontSize;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: effectiveFontSize,
            fontWeight: FontWeight.w700,
            height: 1.2,
            letterSpacing: 0.2,
          ),
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
        Text(
          icon,
          style: TextStyle(
            color: color.withValues(alpha: 0.85),
            fontSize: effectiveFontSize + 1,
            height: 1.0,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}

class _DiagonalLinePainter extends CustomPainter {
  final Color color;
  const _DiagonalLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(_DiagonalLinePainter old) => old.color != color;
}