import 'package:flutter/material.dart';

class BottomRoundCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 71, 71, 71)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0016667, size.height * 0.1485714);
    path0.cubicTo(
        size.width * -0.0020833,
        size.height * 0.6410714,
        size.width * 0.2504167,
        size.height * 1.0039286,
        size.width * 0.5000000,
        size.height * 1.0014286);
    path0.cubicTo(
        size.width * 0.7506250,
        size.height * 0.9989286,
        size.width * 1.0002083,
        size.height * 0.6410714,
        size.width * 0.9991667,
        size.height * 0.1457143);
    path0.cubicTo(
        size.width * 0.9558333,
        size.height * 0.5696429,
        size.width * 0.7091667,
        size.height * 0.8260714,
        size.width * 0.5008333,
        size.height * 0.8271429);
    path0.cubicTo(
        size.width * 0.2922917,
        size.height * 0.8239286,
        size.width * 0.0431250,
        size.height * 0.5739286,
        size.width * 0.0016667,
        size.height * 0.1485714);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
