import 'package:flutter/material.dart';
import 'package:space_app/color.dart';
import 'dart:math' as math;

class RightTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = yellow
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    final double width = size.width;
    final double height = size.height;
    BorderRadius borderRadius =
        const BorderRadius.only(bottomLeft: Radius.circular(20));
    final Rect rect2 = Rect.fromLTWH(25, -60, width + 20, height + 20);
    final RRect outer = borderRadius.toRRect(rect2);
    canvas.rotate(math.pi / 4);

    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
