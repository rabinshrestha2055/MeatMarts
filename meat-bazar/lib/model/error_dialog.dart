import 'package:flutter/material.dart';
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Information'),
      content: Text('Submit data failed'),
      actions: [
            FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          ),
      ],

    );
  }
}