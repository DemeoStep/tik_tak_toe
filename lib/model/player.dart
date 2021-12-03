import 'package:rxdart/rxdart.dart';

class Player {
  String mark;
  int wins = 0;
  Set<int> boxes = {};

  BehaviorSubject<int> playerWins;

  Player({required this.mark, required this.boxes, required this.wins})
      : playerWins = BehaviorSubject<int>.seeded(wins);

  void addBox(int box) {
    boxes.add(box);
  }

  void onWin() {
    wins++;
    playerWins.add(wins);
  }
}
