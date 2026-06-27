import 'package:flutter/material.dart';
import '../models/game_state.dart';
import '../models/player.dart';

class StatusWidget extends StatelessWidget {
  final Player currentPlayer;
  final GameStatus status;

  const StatusWidget({
    super.key,
    required this.currentPlayer,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    switch (status) {
      case GameStatus.playing:
        text = 'Ход: ${currentPlayer.symbol}';
        break;
      case GameStatus.xWins:
        text = 'Победили крестики!';
        break;
      case GameStatus.oWins:
        text = 'Победили нолики!';
        break;
      case GameStatus.draw:
        text = 'Ничья!';
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}