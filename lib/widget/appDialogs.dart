import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class AppDialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String heading,
    String title,
    String message,
    bool error,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading,
              style: TextStyle(color: error ? Colors.orange : null)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  title,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
