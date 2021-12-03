import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'player.dart';

class Players with ChangeNotifier {
  var playerX = Player(mark: 'X', boxes: {}, wins: 0);
  var playerO = Player(mark: 'O', boxes: {}, wins: 0);

  bool win = false;
  bool restart = false;
  bool withdraw = false;

  BehaviorSubject<bool> isWin;
  BehaviorSubject<Player> active;
  BehaviorSubject<List<int>> winList;
  BehaviorSubject<bool> isRestart;
  BehaviorSubject<bool> isWithdraw;

  late Player activePlayer = playerX;
  List<int> boxesList = [];

  Players(
      this.win, this.activePlayer, this.boxesList, this.restart, this.withdraw)
      : isWin = BehaviorSubject<bool>.seeded(win),
        active = BehaviorSubject<Player>.seeded(activePlayer),
        winList = BehaviorSubject<List<int>>.seeded(boxesList),
        isRestart = BehaviorSubject<bool>.seeded(restart),
        isWithdraw = BehaviorSubject<bool>.seeded(withdraw);

  Players.newPlayers()
      : this(false, Player(mark: '', boxes: {}, wins: 0), [], false, false);

  void onWin(bool win) {
    this.win = win;
    isWin.add(win);
  }

  void onRestart() {
    isRestart.add(true);
    playerX.boxes.clear();
    playerO.boxes.clear();
    activePlayer = playerX;
    onWin(false);
    onWithdraw(false);
  }

  void onWithdraw(bool withdraw) {
    isWithdraw.add(withdraw);
    this.withdraw = withdraw;
  }

  void changePlayer() {
    analyze();
    if (win != true) {
      if (activePlayer == playerX) {
        activePlayer = playerO;
        active.add(playerO);
      } else {
        activePlayer = playerX;
        active.add(playerO);
      }
    }
  }

  void analyze() {
    if (activePlayer.boxes.length > 2) {
      if (activePlayer.boxes.containsAll({1, 2, 3})) {
        processWin([1, 2, 3]);
      } else if (activePlayer.boxes.containsAll({4, 5, 6})) {
        processWin([4, 5, 6]);
      } else if (activePlayer.boxes.containsAll({7, 8, 9})) {
        processWin([7, 8, 9]);
      } else if (activePlayer.boxes.containsAll({1, 4, 7})) {
        processWin([1, 4, 7]);
      } else if (activePlayer.boxes.containsAll({2, 5, 8})) {
        processWin([2, 5, 8]);
      } else if (activePlayer.boxes.containsAll({3, 6, 9})) {
        processWin([3, 6, 9]);
      } else if (activePlayer.boxes.containsAll({1, 5, 9})) {
        processWin([1, 5, 9]);
      } else if (activePlayer.boxes.containsAll({3, 5, 7})) {
        processWin([3, 5, 7]);
      } else if (playerX.boxes.length + playerO.boxes.length == 9) {
        onWithdraw(true);
      } else {
        onWin(false);
      }
    } else {
      onWin(false);
    }
  }

  void processWin(List<int> winBoxes) {
    winList.add(winBoxes);
    onWin(true);
    activePlayer.onWin();
  }
}
