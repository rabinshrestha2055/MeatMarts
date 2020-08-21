import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final int totalAd;

  const ProfilePage({Key key, this.totalAd}) : super(key: key);
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>{
    @override
  void initState() { 
    super.initState();
    getShareRef();
 
  }
   String email;
  String username;
   
      getShareRef() async{
     final prefsemail=await SharedPreferences.getInstance();
     final key1='email';
     final emailvalue=prefsemail.get(key1)??0;
      final prefsusername=await SharedPreferences.getInstance();
    final key='username';
    
      final usernamevalue=prefsusername.get(key)??0;
    
     setState(() {
       email=emailvalue;
        username=usernamevalue;
     });
     print(email);

  }

     
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 3.0,right: 3.0,top: 3.0),  
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5.0),
             border: Border.all(color: Colors.black26),
             color: Colors.white,
             boxShadow: [
               BoxShadow(
                 color: Colors.black26,
                 offset: Offset(0.0,1.0),
               )
             ]
           ),
        //color: Colors.white,
        child: Column(
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
               padding:  EdgeInsets.only(left: 10.0,top: 8.0),
               child: Text('User Information :',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
             ),
              Divider(color: Colors.black26,thickness: 2.0,),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Stack(fit: StackFit.loose, children: <Widget>[
               Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/images/person.png'),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 70.0, right: 90.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20.0,
                        child:  Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ]),
          ),
      
        ],
      
      ),
      SizedBox(height: 10,),
      Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
    
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                   Text(
                      'Name:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                   SizedBox(height: 10,),
                    
                  ],
                
                ),
              ],
            ),
          ),
                   Padding(
                     padding:  EdgeInsets.only(left: 10),
                     child: Text(
                        '$username',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                   ),
                      
             SizedBox(height: 10,),
          Padding(
            padding:  EdgeInsets.only(left: 10,),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                      Text(
                         'Email ID:',
                         style: TextStyle(
                             fontSize: 16.0,
                             fontWeight: FontWeight.bold),
                       ),
                  
                  ],
                ),
              ],
            ),
          ),
           SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Text(
                        '$email',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
               ),
                    ),
       SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.only(left:10.0),
             child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                       'Total AD :',
                       style: TextStyle(
                           fontSize: 16.0,
                           fontWeight: FontWeight.bold),
                     ),
                    SizedBox(width: 3,),
                   Text(
                    '3',
                    style: TextStyle(
                    color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                  ],
                  
                ),
                
              ],
              
          ),
           ),
          SizedBox(height: 7,),
        ],
      ),
      
    ],
        ),
      );
    
  }

  }
