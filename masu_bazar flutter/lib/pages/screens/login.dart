import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masu_bazar/pages/home_page.dart';
import 'package:masu_bazar/pages/screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  void initState() { 
    super.initState();
    _passwordVisible=false;
  }
  bool _passwordVisible;
  bool _isloding=false;
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
       body: Stack(
         children: [
           Container(
               height: MediaQuery.of(context).size.height*0.7,
               width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                   color: Colors.blue[700],
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(70),
                   bottomRight: Radius.circular(70),
                 )
             ),
             ),
            _isloding?Center(child: CircularProgressIndicator(),):ListView(
               children: [
                 headerSection(),
                 textSection(),
                
               ],
             )
         ],
       ),
         
    );
  }
  signIn(String email,pass)async{
    print(email);
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
   sharedPreferences.setString("username", jsonResponse['username']);
   sharedPreferences.setString("email", jsonResponse['email']);
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>HomePage()), (Route<dynamic>route) => false);
  }else{
    setState(() {
      _isloding=false;
    });
    print(response.body);

  }
}
Widget _buttonSection()
{
  return Container(
    
width: MediaQuery.of(context).size.width,
height: 50.0,
padding: EdgeInsets.symmetric(horizontal: 15.0),
child: RaisedButton(
  disabledColor: Colors.blue,
  color:Colors.blue[700],
  
  onPressed: emailController.text=="" || passwordController.text==""?null:(){
    
    setState(() {
      
      _isloding=true;
    });
    
    signIn(emailController.text, passwordController.text);
  },
  elevation: 5.0,
   
   child: Text('Login',style: TextStyle(color: Colors.white,letterSpacing: 1.5),),
   
   shape: RoundedRectangleBorder(
     
     borderRadius: BorderRadius.circular(25.0)
     ),
  
),
  );
}
Widget textSection(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipRRect(
           borderRadius: BorderRadius.all(
             Radius.circular(20)
           ),
          child: Container(
           width: MediaQuery.of(context).size.width*0.8,
        
            decoration: BoxDecoration(
             color: Colors.white
            ),
           
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
          child: Form(
            key: _formKey,
              child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Login",style: TextStyle(
                  fontSize: 25.0,
                
                  fontWeight: FontWeight.bold
                ),),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                  validator: (String value){
                    if(value.isEmpty){
                   return 'Email Address is Required';
                      }
                     },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  icon: Icon(Icons.email,color: Colors.blue[700],),
                  hintText: "Email",
                  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
                  hintStyle: TextStyle(color: Colors.black54),
                  
                ),
              ),
              SizedBox(height: 20.0,),
                 TextFormField(
                controller: passwordController,
                cursorColor: Colors.white,
                  validator: (String value){
                         if(value.isEmpty){
                           return 'Password is Required';
                              }
                     },
                style: TextStyle(color: Colors.black),
                obscureText:!_passwordVisible,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock,color: Colors.blue[700],),
                  hintText: "Password",
                  suffixIcon:  IconButton(
                      icon: Icon(
                        _passwordVisible?Icons.visibility:Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible=!_passwordVisible;
                        });
                      },
                  ),

                  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(height: 20,),
              
                _buttonSection(),
                SizedBox(height: 10,),
                Text('Forgot password?'),
               SizedBox(height: 10,),
              Text('-OR-',),
               SizedBox(height: 10,),
              _socialIconButton(),
              SizedBox(height: 10,),
              _noAccount(),

            ],
            ),
          ),
        ),
      ),
    ],
  );
}
Container headerSection(){
  return Container(
    margin: EdgeInsets.only(top:10.0),
     padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
     child: Column(
       children: [
         Image.asset('assets/images/meatmart.png',width: 200,height: 200,),
       ],
     ),
     
  );
}
Widget _socialIconButton(){
  return GestureDetector(
    onTap: () {
      
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 25,
          child: Icon(FontAwesomeIcons.facebookF,color: Colors.blue,),
        ),
        SizedBox(width: 20,),
        CircleAvatar(
          backgroundColor: Colors.black12,
          child: Icon(FontAwesomeIcons.google,color: Colors.blue,),
        ),
      ],
    ),
  );
}
Widget _noAccount(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     Text("Don't have an account?"),
     SizedBox(width: 5,),
     GestureDetector(
       onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage(),));
       },
       child: Text("SignUp",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue,fontSize: 15),),
     )
    ],
  );
}
}
