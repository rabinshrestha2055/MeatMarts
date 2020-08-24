import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';
import 'package:masu_bazar/pages/screens/boka_list.dart';
import 'package:masu_bazar/pages/screens/khasi_list.dart';
import 'package:masu_bazar/pages/screens/logout.dart';
class KhasiTabList extends StatelessWidget {
  final title;
  List <Widget> containers=[
   KhasiList(),
   BokaList(),
     Center(
     child: Text('बाख्रा'),
   ),
   Center(
     child: Text('च्यांग्रा'),
   ),
  
      Center(
     child: Text('भेडा'),
   ),
  ];

   KhasiTabList({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          
          appBar:appBar(title),
         body: DefaultTabController(
           length: choices.length,
           child: Column(
             children: <Widget>[
               Container(
                  margin: EdgeInsets.only(left: 0.5,right: 0.5),
                constraints: BoxConstraints.expand(height:63),
                 decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(1.0),
                border:Border.all(color: Colors.black54,style: BorderStyle.solid),
                 boxShadow: [
                  BoxShadow(
                     color: Colors.black26,
                     offset: Offset(0.0,0.0)
                  ),
                 ]
                ),
                 child: TabBar(
                   
                isScrollable: true,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs:choices.map<Widget>((Choice choice){
                return Container(
                  
                 margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                  child: Tab(
                    iconMargin: EdgeInsets.only(top:2),
               text: choice.title,
               icon: choice.image,
               
                    ),
                );
              }
              ).toList(),
              
            ),
               ),
               Expanded(
                 child: TabBarView(children: containers)
               )
             ],
           ),
         ),
          );
       
  }
}
class Choice{
  final String title ;
  final Image image;

  Choice({this.title, this.image});
  
}
List<Choice> choices=<Choice>[
  Choice(title: 'खसी',image: Image(image: AssetImage('assets/images/khasi.png'),height: 25,width: 25,)),
  Choice(title: 'बोका',image: Image(image: AssetImage('assets/images/boka.png'),height: 25,width: 25,)),
  Choice(title: 'बाख्रा',image: Image(image: AssetImage('assets/images/bakhri.png'),height: 30,width: 30,)),
  Choice(title: 'च्यांग्रा',image: Image(image: AssetImage('assets/images/changra.png'),height: 30,width: 30,)),
  Choice(title: 'भेडा',image: Image(image: AssetImage('assets/images/sheep.png'),height: 30,width: 30,)),
];