//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ce extends StatefulWidget {
  String myvar;
  ce({this.myvar});
  @override
  _ceState createState() => _ceState(myvar);
}

class _ceState extends State<ce> {
   String myvar;// faculty name 
  _ceState(this.myvar);
  //---------
  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
      void initState()
{
  super.initState();
  setState(() {
     
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
    await flutterLocalNotificationsPlugin.show(
        0, "This is title", "this is demo", platform);
  }

  update(String token) {
    print(token);
    DatabaseReference databaseReference = new FirebaseDatabase().reference();
    databaseReference.child('fcm-tokence/${token}').set({"token": token});
    textValue = token;
    setState(() {});
  }
//-------
//---------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Head of Department"),
      backgroundColor: Color.fromRGBO(50, 65, 228,100),
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
  _ListpageState(this.myvar);
  var flag=0;
  int k;
 
 
  Future data;
 Future getPosts()
 async {
   var firestore=Firestore.instance;
   QuerySnapshot qn= await firestore.collection('CE').getDocuments();
   return qn.documents;  
 

   
  }
  Future getlength() async{
     Firestore.instance.collection('CE').getDocuments().then((myDocuments){
      length=myDocuments.documents.length;
});


  }

 void navigateTodetail(DocumentSnapshot post){
  
  Navigator.push(context,MaterialPageRoute(builder: (context)=>detailpage(post:post,myvar:myvar)));
   
}

@override
void initState() {
    // TODO: implement initState
    super.initState();
    data=getPosts();
    getlength();

    
    
   
    
   

       
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
   body:
   
    Container(
      
     child: FutureBuilder(
       
       future: data,
       
       builder: (_, snapshot){
         
          
       if(snapshot.connectionState==ConnectionState.waiting){
         return Center(child: 
         Image.asset('assets/loader.png')
        
         );
       }
       else{
        return
         Column(children: <Widget>[
           
          
          Container(
            child: Flexible( 
              child: 
            Image.asset("assets/ceh.png")
            
            
            
            )

            
            
            

          ),
          Card(child: 
          Text("Dear $myvar you have"  +" $length "+ "application request",style: TextStyle(fontSize: 20.0,fontFamily: "PermanentMarker")),
          color: Color.fromRGBO(50, 65, 228,100),
         shape:RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  
          ),
          
          Text("Application leave :"),
          
          Expanded(child:
           ListView.builder(
             
            // physice:nev,
          itemCount: snapshot.data.length,
          itemBuilder:(_,index){
            return Card(child: 
             ListTile(
            title:Text(snapshot.data[index].data['Name']),
            subtitle: Text(snapshot.data[index].data['Application submittion date']+"\n"+snapshot.data[index].data['Hod status']),
            
          
            trailing: Icon(Icons.keyboard_arrow_right),
            selected: true,
           
            onTap:()
            {
               
              navigateTodetail(snapshot.data[index]);
             

          } ,
            ));
          
          })

          
          )
        ],);
        //------list vew wrapped in column
       
       }
     }
     
     
     ),
    ));
  }
 
}// root braces



class detailpage extends StatefulWidget {
  
 

  final DocumentSnapshot post;
  String myvar;
  detailpage({this.myvar, this.post});
  

  @override
  _detailpageState createState() => _detailpageState(myvar);
}

class _detailpageState extends State<detailpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  String rejection;
  String myvar;
  _detailpageState(this.myvar);

  var now=DateTime.now();
  //var cur=DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.now());
  var cur=DateFormat(' hh:mm aa').format(DateTime.now());
  var date=DateFormat("dd-MM-yyyy").format(DateTime.now());
var flag=0;


