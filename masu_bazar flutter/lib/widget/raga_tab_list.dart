import 'package:flutter/material.dart';
class RagaTabList extends StatelessWidget {
  final title;
  List <Widget> containers=[
  
   Center(
     child: Text('भैंसी'),
   ),
     Center(
     child: Text('राँगा'),
   ),
 
  ];

   RagaTabList({Key key, this.title}) : super(key: key);
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
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.orange,
              child: Image(image: AssetImage('assets/images/logo1.png'),)),
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
                     offset: Offset(2.0,10.0)
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
  Choice(title: 'भैंसी',icon: Icons.directions_car),
  Choice(title: 'राँगा',icon: Icons.directions_bike),
 
];