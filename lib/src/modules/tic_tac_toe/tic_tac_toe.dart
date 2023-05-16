import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Consumer;
import '/src/modules/components/button.dart' show CustomeMaterialButton;
import '/src/helper/utils/size_config.dart' show ScreenSize;

import 'components/buttons.dart' show TicTacToeButtons;
import 'providers/provider.dart'
    show isAiProvider, isWiningProvider, tilesProvider;

class TicTacToeScreen extends StatelessWidget {
  const TicTacToeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: ScreenSize.width,
        height: ScreenSize.height,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Consumer(builder: (context, state, __) {
                final tiles = state.watch(tilesProvider);
                final youWin =
                    state.read(isWiningProvider.notifier).isWin(1, tiles.tiles);
                final youLost =
                    state.read(isWiningProvider.notifier).isWin(2, tiles.tiles);
                return Center(
                  child: Text(
                    youWin
                        ? 'You won!'
                        : youLost
                            ? 'You lost!'
                            : 'Your move',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              }),
            ),
            const TicTacToeButtons(),
            Expanded(
              flex: 1,
              child: Consumer(builder: (context, state, __) {
                final startWithAi = state.watch(isAiProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                        value: startWithAi,
                        onChanged: (_) =>
                            state.read(isAiProvider.notifier).toggle()),
                    // const SizedBox(width: 10),
                    Text(startWithAi ? 'AI' : 'Me',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    CustomeMaterialButton(
                      onPressed: () {
                        state
                            .read(tilesProvider.notifier)
                            .update(List.generate(9, (index) => 0));
                        state.invalidate(isWiningProvider);
                      },
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      w: 30,
                      h: 30,
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.restart_alt_outlined,
                          size: 15, color: Colors.white),
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
