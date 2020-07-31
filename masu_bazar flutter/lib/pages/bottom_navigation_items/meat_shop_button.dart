import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:masu_bazar/widget/meat_catlist.dart';


class MeatShopButton extends StatelessWidget {
  const MeatShopButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
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
        AssetImage('assets/meat_shop_images/shop_carousel/shop1.jpg'),
        AssetImage('assets/meat_shop_images/shop_carousel/butcher1.jpg'),
        AssetImage('assets/meat_shop_images/shop_carousel/shop2.jpg'),
        AssetImage('assets/meat_shop_images/shop_carousel/desktop.jpg'),
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
         padding: EdgeInsets.symmetric(vertical: 5.0),
         height: MediaQuery.of(context).size.height/1.97,
       child: MeatCatList(),
       ),
     
      ],
      );
  }
}
