import 'package:flutter/material.dart';
class Dialogs extends StatelessWidget {
  const Dialogs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Information'),
      content: Text('Data sucessfully submitted'),
      actions: [
            FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
      ],

    );
  }
}