import 'package:flutter/material.dart';
import '../logic/game_controller.dart';
import '../logic/ai.dart';
import '../models/game_state.dart';
import '../widgets/board_widget.dart';
import '../widgets/status_widget.dart';

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

    String message;
    switch (_controller.state.status) {
      case GameStatus.xWins:
        message = 'Победили крестики!';
        break;
      case GameStatus.oWins:
        message = 'Победили нолики!';
        break;
      case GameStatus.draw:
        message = 'Ничья!';
        break;
      default:
        return;
    }

    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Игра окончена'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _controller.reset();
              setState(() {});
            },
            child: const Text('Новая игра'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('В меню'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Крестики-нолики'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reset();
              setState(() {});
            },
            tooltip: 'Новая игра',
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