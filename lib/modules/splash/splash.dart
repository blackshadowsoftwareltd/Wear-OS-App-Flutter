import 'package:flutter/material.dart';

import 'components/bottom_round_custom_paint.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomPaint(
        size: const Size(100, 70),
        painter: BottomRoundCustomPaint(),
      )),
    );
  }
}
