import 'package:flutter/material.dart';
class Delete extends StatelessWidget {
  const Delete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to delete this ad?'),
      actions: [
            FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          ),
             FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          ),
      ],

    );
  }
}