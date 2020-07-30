import 'package:flutter/material.dart';
class Dialogs extends StatelessWidget {
  const Dialogs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Information'),
      content: Text('Submit data sucessfully'),
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