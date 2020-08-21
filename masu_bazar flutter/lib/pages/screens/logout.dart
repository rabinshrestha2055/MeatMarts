import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({Key key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
   SharedPreferences sharedPreferences;
     checkLoginStatus()async{
    sharedPreferences=await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token")==null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginPage()), (Route<dynamic>route) => false);
    }
  }
   
  @override
  void initState() { 
    super.initState();
   checkLoginStatus();
  }
    


  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: (){
       sharedPreferences.clear();
             ///ignore: deprecated_member_use
             sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginPage()), (Route<dynamic>route) => false);
     },
        child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Color(0xFFEB0EC29E),
                child: Image(image: AssetImage('assets/images/logo1.png'),)
      ),
   );
  
  }
}
