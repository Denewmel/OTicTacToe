// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ottt_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tic Tac Toe';

  @override
  String get playWithFriend => 'Play with friend';

  @override
  String get playWithAI => 'Play with AI';

  @override
  String get reference => 'Reference';

  @override
  String get withFriend => '👥 With friend';

  @override
  String get againstAI => '🤖 Against AI';

  @override
  String get difficultyLevel => 'Difficulty:';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyImpossible => 'Impossible';

  @override
  String get play => 'Play';

  @override
  String get gameOver => 'Game over';

  @override
  String get xWins => 'X wins!';

  @override
  String get oWins => 'O wins!';

  @override
  String get draw => 'It\'s a draw!';

  @override
  String turn(Object player) {
    return 'Turn: $player';
  }

  @override
  String get newGame => 'New game';

  @override
  String get backToMenu => 'Back to menu';

  @override
  String get aboutGame => 'About the game';

  @override
  String get aboutGameDescription =>
      'Tic Tac Toe is a classic game for two players, where opponents take turns placing X and O on a 3×3 grid. The first player to line up three of their symbols horizontally, vertically, or diagonally wins.';

  @override
  String get howToPlay => 'How to play';

  @override
  String get howToPlayDescription =>
      'Tap on an empty cell to place your symbol (X or O). Players take turns until one of them lines up three symbols or the board is full (draw).';

  @override
  String get gameModes => 'Game modes';

  @override
  String get gameModesDescription =>
      '• Against a friend: play together on one device.\n• Against AI: play against the computer with three difficulty levels — Easy, Normal and Impossible.';

  @override
  String get developer => 'Developer';

  @override
  String get sourceCode => 'Source code';

  @override
  String get license => 'License';
}
