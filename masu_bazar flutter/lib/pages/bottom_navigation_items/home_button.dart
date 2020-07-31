import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:masu_bazar/widget/category_list.dart';
class HomeButton extends StatelessWidget {
  const HomeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
    SafeArea(
      child: Card(
        borderOnForeground: true,
        elevation: 8.0,
        child: Container(
         
           height: MediaQuery.of(context).size.height/2.8,
       child: Carousel(
      boxFit: BoxFit.fill,
      images:[
        AssetImage('assets/images/ad2.jpg'),
        AssetImage('assets/images/ad3.png'),
        AssetImage('assets/images/ad4.jpeg')
      ],
      dotBgColor: Colors.transparent,
      autoplay: true,
      animationDuration: Duration(milliseconds: 1000) ,
      dotSize: 5.0,
      indicatorBgPadding: 2.0,
         ),
         ),
      ),
    ),
    
       Container(
       color: Colors.yellow,
         height: MediaQuery.of(context).size.height/1.97,
         
         child: CategoryList(),
       ),
  
      ],
      );
  }
}
