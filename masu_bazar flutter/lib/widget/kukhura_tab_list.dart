import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';
import 'package:masu_bazar/pages/screens/kukhura_list.dart';
class KukhuraTabList extends StatelessWidget {
  final title;
  List <Widget> containers=[
  KukhuraList(),
     Center(
       child: Text('फार्म जातका'),
   ),
    Center(
     child: Text('हाँस'),
   ),
  
      Center(
     child: Text('लौकाट'),
   ),
    Center(
     child: Text('बटाई'),
   ),
  
      Center(
     child: Text('टर्की'),
   ),
    Center(
     child: Text('fancy कुखुरा'),
   ),
  ];

   KukhuraTabList({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(     
          appBar:appBar(title),
         body: DefaultTabController(
           length: choices.length,
           child: Column(
             children: <Widget>[
               Container(
                 constraints: BoxConstraints.expand(height:63),
                 margin: EdgeInsets.only(left: 0.5,right: 0.5),
                 decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(1.0),
                border:Border.all(color: Color(0xFFEB0EC29E),style: BorderStyle.solid),
                 boxShadow: [
                  BoxShadow(
                     color: Colors.black26,
                     offset: Offset(1.0,1.0)
                  ),
                 ]
                ),
                 child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs:choices.map<Widget>((Choice choice){
                return Container(
                 margin: EdgeInsets.symmetric(horizontal: 5.0),
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
  Choice(title: 'लोकल',image: Image(image: AssetImage('assets/images/hen1.png'),width: 20,height: 20,)),
  Choice(title: 'फार्म जातका',image:Image(image: AssetImage('assets/images/farm.png'),width: 25,height: 25,) ),
  Choice(title: 'हाँस',image: Image(image: AssetImage('assets/images/duck.jpg'),width: 30,height: 26,)),
  Choice(title: 'लौकाट',image: Image(image: AssetImage('assets/images/laukat.jpg'),width: 30,height: 30,)),
  Choice(title: 'बटाई',image: Image(image: AssetImage('assets/images/batai.png'),width: 30,height: 30,)),
  Choice(title: 'टर्की',image: Image(image: AssetImage('assets/images/tarki.png'),width: 30,height: 30,)),
  Choice(title: 'fancy कुखुरा',image: Image(image: AssetImage('assets/images/fancy.png'),width: 25,height: 25,)),
];