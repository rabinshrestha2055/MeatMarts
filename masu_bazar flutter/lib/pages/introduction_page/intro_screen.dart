import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:masu_bazar/pages/screens/login.dart';
class IntroScreen extends StatelessWidget {
  final pageDecoration=PageDecoration(
    titleTextStyle:TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
    
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color:Colors.black),
    contentPadding: EdgeInsets.all(10)
  );
  List<PageViewModel>getPages(){
    return[
     PageViewModel(
     title: "Welcome To Meat Mart",
     body: "Meat Mart is an e-commerce platform where you can buy and sell your domestic animals and their edible meats",
     image: Center(
    child: Image.asset("assets/images/meatmart.png", height: 250.0),
    
  ),
  decoration: pageDecoration,
),
  PageViewModel(
     title: "Order your meal",
     body: "Select meat item and order online",
     image: Center(
    child: Image.asset("assets/introduction_image/img3.png", height: 220.0),
    
  ),
  decoration: pageDecoration,
),
  PageViewModel(
     title: "Your meal is on the way ",
     body: "Your meal is delivered shortly and you will pay by cash on your location",
     
     image: Center(
    child: Image.asset("assets/introduction_image/img2.png", height: 250.0),
    
  ),
  decoration: pageDecoration,
),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(top:30.0),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          showSkipButton: true,
          showNextButton: true,
          next: Text('Next'),
          skip: Text('Skip'),
          pages: getPages(),
          
          done: Text('Done',
           style: TextStyle(
             color:Colors.black,
             ),
          ),
          onDone: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
          },
          
        ),
      ),
    );
  }
}