import 'package:flutter/material.dart';
import 'package:tik_tak_toe/model/player.dart';

class PlayerScores extends StatelessWidget {
  Player player;

  PlayerScores({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Player ${player.mark}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<int>(
              stream: player.playerWins,
              builder: (context, snapshot) {
                var wins = snapshot.data ?? 0;
                return Text('$wins',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ));
              }),
        ]);
  }
}
