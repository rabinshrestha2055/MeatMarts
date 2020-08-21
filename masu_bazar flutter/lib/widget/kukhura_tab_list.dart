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
                 constraints: BoxConstraints.expand(height:60),
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
               text: choice.title,
               icon: Icon(choice.icon),
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
  final IconData icon;

  Choice({this.title, this.icon});
  
}
List<Choice> choices=<Choice>[
  Choice(title: 'लोकल',icon: null),
  Choice(title: 'फार्म जातका',icon: null),
  Choice(title: 'हाँस',icon: null),
  Choice(title: 'लौकाट',icon: null),
  Choice(title: 'बटाई',icon: null),
  Choice(title: 'टर्की',icon: null),
  Choice(title: 'fancy कुखुरा',icon: null),
];