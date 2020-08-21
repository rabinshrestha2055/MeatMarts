import 'package:flutter/material.dart';
class ChickenList extends StatelessWidget {
   final List<String> _listItem=[
    'assets/chicken_images/nrmlckn.jpg',
    'assets/chicken_images/sasu.png',
    'assets/chicken_images/cknleg.jpg',
    'assets/chicken_images/bon.png',
    'assets/chicken_images/wings.jpeg',
    'assets/chicken_images/mince.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            backgroundColor: Colors.orange,
            elevation: 0.0,
            title: Text("Chicken Items",style: TextStyle(color: Colors.black87),),
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
      body: GridView.count(
        crossAxisCount: 2,
        children:_listItem.map((item) => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white38,
                offset: Offset(0.0,20.0)
              )
            ]
          ),
          child:Card(
            elevation: 10.0,
            child: Column(
              children: <Widget>[
                Image(image:AssetImage(item) ,
                height: 150,width: 200,
                fit: BoxFit.fill,
                ),
                SizedBox(height: 5.0,),
                Text('hlo'),
              ],
              ),
          )
          )
          ).toList(),
        )
      
    );
  }
}