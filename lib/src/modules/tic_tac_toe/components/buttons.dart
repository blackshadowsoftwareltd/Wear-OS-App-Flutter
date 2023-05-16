import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import '/src/modules/tic_tac_toe/providers/provider.dart'
    show isAiProvider, isWiningProvider, tilesProvider;

class TicTacToeButtons extends ConsumerWidget {
  const TicTacToeButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiles = ref.watch(tilesProvider);
    final tilesNotifier = ref.watch(tilesProvider.notifier);
    return Expanded(
      flex: 5,
      child: AspectRatio(
        aspectRatio: 1,
        child: GridView.builder(
          itemCount: tiles.tiles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            final isEnable = tiles.tiles[index] == 0;
            final enable = ref.watch(isWiningProvider.notifier).count != 0;
            final isSelected = tiles.tiles[index] == 1;

            return Padding(
              padding: const EdgeInsets.all(2),
              child: OutlinedButton(
                onPressed: isEnable && enable
                    ? () {
                        List<int> list = tiles.tiles;
                        list[index] = 1;
                        tilesNotifier.update(list);

                        ref.read(isAiProvider.notifier).runAi();
                      }
                    : null,
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    elevation: 5,
                    padding: EdgeInsets.zero,
                    shadowColor: Colors.black26,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(isEnable
                    ? ''
                    : isSelected
                        ? 'X'
                        : 'O'),
              ),
            );
          },
        ),
      ),
    );
  }
}
