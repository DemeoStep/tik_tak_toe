import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak_toe/model/players.dart';
import 'package:tik_tak_toe/widgets/boxes.dart';
import 'package:tik_tak_toe/widgets/endGameButton.dart';
import 'package:tik_tak_toe/widgets/line.dart';
import 'package:tik_tak_toe/widgets/playerScores.dart';
import 'package:tik_tak_toe/widgets/winMessage.dart';
import 'package:tik_tak_toe/widgets/withdrawMessage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<Players>().activePlayer = context.read<Players>().playerX;

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 800,
          child: Column(children: [
            Expanded(
              child: StreamBuilder<Object>(
                  stream: context.read<Players>().isWithdraw,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return WithdrawMessage();
                    } else {
                      return WinMessage();
                    }
                  }),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child:
                        PlayerScores(player: context.read<Players>().playerX),
                  ),
                  Expanded(
                      flex: 2,
                      child: Stack(children: [
                        Boxes(),
                        StreamBuilder<bool>(
                          stream: context.read<Players>().isWin,
                          builder: (context, snapshot) {
                            if (snapshot.data == true) {
                              return const Line();
                            } else {
                              return Container();
                            }
                          },
                        ),
                        const EndGameButton(),
                      ])),
                  Expanded(
                    child:
                        PlayerScores(player: context.read<Players>().playerO),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
