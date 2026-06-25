import 'player.dart';

class Board {
  final List<Player?> _cells = List.filled(9, null);

  List<Player?> get cells => List.unmodifiable(_cells);

  bool makeMove(int index, Player player) {
    if (index < 0 || index >= 9 || _cells[index] != null) return false;
    _cells[index] = player;
    return true;
  }

  Player? checkWinner() {
    const lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ];

    for (final line in lines) {
      if (_cells[line[0]] != null &&
          _cells[line[0]] == _cells[line[1]] &&
          _cells[line[0]] == _cells[line[2]]) {
        return _cells[line[0]];
      }
    }
    return null;
  }

  bool get isFull => _cells.every((cell) => cell != null);

  List<int> get emptyCells {
    final indices = <int>[];
    for (int i = 0; i < _cells.length; i++) {
      if (_cells[i] == null) indices.add(i);
    }
    return indices;
  }

  void reset() {
    for (int i = 0; i < _cells.length; i++) {
      _cells[i] = null;
    }
  }
}