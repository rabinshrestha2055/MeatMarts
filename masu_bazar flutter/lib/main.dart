import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/home_page.dart';
import 'package:masu_bazar/pages/introduction_page/intro_screen.dart';
import 'package:masu_bazar/pages/screens/login.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Flutter Demo projet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        indicatorColor: Colors.white,
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
       // primarySwatch: Colors.blue
      ),
      home:HomePage()//IntroScreen(),
    );
  }
}

