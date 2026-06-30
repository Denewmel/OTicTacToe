import 'dart:math';
import 'player.dart';

enum GameStatus { playing, xWins, oWins, draw }

class GameState {
  final Player currentPlayer;
  final GameStatus status;

  const GameState(this.currentPlayer, this.status);

  factory GameState.initial() {
    final firstPlayer = Random().nextBool() ? Player.X : Player.O;
    return GameState(firstPlayer, GameStatus.playing);
  }
}