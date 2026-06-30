// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ottt_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Крестики-нолики';

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

  @override
  String get aboutGame => 'Об игре';

  @override
  String get aboutGameDescription =>
      'Крестики-нолики — классическая игра для двух игроков, в которой соперники по очереди ставят X и O на поле 3×3. Побеждает тот, кто первым выстроит три своих символа в ряд по горизонтали, вертикали или диагонали.';

  @override
  String get howToPlay => 'Как играть';

  @override
  String get howToPlayDescription =>
      'Нажимайте на свободную клетку, чтобы поставить свой символ (X или O). Игроки ходят по очереди, пока один из них не выстроит три символа в ряд или поле не заполнится (ничья).';

  @override
  String get gameModes => 'Режимы игры';

  @override
  String get gameModesDescription =>
      '• Против друга: играйте вдвоём на одном устройстве.\n• Против ИИ: играйте против компьютера с тремя уровнями сложности — Лёгкий, Нормальный и Невозможный.';

  @override
  String get developer => 'Разработчик';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get license => 'Лицензия';
}
