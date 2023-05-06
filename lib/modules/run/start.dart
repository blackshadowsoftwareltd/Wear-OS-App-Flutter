import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:wear/wear.dart' show AmbientMode, WatchShape, WearShape;
import '/modules/utils/size_config.dart' show ScreenSize;
import '/modules/splash/splash.dart' show SplashScreen;

// import '../home/home.dart' show HomeScreen;
import 'providers/provider.dart' show ambientMoodProvider, deviceShapeProvider;

class StartApp extends ConsumerWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize().init(context);
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        ref.read(deviceShapeProvider.notifier).update(shape);
        return AmbientMode(builder: (context, mood, _) {
          ref.read(ambientMoodProvider.notifier).update(mood);
          // return const HomeScreen();
          return const SplashScreen();
        });
      },
    );
  }
}
