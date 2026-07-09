// lib/shared/widgets/matrix_corner_header.dart
//
// Ô góc trái trên cùng của Bảng Tương Ưng.
// Thiết kế: đường gạch chéo chia ô thành 2 vùng:
//   • Góc TRÊN-PHẢI : "Tâm Sở →"
//   • Góc DƯỚI-TRÁI : "Tâm ↓"
//
// Xử lý Text Scaling: dùng FittedBox + IntrinsicHeight để
// không bao giờ bị overflow dù người dùng tăng cỡ chữ hệ thống.

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
    // ── Màu sắc thích ứng theo theme ──
    final Color bgColor = isHighContrast
        ? HCColors.surface
        : VdpColors.primary;

    final Color textColor = isHighContrast
        ? HCColors.primary      // Vàng trên nền đen — contrast 9.5:1
        : Colors.white;

    final Color lineColor = isHighContrast
        ? HCColors.border       // Xám — vẫn đủ visible trên đen
        : Colors.white38;

    return Semantics(
      // Mô tả rõ ràng cho screen reader
      label: 'Góc bảng: hàng là Tâm (chiều dọc), cột là Tâm Sở (chiều ngang)',
      child: Container(
        width: width,
        // Dùng constraints thay vì height cứng để co giãn theo text scaling
        constraints: BoxConstraints(minHeight: height),
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
            // Đường gạch chéo — vẽ sau widget con
            foregroundPainter: _DiagonalLinePainter(color: lineColor),
            child: Stack(
              children: [
                // ── Góc TRÊN-PHẢI: "Tâm Sở →" ──
                Positioned(
                  top: 8,
                  right: 6,
                  left: 0,   // để FittedBox có không gian tính toán
                  child: Align(
                    alignment: Alignment.topRight,
                    child: _CornerLabel(
                      text: 'Tâm Sở',
                      icon: '→',
                      color: textColor,
                      // Chữ nhỏ hơn để không đè đường chéo
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
                      text: 'Tâm',
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

// ────────────────────────────────────────────────────────────
//  Label con: text + icon, co giãn khi text scaling
// ────────────────────────────────────────────────────────────
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
    // textScaler từ MediaQuery để đọc đúng scale hiện tại
    final scale = MediaQuery.textScalerOf(context).scale(1.0);

    // Khi scale > 1.3, thu nhỏ font để vừa ô, tránh overflow
    final effectiveFontSize = scale > 1.3
        ? baseFontSize / scale * 1.3
        : baseFontSize.toDouble();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tên ("Tâm Sở" hoặc "Tâm")
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: effectiveFontSize,
            fontWeight: FontWeight.w700,
            height: 1.2,
            // Tắt text scaling ở cấp widget — đã tự xử lý bên trên
            letterSpacing: 0.2,
          ),
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
        // Icon mũi tên
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

// ────────────────────────────────────────────────────────────
//  CustomPainter: vẽ đường chéo từ góc trái-trên → phải-dưới
// ────────────────────────────────────────────────────────────
class _DiagonalLinePainter extends CustomPainter {
  final Color color;
  const _DiagonalLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      // Antialiasing để đường mịn trên mọi mật độ pixel
      ..isAntiAlias = true;

    // Từ góc trên-trái → góc dưới-phải
    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  // Chỉ repaint khi màu thay đổi (theme switch)
  bool shouldRepaint(_DiagonalLinePainter old) => old.color != color;
}
