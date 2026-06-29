// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ottt_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Крестики Нолики';

  @override
  String get playWithFriend => 'Играть с другом';

  @override
  String get playWithAI => 'Играть против ИИ';

  @override
  String get reference => 'Справка';

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
}
