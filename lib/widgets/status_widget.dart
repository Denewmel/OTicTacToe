import 'package:flutter/material.dart';
import '../models/game_state.dart';
import '../models/player.dart';
import '../l10n/generated/ottt_localizations.dart';

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
    final strings = AppLocalizations.of(context);
    String text;

    switch (status) {
      case GameStatus.playing:
        text = strings.turn(currentPlayer.symbol);
        break;
      case GameStatus.xWins:
        text = strings.xWins;
        break;
      case GameStatus.oWins:
        text = strings.oWins;
        break;
      case GameStatus.draw:
        text = strings.draw;
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