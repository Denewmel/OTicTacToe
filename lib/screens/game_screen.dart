import 'package:flutter/material.dart';
import '../logic/game_controller.dart';
import '../logic/ai.dart';
import '../models/game_state.dart';
import '../widgets/board_widget.dart';
import '../widgets/status_widget.dart';
import '../l10n/generated/ottt_localizations.dart';

class GameScreen extends StatefulWidget {
  final bool againstComputer;
  final Difficulty difficulty;

  const GameScreen({
    super.key,
    required this.againstComputer,
    required this.difficulty,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GameController(
      againstComputer: widget.againstComputer,
      difficulty: widget.difficulty,
    );
  }

  void _onCellTap(int index) {
    if (_controller.state.status != GameStatus.playing) return;

    if (_controller.makeHumanMove(index)) {
      setState(() {});
      if (widget.againstComputer &&
          _controller.state.status == GameStatus.playing) {
        Future.delayed(const Duration(milliseconds: 200), () {
          _controller.makeComputerMove();
          setState(() {});
          _showEndDialogIfNeeded();
        });
      } else {
        _showEndDialogIfNeeded();
      }
    }
  }

  void _showEndDialogIfNeeded() {
    if (_controller.state.status == GameStatus.playing) return;

    final strings = AppLocalizations.of(context);
    String message;
    switch (_controller.state.status) {
      case GameStatus.xWins:
        message = strings.xWins;
        break;
      case GameStatus.oWins:
        message = strings.oWins;
        break;
      case GameStatus.draw:
        message = strings.draw;
        break;
      default:
        return;
    }

    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(strings.gameOver),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _controller.reset();
              setState(() {});
            },
            child: Text(strings.newGame),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text(strings.backToMenu),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.appTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reset();
              setState(() {});
            },
            tooltip: strings.newGame,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StatusWidget(
              currentPlayer: _controller.state.currentPlayer,
              status: _controller.state.status,
            ),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BoardWidget(
                    cells: _controller.board.cells,
                    onCellTap: _onCellTap,
                    enabled: _controller.state.status == GameStatus.playing,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}