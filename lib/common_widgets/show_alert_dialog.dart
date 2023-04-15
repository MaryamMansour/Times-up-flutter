import 'package:flutter/material.dart';

Future<dynamic> showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String defaultActionText,
  String? cancelActionText,
}) async {
  var value = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              if (cancelActionText != null)
                OutlinedButton(
                  child: Text(
                    cancelActionText,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.indigo),
                child: Text(defaultActionText,
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor)),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ));

  return value as bool;
}
