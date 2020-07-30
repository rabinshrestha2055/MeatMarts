import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/logout.dart';
class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
            backgroundColor: Colors.orange,
            elevation: 0.0,
            title: Text("Setting",style: TextStyle(color: Colors.black87),),
             actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.black54,),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Logout(),
          ),
          
        ],
          ),
          body: Center(child: Text("Setting"),),
    );
  }
}