//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';


class eed extends StatefulWidget {
  String myvar;
  eed({this.myvar});
  @override
  _eedState createState() => _eedState(myvar);
}

class _eedState extends State<eed> {
   String myvar;// faculty name 
  _eedState(this.myvar);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E.E PANEL"),
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
  _ListpageState(this.myvar);
  var flag=0;
  int k;
 
 
  Future data;
 Future getPosts()
 async {
   var firestore=Firestore.instance;
   //var firestore=Firestore.instance;
   QuerySnapshot qn= await firestore.collection('EE').where("Approved by Hod",isEqualTo:"yes").getDocuments();
   return qn.documents;  

   
  }
  Future getlength() async{
     Firestore.instance.collection('EE').getDocuments().then((myDocuments){
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
         Image.asset("assets/loader.gif")
        
         );
       }
       else{
        return
         Column(children: <Widget>[
           
          
          Container(
            child: Flexible( 
              child: 
            Image.asset("assets/bp.png")
            
            
            
            )

            
            
            

          ),
          Card(child: 
          Text("Dear $myvar you have"  +" $length "+ "application request",style: TextStyle(fontSize: 20.0,fontFamily: "PermanentMarker"),),
          color: Color.fromRGBO(46, 63, 229,100),
         shape:RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  
          ),
          
          Text("Application leave :"),
          
          Expanded(child:
           ListView.builder(
             
            // physieed:nev,
          itemCount: snapshot.data.length,
          itemBuilder:(_,index){
            return Card(child: 
             ListTile(
            title:Text(snapshot.data[index].data['Name']),
            subtitle: Text(snapshot.data[index].data['Application submittion date']+"\n Approved by you:"+snapshot.data[index].data['Approved by Principal']+"\n At"+snapshot.data[index].data['Date of Princi approval']+snapshot.data[index].data['Time of Princi approval']),
            
          
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
  String check;
  String rejection;
  String myvar;
  var data;
  var cl ;
  var el;
  int deductcl;
  var gap;
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

    databasereference.collection("EE")
                      .document(widget.post.data["doc name"])
                      .updateData({

                      "Approved by Principal":"approved",
                        "Princi digi signature":"$myvar",
                        "Date of Princi approval":"$date",
                        "Time of Princi approval":"$cur",
                        "Princi status":"Approved by principal"
                        

                      });



    

  }
  void rejected()
  {
     databasereference.collection("EE")
                      .document(widget.post.data["doc name"])
                      .updateData({

                        "Approved by Principal":"No",
                        "rejection's reason Princi":"$rejection",
                        "Princi digi signature":"$myvar",
                        "Date of Princi Rejection":"$date",
                        "Time of Princi Rejection":"$cur",
                        "Princi status":"rejected by principal"
                        

                      }
                      );


  }
 
 
getemps()
 async {
   // it is also possible that we can also use employee id in document also
  
   check=widget.post.data["employee id"];
   databasereference
      .collection(check)
      
      .getDocuments()
      
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((b)
    {
     
      print('${b['CL']}');
      setState(() {
      cl=double.parse('${b['CL']}');
      print(cl);
      el=double.parse('${b['EL']}');
      print(el);
        

      });
     
     

    });
 
    
    
    
 });
  
   
  }
   @override
  void initState()
  {
    super.initState();
     SchedulerBinding.instance.addPostFrameCallback((_) {
  // your code after page opens,splash keeps open until work is done

    
   
    getemps();
    });

    
  }
  void leave_deductor(){
    var fixgap;
    
    var deduct;
    gap=double.parse(widget.post.data['leave gap']);

    fixgap=gap+1.0;
    //print(fixgap);
    
   
    
    if(widget.post.data['leave type']=="CL"){
      
      deduct=cl-fixgap;
      databasereference.collection(widget.post.data['employee id'])
                      .document(widget.post.data['employee id'])
                      .updateData({

                        "CL":"$deduct"
                        

                      }
                      );
      

     

    }
    else if(widget.post.data['leave type']=="EL"){
       deduct=el-fixgap;
        databasereference.collection(widget.post.data['employee id'])
                      .document(widget.post.data['employee id'])
                      .updateData({

                        "EL":"$deduct",
                        

                      }
                      );
      



    }
     else if(widget.post.data['leave type']=="Emergency"){
       deduct=cl-fixgap;
        databasereference.collection(widget.post.data['employee id'])
                      .document(widget.post.data['employee id'])
                      .updateData({

                        "CL":"$deduct",
                        

                      }
                      );
     }
      
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
    
    k.child('eeintrpt')
     
     .update({
      'title noti':'$myvar' 
  //yes I know.
});
  }
   notiaccepted() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('notification')
     
     .update({
      'title noti':'$myvar' 
  //yes I know.
});
  }
  notirejected() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('facultyrejectnoti')
     
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
      body:SingleChildScrollView(child: 
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
       
            //Text("Arrangement request: "+widget.post.data["Arrangement request"],style: TextStyle(fontSize: 25.0),),
         RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Hod recommendation: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["recommended by the Hod "],style: TextStyle(color: Colors.green,fontSize: 17.0)),
              
              

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
        Container(child: 
      
            //Text("Arrangement request: "+widget.post.data["Arrangement request"],style: TextStyle(fontSize: 25.0),),
         RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Digi sign hod: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["HOD digital signature"],style: TextStyle(color: Colors.green,fontSize: 17.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
       

        
         ),
          Container(child: 
        
            //Text("Arrangement request: "+widget.post.data["Arrangement request"],style: TextStyle(fontSize: 25.0),),
         RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Hod approval time: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Time of hod 's approval"],style: TextStyle(color: Colors.green,fontSize: 17.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        

        
         ),
          Container(child: 
       
            //Text("Arrangement request: "+widget.post.data["Arrangement request"],style: TextStyle(fontSize: 25.0),),
         RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Hod approval Date: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Date of hod 's approval"],style: TextStyle(color: Colors.green,fontSize: 17.0)),
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        

        
         ),
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
                      
                       
                       leave_deductor();
                       accept();
                       success();
                       flag=1;
                       noti();
                       notiaccepted();
                      

                    
                      
                     
                      
                     
                     
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
                        noti();
                        notirejected();
                       
                        
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
                   //------------principal dashboard-------
                     Container(child: 
        Flexible(child: 
           //Text("Application Submition Date: "+widget.post.data["Application submittion date"],style: TextStyle(fontSize: 25.0),),
            RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"This Faculty has:",style: TextStyle(color: Colors.black,fontSize: 21.0)),
              TextSpan(text:"\n cl:$cl"+""+" El:$el",style: TextStyle(color: Colors.red,fontSize: 20.0)),
              


              
              

            ],
            

      
            ) 
            
            
            ),
        
        
        )

        
         ),







         



      ],) 
      
      )
      
    ));
  }
}