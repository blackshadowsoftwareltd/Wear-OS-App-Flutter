import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Consumer, ConsumerWidget, WidgetRef;

import '../../run/providers/provider.dart'
    show ambientMoodProvider, deviceShapeProvider, rotarProvider;

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shape = ref.watch(deviceShapeProvider);
    final mood = ref.watch(ambientMoodProvider);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Shape : ${shape.name}'),
          Text('Ambient : ${mood.name}'),
          Consumer(builder: (context, state, __) {
            final rotar = ref.watch(rotarProvider);

            return Text('Rotar : $rotar');
          })
        ],
      ),
    );
  }
}
