import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../run/providers/provider.dart'
    show ambientMoodProvider, deviceShapeProvider;

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shape = ref.watch(deviceShapeProvider);
    final mood = ref.watch(ambientMoodProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text(shape.name), Text(mood.name)],
    );
  }
}
