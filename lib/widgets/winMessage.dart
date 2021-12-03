import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak_toe/model/players.dart';

class WinMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: context.read<Players>().isWin,
        builder: (context, snapshot) {
          String message = '';
          if (snapshot.data == true) {
            message = '${context.read<Players>().activePlayer.mark} wins!';
          }
          return Text(
            message,
            style: const TextStyle(
                color: Colors.red, fontSize: 70, fontWeight: FontWeight.bold),
          );
        });
  }
}
