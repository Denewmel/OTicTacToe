import 'dart:math';
import '../models/board.dart';
import '../models/player.dart';

enum Difficulty { easy, normal, impossible }

class AIPlayer {
  static int? chooseMove(Board board, Difficulty difficulty, Player aiPlayer) {
    switch (difficulty) {
      case Difficulty.easy:
        return _randomMove(board);
      case Difficulty.normal:
        return _normalMove(board, aiPlayer);
      case Difficulty.impossible:
        return _perfectMove(board, aiPlayer);
    }
  }

  static int? _randomMove(Board board) {
    final empty = board.emptyCells;
    if (empty.isEmpty) return null;
    return empty[Random().nextInt(empty.length)];
  }

  static int? _normalMove(Board board, Player aiPlayer) {
    final empty = board.emptyCells;
    if (empty.isEmpty) return null;

    for (final idx in empty) {
      final copy = _copyBoard(board);
      copy.makeMove(idx, aiPlayer);
      if (copy.checkWinner() == aiPlayer) return idx;
    }

    final opponent = aiPlayer.opponent;
    for (final idx in empty) {
      final copy = _copyBoard(board);
      copy.makeMove(idx, opponent);
      if (copy.checkWinner() == opponent) return idx;
    }

    return empty[Random().nextInt(empty.length)];
  }

  static int? _perfectMove(Board board, Player aiPlayer) {
    final empty = board.emptyCells;
    if (empty.isEmpty) return null;

    int aiCount = 0;
    for (final cell in board.cells) {
      if (cell == aiPlayer) aiCount++;
    }

    if (aiCount == 0) {
      if (empty.length == 9) {
        const corners = [0, 2, 6, 8];
        return corners[Random().nextInt(corners.length)];
      }
      if (board.cells[4] == null) {
        return 4;
      } else {
        const corners = [0, 2, 6, 8];
        final freeCorners = corners.where((c) => board.cells[c] == null).toList();
        if (freeCorners.isNotEmpty) {
          return freeCorners[Random().nextInt(freeCorners.length)];
        }
        return _randomMove(board);
      }
    }

    if (aiCount == 1) {
      int myFirstMove = -1;
      for (int i = 0; i < 9; i++) {
        if (board.cells[i] == aiPlayer) {
          myFirstMove = i;
          break;
        }
      }

      final opponent = aiPlayer.opponent;
      final bool playerInCenter = board.cells[4] == opponent;

      if (playerInCenter) {
        const oppositeCorners = {0: 8, 2: 6, 6: 2, 8: 0};
        final target = oppositeCorners[myFirstMove];
        if (target != null && board.cells[target] == null) {
          return target;
        }
        // Если противоположный занят (редко), включаем normal.
        return _normalMove(board, aiPlayer);
      } else {
        int playerMove = -1;
        for (int i = 0; i < 9; i++) {
          if (board.cells[i] == opponent && i != 4) {
            playerMove = i;
            break;
          }
        }

        const responseMap = {
          0: 8, 1: 8, 2: 6, 3: 8, 5: 6, 6: 2, 7: 2, 8: 0,
        };

        final response = responseMap[playerMove];
        if (response != null && board.cells[response] == null) {
          return response;
        }
 
        return _normalMove(board, aiPlayer);
      }
    }

    return _normalMove(board, aiPlayer);
  }

  static Board _copyBoard(Board original) {
    final copy = Board();
    for (int i = 0; i < 9; i++) {
      if (original.cells[i] != null) {
        copy.makeMove(i, original.cells[i]!);
      }
    }
    return copy;
  }
}