  void rejec()
  { 
  
    var alertDialog=AlertDialog(
     title: Text("please fill the reason of rejection"),
     
     content: TextField(onChanged: (text){
       rejection=text;

     },
     

     ),
     actions: <Widget>[
              new FlatButton(
                child: new Text('Submit and reject'),
                onPressed: () {
                 // print(rejection);
                 
                 rejected();
                 Navigator.of(context).pop();
                 success();
                },
              )
            ],


   );
   showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
  }
  final databasereference=Firestore.instance;
  void accept()
  {

    databasereference.collection("CE")
                      .document(widget.post.data["doc name"])
                      .updateData({

                        "Approved by Hod":"yes",
                        "HOD digital signature":"$myvar",
                        "Date of hod 's approval":"$date",
                        "Time of hod 's approval":"$cur",
                        "Hod status":"Approved by you"
                        

                      });



    

  }
  void rejected()
  {
     databasereference.collection("CE")
                      .document(widget.post.data["doc name"])
                      .updateData({

                        "Approved by Hod":"No",
                        "rejection 's reason from the Hod":"$rejection",
                        "HOD digital signature":"$myvar",
                        "Date of hod 's Rejection":"$date",
                        "Time of hod 's Rejection":"$cur",
                        "Hod status":"reject by you"
                        

                      }
                      );


  }
  void recommend(){
     databasereference.collection("CE")
                      .document(widget.post.data["doc name"])
                      .updateData({

                        "recommended by the Hod ":"true"
                        

                      }
                      );

  }
  void success()
  {
  _scaffoldKey.currentState.showSnackBar(
  SnackBar(
    content: Text('Successfully Task has been completed ║█║▌║█║▌│║▌║▌█║'),
    duration: Duration(seconds:7),
    ));
        
  }
  void error()
  {
     _scaffoldKey.currentState.showSnackBar(
  SnackBar(
    content: Text('You can not reject it because you had approved it \n if once you have approved then you cannot reject it'),
    duration: Duration(seconds:7),
    ));

  }
  noti() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('princi')
     
