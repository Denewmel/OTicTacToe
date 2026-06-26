import '../models/board.dart';
import '../models/player.dart';
import '../models/game_state.dart';
import 'ai.dart';

class GameController {
  final Board _board = Board();
  late GameState _state;

  final bool againstComputer;
  final Difficulty difficulty;

  GameController({
    required this.againstComputer,
    this.difficulty = Difficulty.easy,
  }) {
    _state = GameState.initial();
  }

  Board get board => _board;
  GameState get state => _state;

  bool makeHumanMove(int index) {
    if (_state.status != GameStatus.playing) return false;
    if (!_board.makeMove(index, _state.currentPlayer)) return false;
    _updateState();
    return true;
  }

  void makeComputerMove() {
    if (!againstComputer || _state.status != GameStatus.playing) return;
    final move = AIPlayer.chooseMove(_board, difficulty, _state.currentPlayer);
    if (move != null) {
      _board.makeMove(move, _state.currentPlayer);
      _updateState();
    }
  }

  void _updateState() {
    final winner = _board.checkWinner();
    if (winner != null) {
      _state = GameState(
        _state.currentPlayer,
        winner == Player.X ? GameStatus.xWins : GameStatus.oWins,
      );
    } else if (_board.isFull) {
      _state = GameState(_state.currentPlayer, GameStatus.draw);
    } else {
      _state = GameState(
        _state.currentPlayer.opponent,
        GameStatus.playing,
      );
    }
  }

  void reset() {
    _board.reset();
    _state = GameState.initial();
  }
}