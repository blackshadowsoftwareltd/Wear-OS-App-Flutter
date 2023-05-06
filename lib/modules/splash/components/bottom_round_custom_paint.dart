import 'package:flutter/material.dart';
import '/modules/constants/duration/duration.dart' show duration800;
import '/modules/utils/size_config.dart' show ScreenSize;

class BottomRound extends StatelessWidget {
  const BottomRound({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration800,
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeInOutBack,
      builder: (context, double v, child) {
        return Transform.translate(
            offset: Offset(
                0, -(v * ScreenSize.height * .15) + ScreenSize.height * .15),
            child: Opacity(
                opacity: v < .05
                    ? 0
                    : v > 1
                        ? 1
                        : v,
                child: child!));
      },
      child: SizedBox(
        width: ScreenSize.width * .7,
        height: ScreenSize.width * .7,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            size: Size(ScreenSize.width * .7, ScreenSize.width * .35),
            painter: _BottomRoundCustomPaint(),
          ),
        ),
      ),
    );
  }
}

class _BottomRoundCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.grey.shade800
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
