// lib/shared/widgets/matrix_corner_header.dart

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
        isHighContrast ? HCColors.border : Colors.white38;

    // FIX: Semantics đặt NGOÀI cùng, bao SizedBox tĩnh.
    // KHÔNG đặt Semantics bên trong CustomPaint hay Stack có Positioned động.
    return Semantics(
      label: 'Góc bảng: hàng là Tâm chiều dọc, cột là Tâm Sở chiều ngang',
      // header: true thay vì button — phù hợp ngữ nghĩa hơn
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
              // FIX: painter (background) thay vì foregroundPainter.
              // foregroundPainter vẽ SAU child → đường chéo đè lên chữ.
              // painter vẽ TRƯỚC child → chữ nổi trên đường chéo.
              painter: _DiagonalLinePainter(color: lineColor),
              child: _CornerContent(
                textColor: textColor,
                height: height,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Nội dung 2 góc — widget riêng để dễ test và tránh rebuild không cần thiết.
class _CornerContent extends StatelessWidget {
  final Color textColor;
  final double height;

  const _CornerContent({
    required this.textColor,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Padding tính theo height thực để chữ không bao giờ đè đường chéo.
    // Góc trên-phải và dưới-trái cách đường chéo ít nhất 6px.
    const double edgePad = 6.0;

    return Stack(
      children: [
        // Góc TRÊN-PHẢI: "Tâm Sở →"
        Positioned(
          top: edgePad,
          right: edgePad,
          child: _CornerLabel(
            line1: 'Tâm Sở',
            line2: '→',
            color: textColor,
            align: TextAlign.right,
          ),
        ),

        // Góc DƯỚI-TRÁI: "Tâm ↓"
        Positioned(
          bottom: edgePad,
          left: edgePad,
          child: _CornerLabel(
            line1: 'Tâm',
            line2: '↓',
            color: textColor,
            align: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

class _CornerLabel extends StatelessWidget {
  final String line1;
  final String line2;
  final Color color;
  final TextAlign align;

  const _CornerLabel({
    required this.line1,
    required this.line2,
    required this.color,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    // FIX: Dùng textScaler: TextScaler.noScaling để kích thước label
    // KHÔNG thay đổi theo text scaling của hệ thống.
    // Điều này ngăn label tràn ra ngoài ô góc cố định.
    const textScaler = TextScaler.noScaling;
    const double fontSize = 10.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: align == TextAlign.right
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          line1,
          textScaler: textScaler,
          textAlign: align,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            height: 1.2,
            letterSpacing: 0.2,
          ),
        ),
        Text(
          line2,
          textScaler: textScaler,
          textAlign: align,
          style: TextStyle(
            color: color.withValues(alpha: 0.85),
            // Icon mũi tên to hơn chữ 1px cho dễ đọc
            fontSize: fontSize + 1,
            height: 1.0,
          ),
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