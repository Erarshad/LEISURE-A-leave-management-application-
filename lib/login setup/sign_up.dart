import 'package:firebase_auth/firebase_auth.dart';
import 'package:jittl/login setup/sign_in.dart';
import 'package:flutter/material.dart';
import'package:jittl/login setup/sign_up.dart';
import'package:jittl/login setup/database_helpers.dart';


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jittl/login setup/database_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;
 // String mail;
  String mail;
  String emp;
 _save() async {

    final prefs = await SharedPreferences.getInstance();
    final key = 'empid';
    final value =emp;
    prefs.setString(key, value);
    print('saved: $emp');
    
  }
 
 void error(String e)
 {
   
   var alertDialog=AlertDialog(
     title: Text("$e"),
     content: Text("Please fix then Continue"),


   );
   showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
 }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     //  appBar: new AppBar(),
    
      body:
      Builder(
        builder: (context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width,
             height:  MediaQuery.of(context).size.height,
                child: Image.asset('assets/bg.png',
                   
                   
                   fit: BoxFit.fill,
                   color: Color.fromRGBO(255, 255, 255, 0.6),
                  colorBlendMode: BlendMode.modulate
                ),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: <Widget>[
              Container(
              height: MediaQuery.of(context).size.height*0.45,
                
              child:
              Image.asset('assets/1.png')

              )





          ],






          ),
          
      
      
      
      
      
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
             Flexible(child:
  
            TextFormField(

              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an Employee id';
                }
              },
             decoration: InputDecoration(
                   labelText: "Employee id",
                  hintText: "Please Enter valid Employee id",
                  fillColor: Colors.white,
                   prefixIcon: Icon(Icons.card_membership),
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),

            
      
      
               ),
     
      
      
      
             ),
              onSaved: (input) {
                emp = input;


                
                
                

              },
              
              
            ),),
            //-----
            Flexible(child:
  
            TextFormField(

              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
             decoration: InputDecoration(
                   labelText: "Email",
                  hintText: "Please Enter valid Email",
                  fillColor: Colors.white,
                   prefixIcon: Icon(Icons.mail_outline),
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),

            
      
      
               ),
     
      
      
      
             ),
              onSaved: (input) {
                _email = input;


                
                
                

              },
              
              
            ),),
            Flexible(child:
            TextFormField(
              validator: (input) {
                if(input.length < 6){
                  return 'Longer password please';
                }
              },
       decoration: InputDecoration(
                   labelText: "Password",
                  hintText: "Please Enter valid password",
                  fillColor: Colors.white,
                   prefixIcon: Icon(Icons.security),
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),

            
      
      
               ),
     
      
      
      
             ),
              onSaved: (input) => _password = input,
              obscureText: true,

            ),),
            
           
            
           Flexible(
             child: 
            
            RaisedButton(
              onPressed:(){
                _save();
                signUp();
                
                




              },
              color: Colors.pink,
              
              child: Text('Sign up',style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              
              
              ),),),
            ),
          ],
        )
      ),
        ])));
  }
  //__________________________
  


  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }

  } 
}
