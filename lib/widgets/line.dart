import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak_toe/model/players.dart';

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
        stream: Provider.of<Players>(context).winList,
        builder: (context, snapshot) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (context, index) {
              if (snapshot.data != null) {
                return snapshot.data!.contains(index + 1)
                    ? Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.red,
                                width: 4,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15)),
                      )
                    : Container();
              }
              return Container();
            },
          );
        });
  }
}
