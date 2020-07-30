import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masu_bazar/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isloding=false;
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
       body: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [Colors.blue,Colors.teal],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter
             ),
         ),
         child: _isloding?Center(child: CircularProgressIndicator(),):ListView(
           children: [
             headerSection(),
             textSection(),
             buttonSection(),
           ],
         )
         ),
    );
  }
  signIn(String email,pass)async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  Map data={
    'email':email,
    'password':pass,

  };
  var jsonResponse=null;
  var response=await http.post("http://192.168.10.105:3000/user/login",body:data);
  jsonResponse=json.decode(response.body);
  print('Response status: ${response.statusCode}');
  print('Response body:${response.body}');
  if(jsonResponse!=null)
  {
   setState(() {
     _isloding=false;
   });
   sharedPreferences.setString("token", jsonResponse['token']);
   sharedPreferences.setString("userID", jsonResponse['id']);
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>HomePage()), (Route<dynamic>route) => false);
  }else{
    setState(() {
      _isloding=false;
    });
    print(response.body);

  }
}
Container buttonSection()
{
  return Container(
width: MediaQuery.of(context).size.width,
height: 50.0,
padding: EdgeInsets.symmetric(horizontal: 15.0),
child: RaisedButton(
  onPressed: emailController.text=="" || passwordController.text==""?null:(){
    setState(() {
      _isloding=true;
    });
    signIn(emailController.text, passwordController.text);
  },
  elevation: 0.0,
   color: Colors.purple,
   child: Text('SignIn',style: TextStyle(color: Colors.white70),),
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  
),
  );
}
Container textSection(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
    child: Column(children: [
      TextField(
        controller: emailController,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          icon: Icon(Icons.email,color: Colors.white70,),
          hintText: "Email",
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
      SizedBox(height: 30.0,),
         TextField(
        controller: passwordController,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          icon: Icon(Icons.lock,color: Colors.white70,),
          hintText: "Password",
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),

    ],),
  );
}
Container headerSection(){
  return Container(
    margin: EdgeInsets.only(top:50.0),
     padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
     child: Column(
       children: [
         Image.asset('assets/images/meatmart.png',width: 200,height: 200,),
       ],
     ),
     
  );
}
}
