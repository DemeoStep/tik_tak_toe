import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tik_tak_toe/model/players.dart';

class EndGameButton extends StatelessWidget {
  const EndGameButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: context
          .read<Players>()
          .isWin
          .mergeWith([context.read<Players>().isWithdraw]),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return OutlinedButton(
              onPressed: () {
                context.read<Players>().onRestart();
                //context.read<Players>().isWithdraw.add(false);
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide.none, primary: Colors.white),
              child: Container());
        } else {
          return Container();
        }
      },
    );
  }
}
