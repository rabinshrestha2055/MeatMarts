import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masu_bazar/model/dialog.dart';
import 'package:masu_bazar/model/error_dialog.dart';
import 'package:masu_bazar/model/http_model.dart';
import 'package:masu_bazar/model/user_model.dart';
import 'package:masu_bazar/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);
  

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
 @override
 void initState() { 
   super.initState();
   _passwordVisible=false;
 }
   bool _passwordVisible;
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();
   final TextEditingController usernameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
   final TextEditingController confirmController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
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
            ListView(
               children: [
                 headerSection(),
                  Row(
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
                Text("Sign Up",style: TextStyle(
                  fontSize: 25.0,
                
                  fontWeight: FontWeight.bold
                ),),
                   TextFormField(
                     validator: (String value){
                       if(value.isEmpty){
                         return 'Username is required';
                       }
                     },
                controller: usernameController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Colors.blue[700],),
                  hintText: "Username",
                  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
                 SizedBox(height: 20.0,),
              TextFormField(
                controller: emailController,
                 validator: (String value){
                       if(value.isEmpty){
                         return 'Email is required';
                       }
                     },
                cursorColor: Colors.white,
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
                 validator: (String value){
                       if(value.isEmpty){
                         return 'Password is required';
                       }
                     },
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.black),
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock,color: Colors.blue[700],),
                  hintText: "Password",
                  
                  
                  suffixIcon: IconButton(
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
                 SizedBox(height: 20.0,),
                 TextFormField(
                controller: confirmController,
                 validator: (String val){
                  if(val.isEmpty)
                  return 'Confirm Password is required';
                  if(val != passwordController.text)
                  return "password doesn't match";
                    return null;
                  },
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  icon: Icon(Icons.lock,color: Colors.blue[700],),
                  hintText: "Confirm Password",
                  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(height: 20,),
              
                 Container(
    
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: RaisedButton(
                      disabledColor: Colors.blue,
                      color:Colors.blue[700],
                      
                      onPressed: (){
                        setState(() {
                          if(_formKey.currentState.validate()){
                            String inputUsername=usernameController.text;
                            String inputEmail=emailController.text;
                            String inputPassword=passwordController.text;
                             UserModel userModel=UserModel(
                               username: inputUsername,
                               email: inputEmail,
                               password: inputPassword,
                               confirmPassword: confirmController.text
                             );
                             userDetaailsPost(userModel)
                             .then((response){
                               print(response.body);
                               if(response.statusCode==201){
                                 
                                 showDialog(context: context,
                                   builder: (context) => Dialogs(),
                                 );
                               }else{
                               showDialog(
                              context:context,
                              builder: (context) => ErrorDialog(),
                             );

                            }
                             }).catchError((error)=>print(error));
                          }
                        
                        });
                      
                      },

                      elevation: 5.0,
                      
                      child: Text('Sign Up',style: TextStyle(color: Colors.white,letterSpacing:1),),
                      
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(25.0)
                        ),
                      
                    ),
                      ),
                                  

                   ],
                  ),
                  ),
                ),
               ),
                ],
            ),
 
                
               ],
             )
         ],
       ),
         
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

}