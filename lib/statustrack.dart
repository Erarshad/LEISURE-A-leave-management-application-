import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';


class csed1 extends StatefulWidget {
 
  @override
  _csed1State createState() => _csed1State();
}

class _csed1State extends State<csed1> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Status Panel"),
      backgroundColor: Color.fromRGBO(46, 63, 229,100),
      ),
      body: Listpage(),
      
    );
  }
}
class Listpage extends StatefulWidget {
  

  @override
  _ListpageState createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  var name;
  var date;
  

 
  int length;
 
  var flag=0;
  int k;
  var dept;
  @override
void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      status();
    
    
    
      
    });
    


    
    
   
    
   

       
  }
 
 
  Future data;
  status ()
  async {
    final prefs1 = await SharedPreferences.getInstance();
    final prefs2 = await SharedPreferences.getInstance();
    final prefs3 = await SharedPreferences.getInstance();
    setState(() {
    name= prefs1.getString('name');
    
      
    });
    setState(() {
      date=prefs2.getString("applydate");
  
    });
    setState(() {
       dept= prefs3.getString('dept');
    });
   //-----it will fetch all data after the fetching from sharedprefrences
   data=getPosts();
   

  }
 Future getPosts()
 
 async {
   
   var firestore=Firestore.instance;
   //var firestore=Firestore.instance;
   QuerySnapshot qn= await firestore.collection('$dept').where("doc name",isEqualTo:"$name"+"$date").getDocuments();
   return qn.documents;  

   
  }
   void navigateTodetail(DocumentSnapshot post){
  
  Navigator.push(context,MaterialPageRoute(builder: (context)=>detailpage(post:post)));
   
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
            Image.asset("assets/panel.png")
            
            
            
            )

            
            
            

          ),
          Card(child: 
          Text("Dear $name check your recent " + "application Status",style: TextStyle(fontSize: 20.0,fontFamily: "PermanentMarker"),),
          color: Color.fromRGBO(46, 63, 229,100),
         shape:RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  
          ),
          
          Text("Application leave :"),
          
          Expanded(child:
           ListView.builder(
             
            // physicsed:nev,
          itemCount: snapshot.data.length,
          itemBuilder:(_,index){
            return Card(child: 
             ListTile(
            title:Text(snapshot.data[index].data['Name']),
            subtitle: Text(snapshot.data[index].data['Application submittion date']+"\n"+"Approved by Hod:"+snapshot.data[index].data['Approved by Hod'] +"\n"+"Approved by Principal:"+snapshot.data[index].data['Approved by Principal']),
            
          
            trailing: Icon(Icons.lock),
            selected: true,
            onTap: (){navigateTodetail(snapshot.data[index]);}
           
           
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
  
  detailpage({this.post});
  

  @override
  _detailpageState createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
 
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,

      appBar: AppBar(title: Text("Status of "+widget.post.data["Name"]+"'s recent leave"),),
      body:SingleChildScrollView(child: 
      Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Flexible(child: 
          Card(child: 
           RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"Application Submission Time: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Application submittion  time"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Application Submission Date: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Application submittion date"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Name: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Name"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
                TextSpan(text:"Employee Id:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["employee id"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
                TextSpan(text:"Reason of leave:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["reason of leave"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              
              
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Department: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Department"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Your Designation: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["designation"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"You have requested leave from: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["leave from"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"You have requested leave to: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["leave to"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"You have requested leave mode: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["leave type"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Approved by Hod: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Approved by Hod"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Hod digital Sign: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["HOD digital signature"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Recommend by Hod: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["recommended by the Hod "],style: TextStyle(color: Colors.green,fontSize: 20.0)),

               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Time of Hod's Approval: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Time of hod 's approval"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Date of Hod's Approval: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Date of hod 's approval"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Rejection's reason from Hod office: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["rejection 's reason from the Hod"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Date of Hod's rejection: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Date of hod 's Rejection"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Time of Hod's rejection: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Time of hod 's Rejection"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Approved by Principal: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Approved by Principal"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text:"Digital sign of principal: ",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Princi digi signature"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              // Principal of B.tech digital signature iam using we can change but it will also use in the window of ak mishra sir
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Time of principal Approval :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Time of Princi approval"],style: TextStyle(color: Colors.green,fontSize: 20.0)),


                TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"date of principal Approval :",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Date of Princi approval"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Rejection 's reason from Principal Office:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["rejection's reason Princi"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Principal's rejection date:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Date of Princi Rejection"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               TextSpan(text: "\n",style: TextStyle(color: Colors.green,fontSize: 20.0)),
              TextSpan(text:"Principal's rejection time:",style: TextStyle(color: Colors.blue,fontSize: 21.0)),
              TextSpan(text:widget.post.data["Time of Princi Rejection"],style: TextStyle(color: Colors.green,fontSize: 20.0)),
               
              
              
              
              
              

            ],
            

      
            ) 
            
            
            ),
        
        
       

         

          
          )
          )
        ],)
      ],

      )
    ));
  }
}