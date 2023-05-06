import 'package:flutter/material.dart';
import '/modules/constants/duration/duration.dart' show duration1;
import '/modules/utils/size_config.dart' show ScreenSize;

class ShadowTxt extends StatelessWidget {
  const ShadowTxt({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration1,
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.fastOutSlowIn,
      builder: (context, double v, child) {
        return Transform.translate(
            offset: Offset(
                0, (v * ScreenSize.height * .6) - ScreenSize.height * .6),
            child: Opacity(opacity: v, child: child!));
      },
      child: SizedBox(
        height: ScreenSize.height * .3,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: ScreenSize.width * .55,
            child: Image.asset('assets/shadow.png', fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
