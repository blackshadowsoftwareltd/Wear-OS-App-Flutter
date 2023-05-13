class TicTacList {
  final List<int> tiles;

  TicTacList({required this.tiles});

  TicTacList copyWith({
    List<int>? tiles,
  }) {
    return TicTacList(
      tiles: tiles ?? this.tiles,
    );
  }
}

class TicTacToeModel {
  final List<int> tiles;
  final bool startWithAi;

  TicTacToeModel({required this.tiles, required this.startWithAi});

  TicTacToeModel copyWith({
    List<int>? tiles,
    bool? startWithAi,
  }) {
    return TicTacToeModel(
      tiles: tiles ?? this.tiles,
      startWithAi: startWithAi ?? this.startWithAi,
    );
  }
}

class WhoWinnList {
  final int who;
  final List<int> tiles;
  WhoWinnList({required this.who, required this.tiles});
}
