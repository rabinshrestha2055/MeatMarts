import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/logout.dart';
Widget appBar(String title){
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
            backgroundColor: Color(0xFFEB0EC29E), //Colors.lightBlue[700],
            elevation: 0.0,
            title: Text(title,style: TextStyle(color: Colors.white),),
             actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.white,),),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Logout(),
          ),
          
        ],
          
  );
}
