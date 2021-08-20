//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jittl/role/cseprincicontrol.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jittl/role/meprincicontrol.dart';
import 'package:jittl/role/apprincicontrol.dart';
import 'package:jittl/role/ceprincicontrol .dart';
import 'package:jittl/role/eeprincicontrol.dart';
import 'package:jittl/role/eceprincicontrol.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



class princi extends StatefulWidget {
  String myvar;
  princi({this.myvar});
  @override
  _princiState createState() => _princiState(myvar);
}

class _princiState extends State<princi> {
   String myvar;// faculty name 
  _princiState(this.myvar);
  //---
   String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
void initState()
{
  super.initState();
  setState(() {
     //leavequota();
     //------notifictation
       var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg)}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {
        showNotification(msg);
        print(" onMessage called ${(msg)}");
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    firebaseMessaging.getToken().then((token) {
      update(token);
    });
  });
  //------

     
    
  
 
}
//----
showNotification(Map<String, dynamic> msg) async {
    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    // await flutterLocalNotificationsPlugin.show(
    //     0, "Dear Hod ", "you have one or more notification", platform
    //     );
  }

  update(String token) {
    print(token);
    DatabaseReference databaseReference = new FirebaseDatabase().reference();
    databaseReference.child('fcm-tokenprinci/${token}').set({"token": token});
    textValue = token;
    setState(() {});
  }
 
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Principal Of Engineering"),
      backgroundColor: Color.fromRGBO(46, 63, 229,100),
      ),
      body: Listpage(myvar),
      
    );
  }
}
class Listpage extends StatefulWidget {
  String myvar;
  Listpage(this.myvar);

  @override
  _ListpageState createState() => _ListpageState(myvar);
}

class _ListpageState extends State<Listpage> {
  

  String myvar;
  int length;
  int length1;
  int length2;
  int length3;
  int length4;
  int length5;
  _ListpageState(this.myvar);
  var flag=0;
  int k;
  Future getlength() async{
     Firestore.instance.collection('CSE').getDocuments().then((myDocuments){
     setState(() {
        length=myDocuments.documents.length;
        //it will set the gui for dynammic value thatswhy iam using setstate
       
     });
     
});


  }
   Future getlength1() async{
     Firestore.instance.collection('ME').getDocuments().then((myDocuments){
      setState(() {
        length1=myDocuments.documents.length;
        

      });
      

});


  }
   Future getlength2() async{
     Firestore.instance.collection('EE').getDocuments().then((myDocuments){
     setState(() {
       length2=myDocuments.documents.length;
       
     });
      
});


  }
   Future getlength3() async{
     Firestore.instance.collection('CE').getDocuments().then((myDocuments){
     setState(() {
       length3=myDocuments.documents.length;
       
     });
      
});


  }
  Future getlength4() async{
     Firestore.instance.collection('ECE').getDocuments().then((myDocuments){
     setState(() {
       length4=myDocuments.documents.length;
       
     });
      
});


  }
   Future getlength5() async{
     Firestore.instance.collection('Applied Science').getDocuments().then((myDocuments){
     setState(() {
        length5=myDocuments.documents.length;
       
     });
     
});


  }
  @override
  void initState()
  {
    super.initState();
      setState(() {
     getlength();
    getlength1();
    getlength2();
    getlength3();
    getlength4();
    getlength5();
         
       });
  }

  

 
 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Column(children: <Widget>[
       
          Flexible(child: 
          Container(
            child: 
            Image.asset("assets/bp.png")
            
            
      
          ),),
          


       
        
          
         Card(child: 
          Text(" Dear $myvar you have leave Applications are :\n CSE:$length  ME: $length1  CE:$length3 \n EE: $length2  ECE:$length4 As:$length5" ,style: TextStyle(fontSize: 20.0,fontFamily: "PermanentMarker")),
          color: Color.fromRGBO(46, 63, 229,100),
         shape:RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  
          ),
          
        
        
        
        
        Expanded(child: 
        ListView(
  children: ListTile.divideTiles(
      context: context,
      tiles: [
        Card(child:
        ListTile(
          title: Text('CSE'),
          subtitle:Text ("$length"),
          trailing: Icon(Icons.keyboard_arrow_right),
          

          onTap:(){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>csed(myvar:myvar)));
   

          },
          selected: true,
           
        ),),
        Card(child: 
        ListTile(
          title: Text('ME'),
          subtitle:Text ("$length1"),
          selected: true,
          trailing: Icon(Icons.keyboard_arrow_right),

          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>med(myvar:myvar)));
   


          }
          
        ),
        
        ),
        Card(child:
        ListTile(
          title: Text('CE'),
          subtitle:Text ("$length3"),
           selected: true,
           trailing: Icon(Icons.keyboard_arrow_right),

          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>ced(myvar:myvar)));
   

          }
        ),),
        Card(child: 
        ListTile(
          title: Text('EE'),
          subtitle:Text ("$length"),
           selected: true,
           trailing: Icon(Icons.keyboard_arrow_right),

          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>eed(myvar:myvar)));
   

          }
        ),),
        Card(child: 
        ListTile(
          title: Text('ECE'),
          subtitle:Text ("$length4"),
           selected: true,
           trailing: Icon(Icons.keyboard_arrow_right),


          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>eced(myvar:myvar)));
   

          }
        ),),
          Card(child: 
        ListTile(
          title: Text('Applied Science'),
          subtitle:Text ("$length5"),
           selected: true,
           trailing: Icon(Icons.keyboard_arrow_right),


          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>apd(myvar:myvar)));
   

          }
        ),)
        
      ]
  ).toList(),
)
        
        
        
        
        
        )
       
      ],),
      
    );
  }
  
}// root braces



