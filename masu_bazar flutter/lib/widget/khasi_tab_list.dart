import 'package:flutter/material.dart';
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
          
          appBar:AppBar(
            backgroundColor: Colors.orange,
            elevation: 0.0,
            title: Text(title,style: TextStyle(color: Colors.black87),),
             actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.black54,),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Logout(),
          ),
          
        ],
          ),
        
         body: DefaultTabController(
           length: choices.length,
           child: Column(
             children: <Widget>[
               Container(
                  
                 constraints: BoxConstraints.expand(height:60),
                 decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5.0),
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
                 margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Tab(
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
  Choice(title: 'खसी',image: Image(image: AssetImage('assets/images/khasi.png'),)),
  Choice(title: 'बोका',image: Image(image: AssetImage('assets/images/goat.png'),)),
  Choice(title: 'बाख्रा',image: Image(image: AssetImage('assets/images/bakhri.png'),)),
  Choice(title: 'च्यांग्रा',image: Image(image: AssetImage('assets/images/changra.png'),)),
  Choice(title: 'भेडा',image: Image(image: AssetImage('assets/images/sheep.png'),)),
];