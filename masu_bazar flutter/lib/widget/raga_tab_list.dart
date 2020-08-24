import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';
class RagaTabList extends StatelessWidget {
  final title;
  List <Widget> containers=[
  Center(
     child: Text('गाई'),
   ),
   Center(
     child: Text('भैंसी'),
   ),
  
      Center(
     child: Text('गोरू'),
   ),
     Center(
     child: Text('राँगा'),
   ),
 
  ];

   RagaTabList({Key key, this.title}) : super(key: key);
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
                     offset: Offset(1.0,1.0)
                  ),
                 ]
                ),
                 child: TabBar(
                isScrollable: false,
               
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.black,
                tabs:choices.map<Widget>((Choice choice){
                return Container(
                 margin: EdgeInsets.symmetric(horizontal: 0.0),
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
  Choice(title: 'गाई',image: Image(image: AssetImage('assets/images/cow.png'),height: 30,width: 30,)),
  Choice(title: 'भैंसी',image: Image(image: AssetImage('assets/images/bahisi.jpg'),height: 30,width: 30,)),
  Choice(title: 'गोरू',image: Image(image: AssetImage('assets/images/goru.jpeg'),height: 30,width: 30,)),
  Choice(title: 'राँगा',image: Image(image: AssetImage('assets/images/rango.png'),height: 30,width: 30,)),
 
];