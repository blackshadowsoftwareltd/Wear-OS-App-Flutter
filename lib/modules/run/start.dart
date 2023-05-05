import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:wear/wear.dart' show WatchShape, WearShape;

import '../home/views/home.dart' show HomeScreen;

class StartApp extends ConsumerWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return const HomeScreen();
      },
    );
  }
}
