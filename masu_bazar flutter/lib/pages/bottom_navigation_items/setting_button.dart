import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';
import 'package:masu_bazar/pages/screens/logout.dart';
import 'package:masu_bazar/pages/screens/profile.dart';
class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:appBar("Setting"),
          body: Container(
           // color: Colors.green,
            height: MediaQuery.of(context).size.height,
            child:Center(child: Text('Setting'),),
    ));
  }
}