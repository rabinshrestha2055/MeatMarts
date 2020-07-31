import 'package:flutter/material.dart';
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
  Choice(title: 'लोकल',icon: Icons.directions_car),
  Choice(title: 'फार्म जातका',icon: Icons.directions_bike),
  Choice(title: 'हाँस',icon: Icons.directions_bus),
  Choice(title: 'लौकाट',icon: Icons.directions_railway),
  Choice(title: 'बटाई',icon: Icons.directions_walk),
  Choice(title: 'टर्की',icon: Icons.directions_car),
  Choice(title: 'fancy कुखुरा',icon: Icons.directions_bike),
];