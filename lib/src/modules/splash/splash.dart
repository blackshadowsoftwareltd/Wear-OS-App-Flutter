import 'package:flutter/material.dart';
import '../../helper/utils/size_config.dart' show ScreenSize;

import 'components/black.dart' show BlackTxt;
import 'components/bottom_round_custom_paint.dart' show BottomRound;
import 'components/shadow.dart' show ShadowTxt;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: ScreenSize.width,
        height: ScreenSize.height,
        child:const Stack(
          alignment: Alignment.center,
          children:  [
            BottomRound(),
            BlackTxt(),
            ShadowTxt(),
          ],
        ),
      ),
    );
  }
}