     .update({
      'title noti':'$myvar' 
  //yes I know.
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,

      appBar: AppBar(title: Text("leave application of "+widget.post.data["Name"]),),
      body:
      SingleChildScrollView(child: 
       Center(child:
      Column(children: <Widget>[
        Container(child: 
        
        
           // Text("Name: "+widget.post.data["Name"],style: TextStyle(fontSize: 25.0),),
            
            RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Name: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Name"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
            
            
            
           
           
           
            
             


            

        ),
        Container(child: 
        
        // Text("Department: "+widget.post.data["Department"],style: TextStyle(fontSize: 25.0),),
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Department: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Department"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        
        
        
        
        

        
         ),
          Container(child: 
         
        // Text("Designation: "+widget.post.data["designation"],style: TextStyle(fontSize: 25.0),),
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Designation: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["designation"],style: TextStyle(color: Colors.purple,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        
        
        
        
        

        
         ),
         //----- 
          Container(child: 
        
          //Text("Leave type: "+widget.post.data["leave type"],style: TextStyle(fontSize: 25.0),),
          RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Leave type: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["leave type"],style: TextStyle(color: Colors.red,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        
        
        
        
        
        

        
         ),
          Container(child: 
        
          //Text("Leave from:  "+widget.post.data["leave from"],style: TextStyle(fontSize: 25.0),),
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Leave from:  ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["leave from"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        
        
        
        

        
         ),
          Container(child: 
         
         //Text("Leave to: "+widget.post.data["leave to"],style: TextStyle(fontSize: 25.0),),
          RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Leave to: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["leave to"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        
        
        

        
         ),
          Container(child: 
       
         // Text("reason of leave: "+widget.post.data["reason of leave"],style: TextStyle(fontSize: 25.0),),
        RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"reason of leave: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["reason of leave"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        

        
         ),
         
          Container(child: 
       
          //Text("Application Submition time: "+widget.post.data["Application submittion  time"],style: TextStyle(fontSize: 25.0),),
        
        
         RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Application Submission time: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Application submittion  time"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        

        
         ),
          Container(child: 
       
           //Text("Application Submition Date: "+widget.post.data["Application submittion date"],style: TextStyle(fontSize: 25.0),),
            RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Application Submission Date: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Application submittion date"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        

        
         ),
        //----------
       //----for arrangement card
         Container(child: 
         Card(
           color: Colors.yellow,
           child: 
         Column(children: <Widget>[
           Text("Arrangement Request 1:-"),
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Course:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement Course1"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),// for new line
              TextSpan(text:"Sem&room no:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement semroom1"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Current Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement cursub1"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Alternate Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement altersub1"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class Start time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt starttime1"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class End time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt endtime1"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Arranged by :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arranged1"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
             




              

              

              
              

            ],
            

      
            ) 
            
            
            ),




         ],)
         
         
         )
       
        
         ),
         //2nd field of arrangement
          Container(child: 
         Card(
           color: Colors.yellow,
           child: 
         Column(children: <Widget>[
           Text("Arrangement Request 2:-"),
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Course:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement Course2"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),// for new line
              TextSpan(text:"Sem&room no:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement semroom2"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Current Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement cursub2"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Alternate Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement altersub2"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class Start time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt starttime2"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class End time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt endtime2"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Arranged by :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arranged2"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
             




              

              

              
              

            ],
            

      
            ) 
            
            
            ),




         ],)
         
         
         )
       
        
         ),
        // 3rd field of arrangement
         Container(child: 
         Card(
           color: Colors.yellow,
           child: 
         Column(children: <Widget>[
           Text("Arrangement Request 3:-"),
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Course:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement Course3"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),// for new line
              TextSpan(text:"Sem&room no:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement semroom3"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Current Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement cursub3"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Alternate Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement altersub3"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class Start time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt starttime3"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class End time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt endtime3"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Arranged by :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arranged3"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
             




              

              

              
              

            ],
            

      
            ) 
            
            
            ),




         ],)
         
         
         )
       
        
         ), 
          Container(child: 
         Card(
           color: Colors.yellow,
           child: 
         Column(children: <Widget>[
           Text("Arrangement Request 4:-"),
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Course:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement Course4"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),// for new line
              TextSpan(text:"Sem&room no:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement semroom4"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Current Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement cursub4"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Alternate Subject :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arrangement altersub4"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class Start time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt starttime4"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Class End time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["argt endtime4"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Arranged by :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["arranged"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
             




              

              

              
              

            ],
            

      
            ) 
            
            
            ),




         ],)
         
         
         )
       
        
         ),


       //-----
        
         Container(
                      padding:EdgeInsets.all(10.0),
                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(child: 
                          Container(
                  width: 350.0,
                  //height: MediaQuery.of(context).size.height*0.35,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: ()
                    {
                      
                       accept();
                       success();
                       flag=1;
                       noti();

                    
                      
                     
                      
                     
                     
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.checkCircle,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      'Accept With Digital Signature',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green,fontSize: 20.0,),
                    ),
                    



                    ],),
                   
                  ),
                )
                ),)
                   ],) 
                   
                   ),
//----
              Container(
                      padding:EdgeInsets.all(10.0),
                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(child: 
                          Container(
                  width: 250.0,
                  //height: MediaQuery.of(context).size.height*0.35,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: ()
                    {
                      recommend();
                      success();
                     
                     
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.react,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      'Recommend',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green,fontSize: 20.0,),
                    ),
                    



                    ],),
                   
                  ),
                )
                ),)
                   ],) 
                   
                   ),

       //--------
        Container(
                      padding:EdgeInsets.all(10.0),
                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(child: 
                          Container(
                  width: 350.0,
                  //height: MediaQuery.of(context).size.height*0.35,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: ()
                    {
                      
                      if(flag==1)
                      {
                        error();


                      }
                      else
                      {
                        rejec();
                        
                      }
                      
                     
                     
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.notEqual,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      'Reject With Digital Signature',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green,fontSize: 20.0,),
                    ),
                    



                    ],),
                   
                  ),
                )
                ),)
                   ],) 
                   
                   ),







         



      ],) 
      
      )
      
    ));
  }
}