import 'player.dart';

enum GameStatus { playing, xWins, oWins, draw }

class GameState {
  final Player currentPlayer;
  final GameStatus status;

  const GameState(this.currentPlayer, this.status);

  factory GameState.initial() => const GameState(Player.X, GameStatus.playing);
}