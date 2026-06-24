enum Player {
  X,
  O;

  String get symbol => this == X ? 'X' : 'O';

  Player get opponent => this == X ? O : X;
}