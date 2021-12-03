import 'package:flutter/material.dart';

Future<void> gameDialog({required BuildContext context}) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Игра окончена!'),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: const Text('ok'),
            ),
          ],
        );
      });
}
