import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';
class BirdTabList extends StatelessWidget {
  final title;
  List <Widget> containers=[
   Center(
     child: Text('परेवा'),
   ),
     Center(
     child: Text('सुगा'),
   ),
   Center(
     child: Text('love Birds'),
   ),
  
      Center(
     child: Text('अन्य'),
   ),
  ];

   BirdTabList({Key key, this.title}) : super(key: key);
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
                 margin: EdgeInsets.symmetric(horizontal: 13.0),
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
  Choice(title: 'परेवा',image: Image(image: AssetImage('assets/images/pigeon.png'),height: 25,width: 25,)),
  Choice(title: 'सुगा',image: Image(image: AssetImage('assets/images/parrot.png'),height: 28,width: 28,)),
  Choice(title: 'love Birds',image: Image(image: AssetImage('assets/images/lovebirds.png'),height: 30,width: 30,)),
  Choice(title: 'अन्य',image: Image(image: AssetImage('assets/images/anya.jpg'),height: 28,width: 28,)),
 
];