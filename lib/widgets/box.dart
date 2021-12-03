import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak_toe/model/players.dart';
import 'package:tik_tak_toe/model/player.dart';
import 'package:rxdart/rxdart.dart';

class Box extends StatelessWidget {
  int index;
  Player? owner;

  BehaviorSubject<Player?> playerOwn;

  Box({required this.index, required this.owner})
      : playerOwn = BehaviorSubject<Player?>.seeded(owner);

  Box.newBox({required index}) : this(index: index, owner: null);

  void onPlayer(Player? owner) {
    playerOwn.add(owner);
    this.owner = owner;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.amber, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                side: BorderSide.none,
                primary: Colors.red),
            onPressed: () {
              if (owner == null) {
                onPlayer(context.read<Players>().activePlayer);
                context.read<Players>().activePlayer.addBox(index);
                context.read<Players>().changePlayer();
              }
            },
            child: StreamBuilder<Player?>(
                stream: playerOwn,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data != null ? snapshot.data!.mark : '',
                    style: const TextStyle(fontSize: 80),
                  );
                })));
  }
}
