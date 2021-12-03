import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak_toe/model/players.dart';

import 'box.dart';

class Boxes extends StatelessWidget {
  List<Box> boxes = [
    Box.newBox(index: 1),
    Box.newBox(index: 2),
    Box.newBox(index: 3),
    Box.newBox(index: 4),
    Box.newBox(index: 5),
    Box.newBox(index: 6),
    Box.newBox(index: 7),
    Box.newBox(index: 8),
    Box.newBox(index: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: context.read<Players>().isRestart,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            for (var box in boxes) {
              box.onPlayer(null);
            }
          }
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: boxes.length,
              itemBuilder: (context, index) {
                return boxes[index];
              });
        });
  }
}
