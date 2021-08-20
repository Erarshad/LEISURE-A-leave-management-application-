import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:jittl/hods/hodap.dart';
import 'package:jittl/hods/hodcs.dart';
import 'package:jittl/hods/hodece.dart';
import 'package:jittl/hods/hodee.dart';
import 'package:jittl/hods/hodme.dart';
import 'package:jittl/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jittl/login setup/database_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jittl/role/princi.dart';
import 'package:jittl/hods/hodce.dart';
import 'package:jittl/hods/hodece.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String roleprinci;
  String hodcs;
  String hodme;
  String hodce;
  String hodee;
  String hodece;
  String hr;
  String polyprinci;
  String hodap;
 

  
 
  
  

  
   String myvar;
  _save() async {

    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value =myvar;
    prefs.setString(key, value);
    print('saved: $myvar');
    
  }
   
  // for error reporting
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
  final databaseReference1 = Firestore.instance;
 void check1()// getting data from firebase for multiple role 
 {// this one for principal role admin
 // what iam doing here?
 // iam putting the mail who is going to the principal as admin manully in firestore then i will fetch it 
 // then we use if else method to make condition to push on admin page
   
  databaseReference1
      .collection("principal")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) 
    {
      print("$_email");
      print('${f.data}');
      roleprinci='${f.data}';
    

    });
    
    
    
  });
  // we will check 4 hods and hr also 
 
 databaseReference1
      .collection("Hodcse")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((h) 
    {
      print("$_email");
      print('${h.data}');
      hodcs='${h.data}';
    

    });
    
    
    
  });
   databaseReference1
      .collection("Hodme")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((m) 
    {
      print("$_email");
      print('${m.data}');
      hodme='${m.data}';
    

    });
    
    
    
  });
     databaseReference1
      .collection("Hodce")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((c) 
    {
      print("$_email");
      print('${c.data}');
      hodce='${c.data}';
    

    });
    
    
    
  });
       databaseReference1
      .collection("Hod ee")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((e) 
    {
      print("$_email");
      print('${e.data}');
      hodee='${e.data}';
    

    });
    
    
    
  });
   databaseReference1
      .collection("Hod ece")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((m) 
    {
      print("$_email");
      print('${m.data}');
      hodece='${m.data}';
    

    });
    
    
    
  });
 
   databaseReference1
      .collection("polyprinci")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((p) 
    {
      print("$_email");
      print('${p.data}');
      polyprinci='${p.data}';
    

    });
    
    
    
  });
    databaseReference1
      .collection("Hodap")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((b) 
    {
      print("$_email");
      print('${b.data}');
      hodap='${b.data}';
    

    });
    
    
    
  });


 


 }
  @override
  void initState() {
    super.initState();
 SchedulerBinding.instance.addPostFrameCallback((_) {
  // your code after page opens,splash keeps open until work is done
  check1();
  datainfo();
});
}
 
 

 // this is working // role based authentication and login
 Future<void> roleauthentication()
 async {
    
   if("{admin: "+"$_email}"==roleprinci)
   { 
     // for principal role
       print("working ");
  
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
    
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => princi(myvar:myvar,)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }
  

   
     
   }

   else if("{admin: "+"$_email}"==hodcs)
   {
     print("hod cs");
     //  if user is normal then it will go on selection page
      if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cs(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }
  //--

   }
   else if("{admin: "+"$_email}"==hodme)
   {
     print("me hod");
     if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => me(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }
     //----

   }
   else if("{admin: "+"$_email}"==hodce)
   {
      if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ce(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }
     

   }
    else if("{admin: "+"$_email}"==hodee)
   {
     print("hod ee");
      if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ee(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }

   }
    else if("{admin: "+"$_email}"==hodece)
   {
      if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ece(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }

   }
  
    else if("{admin: "+"$_email}"==polyprinci)
   {
     print("polytech princi");

   }
  else if("{admin: "+"$_email}"==hodap)
   {
      if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ap(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }

   }
   else 
   {
     //  if user is normal then it will go on selection page
      if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myApp(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }
  

   }


   






    

   
   
// note here i will made signin button that will push replased to the princi screen
// else note equal the then it will work as normal 
 }
 
  //_____this is for check internet connection ______ 
  datainfo() async
  {
    // this is the algo of checking internet if not then it will show not connected
    try {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    print('connected');
    
    
  }
} on SocketException catch (_) {
  print('not connected');
   var alertDialog=AlertDialog(
     title: Text("You Are not connected to 📴 internet dear $myvar"),
     content: Text("please check your internet connection "),


   );
   showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
}


  }
  //___
  


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  

  @override
  
  Widget build(BuildContext context) {
    return new Scaffold(
     // appBar: new AppBar(),
      body:Builder(
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
        child:
         Column(

      

          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(child: 
            
              TextField(
              //this for storing value in text field 
              onChanged:(text){
              myvar=text;
              },
              textCapitalization: TextCapitalization.sentences,
              //for capitalizing the word in  the text field 

          



             // maxLength: 20,
              maxLines: 1,
               decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Please Enter valid name",
                  fillColor: Colors.white,
                   prefixIcon: Icon(Icons.perm_identity),
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),

            
      
      
               ),
     
      
      
      
             ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                




              )
              
              
              
              ,

             
              
             
              
            ),),
            Flexible(child: 
            TextField(
             
              onChanged:(text){
              _email=text;
              if (_email.isEmpty){
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
             
            ),),

            Flexible(child: 
            TextField(
              // validator: (input) {
              //   if(input.length < 6){
              //     return 'Longer password please';
              //   }
              // },
              onChanged:(text){
              _password=text;
              if (_password.length<6){
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
              
              obscureText: true,
            ),),
            Flexible(child: 
            RaisedButton(
              onPressed:(){
                 
                

                
                //signIn();
                _save();
                datainfo();
                roleauthentication();
                //check1();
               // check2();
                

              },
              color: Colors.lightBlue,
              child: Text('Sign in',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              
              
              ),
            ),
            ))],
        )
      ),
        ])));
  }
  
   
  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
      //  FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         final FirebaseUser user =(await _auth.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )).user;
        
        Navigator.push(context, MaterialPageRoute(builder: (context) => myApp(myvar: myvar)));
      }catch(e){
        error(e.message);
        print(e.message);
      }
    }
  }
}