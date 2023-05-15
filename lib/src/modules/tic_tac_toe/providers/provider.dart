import 'package:flutter_riverpod/flutter_riverpod.dart'
    show FamilyNotifier, Notifier, NotifierProvider, NotifierProviderFamily;
import '/src/modules/tic_tac_toe/models/model.dart'
    show TicTacList, TicTacToeModel;

final isAiProvider = NotifierProvider<_IsAi, bool>(_IsAi.new);

class _IsAi extends Notifier<bool> {
  @override
  bool build() => false;
  void toggle() => state = !state;
}

final isWiningProvider = NotifierProvider<_Wining, bool>(_Wining.new);

class _Wining extends Notifier<bool> {
  @override
  bool build() => false;
  void update(bool v) => state = v;

  bool isWin(int who, List<int> tiles) {
    state = (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
        (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
        (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
        (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
        (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
        (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
        (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
        (tiles[2] == who && tiles[5] == who && tiles[8] == who);
    return state;
  }
}

final tilesProvider = NotifierProvider<_Tiles, TicTacList>(_Tiles.new);

class _Tiles extends Notifier<TicTacList> {
  @override
  TicTacList build() => TicTacList(tiles: List.generate(9, (index) => 0));
}

final startWithProvider =
    NotifierProviderFamily<_StartWith, TicTacToeModel, bool>(_StartWith.new);

class _StartWith extends FamilyNotifier<TicTacToeModel, bool> {
  @override
  TicTacToeModel build(bool arg) =>
      TicTacToeModel(tiles: ref.read(tilesProvider).tiles, startWithAi: arg);
}
