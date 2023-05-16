import 'package:flutter_riverpod/flutter_riverpod.dart'
    show FamilyNotifier, Notifier, NotifierProvider, NotifierProviderFamily;
import '/src/modules/tic_tac_toe/models/model.dart'
    show TicTacList, TicTacToeModel;

final isAiProvider = NotifierProvider<_IsAi, bool>(_IsAi.new);

class _IsAi extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;

  void runAi() async {
    final tiles = ref.read(tilesProvider);
    final tilesNotifier = ref.read(tilesProvider.notifier);
    final isWiningNotifier = ref.read(isWiningProvider.notifier);
    await Future.delayed(const Duration(milliseconds: 500));

    int? winning;
    int? blocking;
    int? normal;
    for (int i = 0; i < 9; i++) {
      int val = tiles.tiles[i];
      if (val > 0) {
        continue;
      }
      List<int> future = [...tiles.tiles]..[i] = 2;
      if (isWiningNotifier.isWin(2, future)) {
        winning = i;
      }
      future[i] = 1;
      if (isWiningNotifier.isWin(1, future)) {
        blocking = i;
      }
      normal = i;
    }
    final move = winning ?? blocking ?? normal;
    if (move != null) {
      List<int> newList = tiles.tiles;
      newList[move] = 2;
      tilesNotifier.update(newList);
    }
  }
}

final isWiningProvider = NotifierProvider<_Wining, bool>(_Wining.new);

class _Wining extends Notifier<bool> {
  int count = -2;
  @override
  bool build() {
    count = -2;
    return false;
  }

  void update(bool v) => state = v;

  bool isWin(int who, List<int> tiles) {
    final result = (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
        (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
        (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
        (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
        (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
        (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
        (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
        (tiles[2] == who && tiles[5] == who && tiles[8] == who);
    if (result) count++;
    return result;
  }
}

final tilesProvider = NotifierProvider<_Tiles, TicTacList>(_Tiles.new);

class _Tiles extends Notifier<TicTacList> {
  @override
  TicTacList build() => TicTacList(tiles: List.generate(9, (index) => 0));

  void update(List<int> tiles) => state = TicTacList(tiles: tiles);
}

final startWithProvider =
    NotifierProviderFamily<_StartWith, TicTacToeModel, bool>(_StartWith.new);

class _StartWith extends FamilyNotifier<TicTacToeModel, bool> {
  @override
  TicTacToeModel build(bool arg) =>
      TicTacToeModel(tiles: ref.read(tilesProvider).tiles, startWithAi: arg);
}
