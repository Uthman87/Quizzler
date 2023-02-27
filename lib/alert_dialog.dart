import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  Future<DialogsAction> yesCancelDialog(
      BuildContext context, String title, String body) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              MaterialButton(
                onPressed: () =>
                    Navigator.of(context).pop(DialogsAction.cancel),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color(0xFFC41A3B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });

    return (action != null) ? action : DialogsAction.cancel;
  }
}
