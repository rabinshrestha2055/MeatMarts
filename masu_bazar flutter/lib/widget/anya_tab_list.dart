import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';

class AnyaTabList extends StatelessWidget {
  final title;
  List <Widget> containers=[

   Center(
     child: Text('सुँगुर/बदेल'),
   ),
     Center(
     child: Text('खरायो'),
   ),
   Center(
     child: Text('कुकुर'),
   ),
  
      Center(
     child: Text('गोरू'),
   ),
      Center(
     child: Text('घोडा'),
   ),
  
      Center(
     child: Text('अन्य'),
   ),
  ];

   AnyaTabList({Key key, this.title}) : super(key: key);
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
                 constraints: BoxConstraints.expand(height:60),
                 decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(1.0),
                border:Border.all(color: Colors.black54,style: BorderStyle.solid),
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
  Choice(title: 'सुँगुर/बदेल',icon: Icons.directions_car),
  Choice(title: 'खरायो',icon: Icons.directions_bike),
  Choice(title: 'कुकुर',icon: Icons.directions_bus),
  Choice(title: 'गोरू',icon: Icons.directions_railway),
  Choice(title: 'घोडा',icon: Icons.directions_walk),
    Choice(title: 'अन्य',icon: Icons.directions_railway),
  
];