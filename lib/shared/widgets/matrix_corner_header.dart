// lib/shared/widgets/matrix_corner_header.dart
//
// Ô góc trái trên cùng của Bảng Tương Ưng.
// Đường gạch chéo chia ô thành 2 vùng:
//   • Góc TRÊN-PHẢI : "Tâm Sở →"  (hướng đọc cột — sang phải)
//   • Góc DƯỚI-TRÁI : "Tâm ↓"    (hướng đọc hàng — xuống dưới)

import 'package:flutter/material.dart';
import '../../core/theme/vdp_theme.dart';

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
        isHighContrast ? HCColors.border : Colors.white54;

    return Semantics(
      label: 'Góc bảng: hàng là Tâm chiều dọc, cột là Tâm Sở chiều ngang',
      header: true,
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
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
              painter: _DiagonalLinePainter(color: lineColor),
              child: Stack(
                children: [
                  // ═══ Góc TRÊN-PHẢI: "Tâm Sở →" ═══
                  // Đặt trong vùng tam giác trên-phải của đường chéo
                  Positioned(
                    top: 10,
                    right: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Tâm Sở',
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '→',
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            color: textColor.withValues(alpha: 0.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ═══ Góc DƯỚI-TRÁI: "Tâm ↓" ═══
                  // Đặt trong vùng tam giác dưới-trái của đường chéo
                  Positioned(
                    bottom: 10,
                    left: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tâm',
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '↓',
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            color: textColor.withValues(alpha: 0.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Vẽ đường chéo từ góc trên-trái → góc dưới-phải
class _DiagonalLinePainter extends CustomPainter {
  final Color color;
  const _DiagonalLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
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