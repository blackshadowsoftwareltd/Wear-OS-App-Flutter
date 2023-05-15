import 'package:flutter/material.dart';
import '../../../helper/constants/duration/duration.dart' show duration1200;
import '../../../helper/utils/size_config.dart' show ScreenSize;

class BlackTxt extends StatelessWidget {
  const BlackTxt({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration1200,
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeInExpo,
      builder: (context, double v, child) {
        return Opacity(opacity: v, child: child!);
      },
      child: SizedBox(
        height: ScreenSize.height * .3,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: ScreenSize.width * .45,
            child: Image.asset('assets/black.png', fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
