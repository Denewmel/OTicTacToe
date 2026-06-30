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
  String get withFriend => '👥 С другом';

  @override
  String get againstAI => '🤖 Против ИИ';

  @override
  String get difficultyLevel => 'Уровень сложности:';

  @override
  String get difficultyEasy => 'Лёгкий';

  @override
  String get difficultyNormal => 'Нормальный';

  @override
  String get difficultyImpossible => 'Невозможный';

  @override
  String get play => 'Играть';

  @override
  String get gameOver => 'Игра окончена';

  @override
  String get xWins => 'Победили крестики!';

  @override
  String get oWins => 'Победили нолики!';

  @override
  String get draw => 'Ничья!';

  @override
  String turn(Object player) {
    return 'Ход: $player';
  }

  @override
  String get newGame => 'Новая игра';

  @override
  String get backToMenu => 'В меню';
}
