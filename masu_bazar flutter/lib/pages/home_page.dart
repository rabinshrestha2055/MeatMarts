import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/bottom_navigation_items/meat_shop_button.dart';
import 'package:masu_bazar/pages/bottom_navigation_items/profile_button.dart';
import 'package:masu_bazar/pages/bottom_navigation_items/setting_button.dart';
import 'package:masu_bazar/pages/screens/form_screen.dart';

import 'bottom_navigation_items/home_button.dart';
class HomePage extends StatefulWidget {
  
  
  const HomePage({Key key,}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab=0;
  final  tabs=[
          HomeButton(),
           MeatShopButton(),
           Forms(),
           Setting(),
           ProfileList(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: tabs[_currentTab],
      bottomNavigationBar:BottomNavigationBar(
      selectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentTab,
      onTap: (index){
          setState(() {
            _currentTab=index;
            
          });
      },
      items: [
        //=======Home======//
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          backgroundColor: Colors.red,
          title:Text('Home'),
          //========Home============//
          ),      
           BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 13.0,
            backgroundImage: AssetImage('assets/images/logo1.png'),
          ),
         title: Text('Meat Shop')
            //========Meat Shop==========//
          ),

           //========Add==========//
             BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,),
         title: Text('Add'),
          backgroundColor: Colors.blue,
           //========Add==========//
          ),
           //========Setting==========//
            BottomNavigationBarItem(
          icon: Icon(Icons.settings,),
         title: Text('Setting'),
          backgroundColor: Colors.yellow,
           //========Setting============//
          ),
          //========Profile============//
           BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 13.0,
            backgroundImage: AssetImage('assets/images/ashish.jpg'),
          ),
         title: Text('Profile')
          ),
          //========Profile============//
          
      ]
      
      ),
      
    );
  }
}


