//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils.dart';
import 'package:direct_select/direct_select.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:jittl/statustrack.dart';
import 'package:jittl/history.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



class myApp extends StatefulWidget {
  String myvar;
  myApp({this.myvar});
  @override
  _myAppState createState() => _myAppState(myvar);
}




class _myAppState extends State<myApp> {
  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  //--for notification
  String myvar;// faculty name 
  _myAppState(this.myvar);
  //String faculty=myvar;  // this will be connected to faculty 
  int quota=12;// i will connect this variable to firebase 
  String desig;
  String  reason ;
  String detail;
  //--for arrangement of class
  String course1;
  String semroom1;
  String cursub1;
  String altersub1;
  String arrange1;

  String course2;
  String semroom2;
  String cursub2;
  String altersub2;
  String arrange2;

  String course3;
  String semroom3;
  String cursub3;
  String altersub3;
  String arrange3;

  String course4;
  String semroom4;
  String cursub4;
  String altersub4;
  String arrange4;

  

  //---
  var a;
  var temp;
  var temp2;
  var from;
  var fromc;
  var frommonth;
  var fromyear;
  var frombuild;
  var empid;
  var eid;// for sharedprefrences because it will use in dashboard
  double cl1;// for dashboard of leave
  double el1;// for dashboard of leave
 
  var now=DateTime.now();
 
  //var cur=DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.now());
  var cur=DateFormat(' hh:mm aa').format(DateTime.now());
  var date=DateFormat("dd-MM-yyyy").format(DateTime.now());

  
 
   
    final elements1 = [
    "CSE",
    "ME",
    "CE",
    "EE",
    "ECE",
    "Applied Science"
    
  ];
   final elements2 =[
    "CL",
    "EL",
     "OD",
     "LWP",
     "Emergency"
     
    
  ];
  int selectedIndex1 = 0,
      selectedIndex2 = 0,
      selectedIndex3 = 0,
      selectedIndex4 = 0;
    // iam using selectedIndex after alphabet because it will not depend on previous index
  int selectedIndexa = 0,
      selectedIndexb = 0,
      selectedIndexc = 0,
      selectedIndexd = 0;
     
      
  
 List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }
  List<Widget> _buildItems2() {
    return elements2
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }
  //--for time select---
  TimeOfDay _time1=TimeOfDay.now();
  
  Future<Null>selectTime1(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time1

    
    );
    if(picked!=null && picked!=_time1)
    {
      setState(() {
      _time1=picked;
      print(_time1);
    });

    }
    
    

   //it will use for starting time 



  }
    //--for time select---
  TimeOfDay _time2=TimeOfDay.now();
  
  Future<Null>selectTime2(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time2

    
    );
    if(picked!=null && picked!=_time2)
    {
      setState(() {
      _time2=picked;
      print(_time2);
    });

    }

   //it will use for starting time 



  }
   TimeOfDay _time3=TimeOfDay.now();
  
  Future<Null>selectTime3(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time3

    
    );
    if(picked!=null && picked!=_time3)
    {
      setState(() {
      _time3=picked;
      print(_time3);
    });

    }

   //it will use for starting time 



  }
   TimeOfDay _time4=TimeOfDay.now();
  
  Future<Null>selectTime4(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time4

    
    );
    if(picked!=null && picked!=_time4)
    {
      setState(() {
      _time4=picked;
      print(_time4);
    });

    }

   //it will use for starting time 



  }
   TimeOfDay _time5=TimeOfDay.now();
  
  Future<Null>selectTime5(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time5

    
    );
    if(picked!=null && picked!=_time5)
    {
      setState(() {
      _time5=picked;
      print(_time5);
    });

    }

   //it will use for starting time 



  }
   TimeOfDay _time6=TimeOfDay.now();
  
  Future<Null>selectTime6(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time6

    
    );
    if(picked!=null && picked!=_time6)
    {
      setState(() {
      _time6=picked;
      print(_time6);
    });

    }

   //it will use for starting time 



  }
   TimeOfDay _time7=TimeOfDay.now();
  
  Future<Null>selectTime7(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time7

    
    );
    if(picked!=null && picked!=_time7)
    {
      setState(() {
      _time7=picked;
      print(_time7);
    });

    }

   //it will use for starting time 



  }
   TimeOfDay _time8=TimeOfDay.now();
  
  Future<Null>selectTime8(BuildContext context) async {
    TimeOfDay picked;
    picked=await showTimePicker(
      context: context,
      initialTime:_time8

    
    );
    if(picked!=null && picked!=_time8)
    {
      setState(() {
      _time8=picked;
      print(_time8);
    });

    }

   //it will use for starting time 



  }

   //--for date select

   DateTime selectedDate1 = DateTime.now();

  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      });
  }
  void blankinfo(){
    if (desig==null)
    {
    var alertDialog=AlertDialog(
     title: Text("Please fill your post "),
     content: Text("Please fill then Continue"));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );


    }
    else if (reason==null)
    {
      var alertDialog=AlertDialog(
     title: Text("Please fill your Purpose of leave "),
     content: Text("Please fill then Continue"));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
      

    }
  
    else if(empid==null)
   {
      var alertDialog=AlertDialog(
     title: Text("Please fill your Employee id "),
     content: Text("Please fill then Continue"));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
     
     
   }


  }

// for second to date
 DateTime selectedDate2 = DateTime.now();
 Future<Null> _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

//----Firestore backend

final databaseReference = Firestore.instance;

void database() async
{
  if("CSE"==elements1[selectedIndex1])
  {
    var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
    
    

    databaseReference.collection("CSE")
    .document("$myvar"+"$date")
    .setData({
      "Application submittion  time":"$cur",
      "Application submittion date":"$date",

      "Name":"$myvar",
      "designation":"$desig",
      "reason of leave":"$reason",
      "Department":"$dep",
     
      "leave from":"${selectedDate1.toLocal()}".split(' ')[0],
     // "leave from":"$frombuild",
    "leave to":"${selectedDate2.toLocal()}".split(' ')[0],
    
    //"gap between submission date and first day of requested leave":"$diff"
    "doc name":"$myvar"+"$date",
    "Hod status":"",
    "employee id":"$empid",
    "Approved by Principal":"",
    //---

    "Approved by Hod":"",

    "Rejected by Hod":"",
    
    "HOD digital signature":"",
    "Date of hod 's approval":"",
    "Time of hod 's approval":"",
    "rejection 's reason from the Hod":"",
    "Date of hod 's Rejection":"",
    "Time of hod 's Rejection":"",
    "Princi digi signature":"",
    "Date of Princi approval":"",
    "Time of Princi approval":"",
    "rejection's reason Princi":"",
    "Date of Princi Rejection":"",
    "Time of Princi Rejection":"",
    "Princi status":"",
  //---
    

    // arrangement request 1
    "arrangement Course1":"$course1",
    "arrangement semroom1":"$semroom1",
    "arrangement cursub1":"$cursub1",
    "arrangement altersub1":"$altersub1",
    "argt starttime1":"$_time1",
    "argt endtime1":"$_time2",
    "arranged1":"$arrange1",
    // arrangement request 2
     "arrangement Course2":"$course2",
    "arrangement semroom2":"$semroom2",
    "arrangement cursub2":"$cursub2",
    "arrangement altersub2":"$altersub2",
    "argt starttime2":"$_time3",
    "argt endtime2":"$_time4",
    "arranged2":"$arrange2",
    // arrangement request 3
    "arrangement Course3":"$course3",
    "arrangement semroom3":"$semroom3",
    "arrangement cursub3":"$cursub3",
    "arrangement altersub3":"$altersub3",
    "argt starttime3":"$_time5",
    "argt endtime3":"$_time6",
    "arranged3":"$arrange3",
    // arrangement request 4
      "arrangement Course4":"$course4",
    "arrangement semroom4":"$semroom4",
    "arrangement cursub4":"$cursub4",
    "arrangement altersub4":"$altersub4",
    "argt starttime4":"$_time7",
    "argt endtime4":"$_time8",
     "arranged4":"$arrange4",



    


    

    
    
  




      

    });
    
    core();
    noticse();// it is for noti
    Elmax();
    difference_of_days();
    success();
    
    
    


  }
  else if(("ME"==elements1[selectedIndex1]))
  {
    var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
    
   // var j=DateTime.now();

    databaseReference.collection("ME")
    .document("$myvar"+"$date")
    .setData({
      "Application submittion  time":"$cur",
      "Application submittion date":"$date",

      "Name":"$myvar",
      "designation":"$desig",
      "reason of leave":"$reason",
      "Department":"$dep",
     
      "leave from":"${selectedDate1.toLocal()}".split(' ')[0],
    "leave to":"${selectedDate2.toLocal()}".split(' ')[0],
    
   // "gap between submission date and first day of requested leave":
    "doc name":"$myvar"+"$date",
    "employee id":"$empid",
    "Princi status":"",
    "Hod status":"",
    "Approved by Principal":"",
    //---

     "Approved by Hod":"",

    "Rejected by Hod":"",
   
    "HOD digital signature":"",
    "Date of hod 's approval":"",
    "Time of hod 's approval":"",
    "rejection 's reason from the Hod":"",
    "Date of hod 's Rejection":"",
    "Time of hod 's Rejection":"",
    "Princi digi signature":"",
    "Date of Princi approval":"",
    "Time of Princi approval":"",
    "rejection's reason Princi":"",
    "Date of Princi Rejection":"",
    "Time of Princi Rejection":"",
    
    //--
    
    
    // arrangement request 1
    "arrangement Course1":"$course1",
    "arrangement semroom1":"$semroom1",
    "arrangement cursub1":"$cursub1",
    "arrangement altersub1":"$altersub1",
    "argt starttime1":"$_time1",
    "argt endtime1":"$_time2",
    "arranged1":"$arrange1",
    // arrangement request 2
     "arrangement Course2":"$course2",
    "arrangement semroom2":"$semroom2",
    "arrangement cursub2":"$cursub2",
    "arrangement altersub2":"$altersub2",
    "argt starttime2":"$_time3",
    "argt endtime2":"$_time4",
    "arranged2":"$arrange2",
    // arrangement request 3
      "arrangement Course3":"$course3",
    "arrangement semroom3":"$semroom3",
    "arrangement cursub3":"$cursub3",
    "arrangement altersub3":"$altersub3",
    "argt starttime3":"$_time5",
    "argt endtime3":"$_time6",
    "arranged3":"$arrange3",
    // arrangement request 4
      "arrangement Course4":"$course4",
    "arrangement semroom4":"$semroom4",
    "arrangement cursub4":"$cursub4",
    "arrangement altersub4":"$altersub4",
    "argt starttime4":"$_time7",
    "argt endtime4":"$_time8",
    "arranged4":"$arrange4",


   







      

    });
     core();
    Elmax();
    difference_of_days();
    success();
    notime();
  


  }
  else if(("CE"==elements1[selectedIndex1]))
  {
    var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
    
   // var j=DateTime.now();

    databaseReference.collection("CE")
    .document("$myvar"+"$date")
    .setData({
      "Application submittion  time":"$cur",
      "Application submittion date":"$date",

      "Name":"$myvar",
      "designation":"$desig",
      "reason of leave":"$reason",
      "Department":"$dep",
     
      "leave from":"${selectedDate1.toLocal()}".split(' ')[0],
    "leave to":"${selectedDate2.toLocal()}".split(' ')[0],
   
   // "gap between submission date and first day of requested leave":
     "doc name":"$myvar"+"$date",
     "employee id":"$empid",
     "Hod status":"",
     "Approved by Principal":"",
     "Princi status":"",
    //---

    "Approved by Hod":"",

    "Rejected by Hod":"",
    
    "HOD digital signature":"",
    "Date of hod 's approval":"",
    "Time of hod 's approval":"",
    "rejection 's reason from the Hod":"",
    "Date of hod 's Rejection":"",
    "Time of hod 's Rejection":"",
    "Princi digi signature":"",
    "Date of Princi approval":"",
    "Time of Princi approval":"",
    "rejection's reason Princi":"",
    "Date of Princi Rejection":"",
    "Time of Princi Rejection":"",
  //---
    
     // arrangement request 1
    "arrangement Course1":"$course1",
    "arrangement semroom1":"$semroom1",
    "arrangement cursub1":"$cursub1",
    "arrangement altersub1":"$altersub1",
    "argt starttime1":"$_time1",
    "argt endtime1":"$_time2",
    "arranged1":"$arrange1",
    // arrangement request 2
     "arrangement Course2":"$course2",
    "arrangement semroom2":"$semroom2",
    "arrangement cursub2":"$cursub2",
    "arrangement altersub2":"$altersub2",
    "argt starttime2":"$_time3",
    "argt endtime2":"$_time4",
    "arranged2":"$arrange2",
    // arrangement request 3
      "arrangement Course3":"$course3",
    "arrangement semroom3":"$semroom3",
    "arrangement cursub3":"$cursub3",
    "arrangement altersub3":"$altersub3",
    "argt starttime3":"$_time5",
    "argt endtime3":"$_time6",
    "arranged3":"$arrange3",
    // arrangement request 4
      "arrangement Course4":"$course4",
    "arrangement semroom4":"$semroom4",
    "arrangement cursub4":"$cursub4",
    "arrangement altersub4":"$altersub4",
    "argt starttime4":"$_time7",
    "argt endtime4":"$_time8",
    "arranged4":"$arrange4",


    






      

    });
     core();
    Elmax();
    difference_of_days();
    success();
    notice();

  }
  else if(("EE"==elements1[selectedIndex1]))
  {
     var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
    
   // var j=DateTime.now();

    databaseReference.collection("EE")
    .document("$myvar"+"$date")
    .setData({
      "Application submittion  time":"$cur",
      "Application submittion date":"$date",

      "Name":"$myvar",
      "designation":"$desig",
      "reason of leave":"$reason",
      "Department":"$dep",
    
      "leave from":"${selectedDate1.toLocal()}".split(' ')[0],
    "leave to":"${selectedDate2.toLocal()}".split(' ')[0],
   
   // "gap between submission date and first day of requested leave":

      "doc name":"$myvar"+"$date",
      "employee id":"$empid",
      "Hod status":"",
      "Approved by Principal":"",
      "Princi status":"",
      //---

    "Approved by Hod":"",

    "Rejected by Hod":"",
  
    "HOD digital signature":"",
    "Date of hod 's approval":"",
    "Time of hod 's approval":"",
    "rejection 's reason from the Hod":"",
    "Date of hod 's Rejection":"",
    "Time of hod 's Rejection":"",
    "Princi digi signature":"",
    "Date of Princi approval":"",
    "Time of Princi approval":"",
    "rejection's reason Princi":"",
    "Date of Princi Rejection":"",
    "Time of Princi Rejection":"",
  //---
    
     
      // arrangement request 1
    "arrangement Course1":"$course1",
    "arrangement semroom1":"$semroom1",
    "arrangement cursub1":"$cursub1",
    "arrangement altersub1":"$altersub1",
    "argt starttime1":"$_time1",
    "argt endtime1":"$_time2",
    "arranged1":"$arrange1",
    // arrangement request 2
     "arrangement Course2":"$course2",
    "arrangement semroom2":"$semroom2",
    "arrangement cursub2":"$cursub2",
    "arrangement altersub2":"$altersub2",
    "argt starttime2":"$_time3",
    "argt endtime2":"$_time4",
    "arranged2":"$arrange2",
    // arrangement request 3
      "arrangement Course3":"$course3",
    "arrangement semroom3":"$semroom3",
    "arrangement cursub3":"$cursub3",
    "arrangement altersub3":"$altersub3",
    "argt starttime3":"$_time5",
    "argt endtime3":"$_time6",
    "arranged3":"$arrange3",
    // arrangement request 4
      "arrangement Course4":"$course4",
    "arrangement semroom4":"$semroom4",
    "arrangement cursub4":"$cursub4",
    "arrangement altersub4":"$altersub4",
    "argt starttime4":"$_time7",
    "argt endtime4":"$_time8",
    "arranged4":"$arrange4",







      

    });
     core();
    Elmax();
    difference_of_days();
    success();
    notiee();
    

  }
  else if(("ECE"==elements1[selectedIndex1]))
  {
      var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
    
   // var j=DateTime.now();

    databaseReference.collection("ECE")
    .document("$myvar"+"$date")
    .setData({
      "Application submittion  time":"$cur",
      "Application submittion date":"$date",

      "Name":"$myvar",
      "designation":"$desig",
      "reason of leave":"$reason",
      "Department":"$dep",
    
      "leave from":"${selectedDate1.toLocal()}".split(' ')[0],
    "leave to":"${selectedDate2.toLocal()}".split(' ')[0],
   
   // "gap between submission date and first day of requested leave":
     "doc name":"$myvar"+"$date",
     "employee id":"$empid",
     "Hod status":"",
     "Approved by Principal":"",
     "Princi status":"",
     //---

    "Approved by Hod":"",

    "Rejected by Hod":"",
   
    "HOD digital signature":"",
    "Date of hod 's approval":"",
    "Time of hod 's approval":"",
    "rejection 's reason from the Hod":"",
    "Date of hod 's Rejection":"",
    "Time of hod 's Rejection":"",
    "Princi digi signature":"",
    "Date of Princi approval":"",
    "Time of Princi approval":"",
    "rejection's reason Princi":"",
    "Date of Princi Rejection":"",
    "Time of Princi Rejection":"",
    //--
    
     
    // arrangement request 1
    "arrangement Course1":"$course1",
    "arrangement semroom1":"$semroom1",
    "arrangement cursub1":"$cursub1",
    "arrangement altersub1":"$altersub1",
    "argt starttime1":"$_time1",
    "argt endtime1":"$_time2",
    "arranged1":"$arrange1",
    // arrangement request 2
     "arrangement Course2":"$course2",
    "arrangement semroom2":"$semroom2",
    "arrangement cursub2":"$cursub2",
    "arrangement altersub2":"$altersub2",
    "argt starttime2":"$_time3",
    "argt endtime2":"$_time4",
    "arranged2":"$arrange2",
    // arrangement request 3
      "arrangement Course3":"$course3",
    "arrangement semroom3":"$semroom3",
    "arrangement cursub3":"$cursub3",
    "arrangement altersub3":"$altersub3",
    "argt starttime3":"$_time5",
    "argt endtime3":"$_time6",
    "arranged3":"$arrange3",
    // arrangement request 4
      "arrangement Course4":"$course4",
    "arrangement semroom4":"$semroom4",
    "arrangement cursub4":"$cursub4",
    "arrangement altersub4":"$altersub4",
    "argt starttime4":"$_time7",
    "argt endtime4":"$_time8",
    "arranged4":"$arrange4",









      

    });
    core();
    Elmax();
    difference_of_days();
   
    success();
    notiece();

  }
   else if(("Applied Science"==elements1[selectedIndex1]))
  {
      var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
    
   // var j=DateTime.now();

    databaseReference.collection("Applied Science")
    .document("$myvar"+"$date")
    .setData({
      "Application submittion  time":"$cur",
      "Application submittion date":"$date",

      "Name":"$myvar",
      "designation":"$desig",
      "reason of leave":"$reason",
      "Department":"$dep",
     
      "leave from":"${selectedDate1.toLocal()}".split(' ')[0],
    "leave to":"${selectedDate2.toLocal()}".split(' ')[0],
    
   // "gap between submission date and first day of requested leave":
     "doc name":"$myvar"+"$date",
     "employee id":"$empid",
     "Hod status":"",
     "Approved by Principal":"",
     //---

    "Approved by Hod":"",

    "Rejected by Hod":"",
    "Princi status":"",
    
    "HOD digital signature":"",
    "Date of hod 's approval":"",
    "Time of hod 's approval":"",
    "rejection 's reason from the Hod":"",
    "Date of hod 's Rejection":"",
    "Time of hod 's Rejection":"",
    "Princi digi signature":"",
    "Date of Princi approval":"",
    "Time of Princi approval":"",
    "rejection's reason Princi":"",
    "Date of Princi Rejection":"",
    "Time of Princi Rejection":"",
    //--
    
    
     // arrangement request 1
    "arrangement Course1":"$course1",
    "arrangement semroom1":"$semroom1",
    "arrangement cursub1":"$cursub1",
    "arrangement altersub1":"$altersub1",
    "argt starttime1":"$_time1",
    "argt endtime1":"$_time2",
    "arranged1":"$arrange1",
    // arrangement request 2
     "arrangement Course2":"$course2",
    "arrangement semroom2":"$semroom2",
    "arrangement cursub2":"$cursub2",
    "arrangement altersub2":"$altersub2",
    "argt starttime2":"$_time3",
    "argt endtime2":"$_time4",
    "arranged2":"$arrange2",
    // arrangement request 3
      "arrangement Course3":"$course3",
    "arrangement semroom3":"$semroom3",
    "arrangement cursub3":"$cursub3",
    "arrangement altersub3":"$altersub3",
    "argt starttime3":"$_time5",
    "argt endtime3":"$_time6",
    "arranged3":"$arrange3",
    // arrangement request 4
    "arrangement Course4":"$course4",
    "arrangement semroom4":"$semroom4",
    "arrangement cursub4":"$cursub4",
    "arrangement altersub4":"$altersub4",
    "argt starttime4":"$_time7",
    "argt endtime4":"$_time8",
    "arranged4":"$arrange4",


    

  





      

    });
     core();
    Elmax();
    difference_of_days();
    success();
    notiap();
    

  }
}
void core()
{
  if("CL"==elements2[selectedIndexa])
  {
    var a=selectedDate1.day;
    

    var newDate = new DateTime(now.day,now.month,now.year);
    var newDate2 = new DateTime(selectedDate1.day,selectedDate1.month,selectedDate1.year);
    var newDate3=new DateTime(now.day+1,now.month,now.year);
   // var b=newDate3.day;
   // here iam tooking 1+ in newdate3 because iam using bultin comparing method that automatically took 1 from its side 
    

    if(newDate==newDate2)
    {
     // print("you cannot take the cl leave same day u have to choose after 2 day's date");
       var alertDialog=AlertDialog(
     title: Text("Dear " + "$myvar"+" "+"you have choosen C.L (mode of leave)"),
     content: Text("for the purpose of applying cl leave you have to choose date of  two day's after please choose date after the  "+"$a"));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
  

    }
    else if(newDate2.compareTo(newDate3)==1)
    {
      // it will check that you are applying for cl greater than or equal then return 1 
    
   // var dep=elements1[selectedIndex1];
    //var leave=
   // print("yes");
    
  try {

    
    databaseReference.collection(elements1[selectedIndex1])
                     .document("$myvar"+"$date")
                    .updateData({ "leave type":elements2[selectedIndexa]});
        
        
        
    } catch (e) {
     print(e.toString());
    }
  
  
}

 
      // here i will update the database of cl leave of user
    
    else{
      print("gap of two days mendatory between the  form filling date  and leave's date ");
       var alertDialog=AlertDialog(
     title: Text("Dear " + "$myvar"+" "+"gap of two days mendatory between the  form filling date  and leave's date "),
     content: Text("for the purpose of applying cl leave you have to choose date of  two day's after please choose date after the  "+"$a"));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
    }
    

  }
  else if("EL"==elements2[selectedIndexa]){
     var a=selectedDate1.day;
    

    var newDate = new DateTime(now.day,now.month,now.year);
    var newDate2 = new DateTime(selectedDate1.day,selectedDate1.month,selectedDate1.year);
    var newDate3=new DateTime(now.day+14,now.month,now.year);
    var newDate2a = new DateTime(selectedDate2.day,selectedDate2.month,selectedDate2.year);
    
     if(newDate==newDate2)
    {
     // print("you cannot take the El leave same day u have to choose after 2 day's date");
       var alertDialog=AlertDialog(
     title: Text("Dear " + "$myvar"+" "+"you have choosen E.L (mode of leave)"),
     content: Text("for the purpose of applying E.L leave you have to choose date of 15th day's after please choose date after the  "+"$a"));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
    }//if
    else if(newDate2.compareTo(newDate3)==1)
    {
      // it will check that you are applying for cl greater than or equal then return 1 
       
    var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
   
  try {
    
    databaseReference
        .collection(elements1[selectedIndex1])
        .document("$myvar"+"$date")
        .updateData({ "leave type":"$leave"});
  } catch (e) {
    print(e.toString());
  }
  
}// here i will update the database of cl leave of user
      
     
      
    
   


    else 
    {
       print("gap of 15 days mendatory between the  form filling date  and leave's date ");
       var alertDialog=AlertDialog(
     title: Text("Dear " + "$myvar"+" "+"gap of 15 days mendatory between the  form filling date  and leave's date "),
     content: Text("for the purpose of applying E.L leave you have to choose date of  15 day's after please choose date after the  "+"$a"));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
    

    }

    
   
  
  
  }
  else if("OD"==elements2[selectedIndexa]){
     //var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
  try {
    databaseReference 
        .collection(elements1[selectedIndex1])
        .document("$myvar"+"$date")
        .updateData({ "leave type":"$leave"});
  } catch (e) {
    print(e.toString());
  }
 // Elmax();
  
}
else if("LWP"==elements2[selectedIndexa])
{
  //var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
  try {
    databaseReference
        .collection(elements1[selectedIndex1])
        .document("$myvar"+"$date")
        .updateData({ "leave type":"$leave"});
  } catch (e) {
    print(e.toString());
  }
 // Elmax();
 
  


}
else if("Emergency"==elements2[selectedIndexa])
{
  //var dep=elements1[selectedIndex1];
    var leave=elements2[selectedIndexa];
  try {
    databaseReference
        .collection(elements1[selectedIndex1])
        .document("$myvar"+"$date")
        .updateData({ "leave type":"$leave"});
  } catch (e) {
    print(e.toString());
  }
}



  
  

  
}
void Elmax()
{
  if("EL"==elements2[selectedIndexa])
  {
    var dif;
var b = new DateTime(selectedDate1.year,selectedDate1.month,selectedDate1.day);
var d = new DateTime(selectedDate2.year,selectedDate2.month,selectedDate2.day);
final difference = b.difference(d).inDays;
if (difference<0)
{
  dif=difference/-1;
  print(dif);

}
else 
{
  dif=difference;
  print(dif);
}

if(dif>5)
{
   var alertDialog=AlertDialog(
     title: Text("Dear " + "$myvar"+" "+"You can only use maximum 5days Earned leave "),
     content: Text("Please fix then continue  "));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );

}
  }
  else if("CL"==elements2[selectedIndexa])
  {var dif;
   
var b = new DateTime(selectedDate1.year,selectedDate1.month,selectedDate1.day);
var d = new DateTime(selectedDate2.year,selectedDate2.month,selectedDate2.day);
final difference = b.difference(d).inDays;
if (difference<0)
{
  dif=difference/-1;
  print(dif);

}
else 
{
  dif=difference;
  print(dif);
}

if(dif>2)
{
   var alertDialog=AlertDialog(
     title: Text("Dear " + "$myvar"+" "+"You can only use maximum 2 days Casual leave "),
     content: Text("Please fix then continue  "));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );

}

  }
  

  

 
   
   
   
}
void difference_of_days()
{
 var days;
var b = new DateTime(selectedDate1.year,selectedDate1.month,selectedDate1.day);
var d = new DateTime(selectedDate2.year,selectedDate2.month,selectedDate2.day);
final difference = b.difference(d).inDays;
if (difference<0){
  days=difference/-1;
   databaseReference 
        .collection(elements1[selectedIndex1])
        .document("$myvar"+"$date")
        .updateData({ "leave gap":"$days"});

}
else
{
  days=difference;
   databaseReference 
        .collection(elements1[selectedIndex1])
        .document("$myvar"+"$date")
        .updateData({ "leave gap":"$days"});

}

}
void success()
{
  var leave=elements2[selectedIndexa];
  var alertDialog=AlertDialog(
     title: Text("Dear " + "$myvar"+" "+"You have successfully submitted form for $leave"),
     content: Text("at $date on $cur" ));
     showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );




}
void initState()
{
  super.initState();
  setState(() {
     leavequota();
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
    databaseReference.child('fcm-token/${token}').set({"token": token});
    textValue = token;
    setState(() {});
  }
 
  noticse() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('cse')
     
     .update({
      'title $cur':'$myvar' 
  //yes I know.
});
  }

 notime() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('me')
     
     .update({
     'title $cur':'$myvar' 
  //yes I know.
});
  }
  
 notice() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('ce')
     
     .update({
     'title $cur':'$myvar' 
  //yes I know.
});
  }
  notiee() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('ee')
     
     .update({
     'title $cur':'$myvar' 
  //yes I know.
});
  }
   notiece() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('ece')
     
     .update({
     'title $cur':'$myvar' 
  //yes I know.
});
  }
  notiap() {
     DatabaseReference k=FirebaseDatabase().reference();
    
    k.child('as')
     
     .update({
     'title $cur':'$myvar' 
  //yes I know.
});
  }



//----------

 leavequota() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();

   eid=prefs.getString('empid');
  
   Firestore.instance
      .collection(eid)
      
      .getDocuments()
      
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((b)
    {
     
      print('${b['CL']}');
      setState(() {
      cl1=double.parse('${b['CL']}');
      print(cl1);
      el1=double.parse('${b['EL']}');
      print(el1);
        

      });
     
     

    });
 
    
    
    
 });
 


}
_saveforstatus() async
{
    final prefs1 = await SharedPreferences.getInstance();
    final key1 = 'name';
    final value1 =myvar;
    prefs1.setString(key1, value1);
    print('saved: $myvar');
    //--------
    final prefs2 = await SharedPreferences.getInstance();
    final key2 = "applydate";
    final value2 =date;
    prefs2.setString(key2, value2);
    print('saved: $date');
    //-------------------
    final prefs3 = await SharedPreferences.getInstance();
    final key3 = "dept";
    final value3 =elements1[selectedIndex1];
    prefs3.setString(key3, value3);
    print('saved:($elements1[selectedIndex1]');
    //-------------------


    

}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body:SingleChildScrollView(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              _backBgCover(),
              _greetings(),
              _moodsHolder(context),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                 // _notificationCard(),
                  SizedBox(
                    height: 20,
                  ),
                 // _nextAppointment(),
                  SizedBox(
                    height: 4,
                  ),
                  //--------------
                  SingleChildScrollView(child: 
                  Column(children: <Widget>[
                    Container(child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //--- whole form leave under this 
                         Flexible(child: 
                         Padding(padding: EdgeInsets.all(2.0),
                         child:
                         TextField(autofocus: false,
                          onChanged:(text){
                          desig =text;
                           },
                // onSubmitted: (url) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => duckduck(url:url))),

                   decoration: InputDecoration(
                   labelText: "Your designation",
                  hintText: "type of post ",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),

            
      
      
               ),
     
      
      
      
             )
      
      

      ),)),
     
      
       
          
                     

                    ],),
                    //------------
                   

                    
                    ),
                    //-desig
                     Container(
                       padding: EdgeInsets.all(2.0),
                       child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //--- whole form leave under this 
                         Flexible(child: 
                         Padding(padding: EdgeInsets.all(2.0),
                         child:
                         TextField(autofocus: false,
                          onChanged:(text){
                          reason =text;
                           },
                // onSubmitted: (url) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => duckduck(url:url))),

                   decoration: InputDecoration(
                   labelText: "Reason",
                  hintText: "Reason for leave",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),

            
      
      
               ),
     
      
      
      
             )
      
      

      ),)),
     
      
       
          
                     

                    ],),
                    
                   

                    
                    ),// reason of leavce 
                    //---------emp id
                     Container(
                       padding: EdgeInsets.all(2.0),
                       child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //--- whole form leave under this 
                         Flexible(child: 
                         Padding(padding: EdgeInsets.all(2.0),
                         child:
                         TextField(autofocus: false,
                          onChanged:(text){
                          empid =text;
                           },
                // onSubmitted: (url) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => duckduck(url:url))),

                   decoration: InputDecoration(
                   labelText: "Emp id",
                  hintText: "Employee i.d",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(25.0),
                 borderSide: new BorderSide(),

            
      
      
               ),
     
      
      
      
             )
      
      

      ),)),
     
      
       
          
                     

                    ],),
                    
                   

                    
                    ),// reason of leavce

                   


                   


                    //--------
                    Padding(padding: EdgeInsets.all(2.0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Container(child: 
                      Flexible(child: 
                      Text("Please Choose Department")
                      
                      
                      )

                      
                      )

                    ],),
                    ),


                    //------dropdown menu

                    Container(
                      padding: EdgeInsets.all(2.0),
                      child: 
                    Row(children: <Widget>[
                
                Container(child: 
                Flexible(child: 
                DirectSelect(
                    itemExtent: 40.0,
                    selectedIndex: selectedIndex1,
                    child: MySelectionItem(
                      isForList: false,
                      title: elements1[selectedIndex1],
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex1 = index;
                      });
                    },
                    items: _buildItems1()),
                ))

                      


                    ],)
                    
                    
                    
                    
                    ),
                    //---------drop down menu
                    Container(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text("Please choose mode of leave:")



                      ],)
                      



                    ),
                    Container(
                      padding: EdgeInsets.all(2.0),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Container(child: 
                Flexible(child: 
                DirectSelect(
                    itemExtent: 40.0,
                    selectedIndex: selectedIndex1,
                    child: MySelectionItem(
                      isForList: false,
                      title: elements2[selectedIndexa],
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndexa = index;
                      });
                    },
                    items: _buildItems2()),
                ))

                      




                      ],)
                    
                    
                    ),

                    Container(
                      padding: EdgeInsets.all(2.0),
                      child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text("Leave From -"),
                      
                      Text("${selectedDate1.toLocal()}".split(' ')[0])


                    ],)
                    
                    
                    ),
                    Container(
                      padding:EdgeInsets.all(2.0),
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
                       _selectDate1(context);
                      // print("${selectedDate1.toLocal()}".split(' ')[0]);
                        
                     
                      
                  
                      

                     
                      
                      
                     
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.calendar,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      '     Leave From',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green,fontSize: 20.0,),
                    ),
                    



                    ],),
                   
                  ),
                )
                ),)

                          

                       


                      ],)
                    ),
                   //---------
                   Container(child: 
                   Row(

                     mainAxisAlignment:MainAxisAlignment.center,
                     children: <Widget>[
                      Text("to -"),
                      
                      Text("${selectedDate2.toLocal()}".split(' ')[0])




                   ],)
                   
                   
                   ),
                   Container(
                     padding: EdgeInsets.all(2.0),
                     child: Row(
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
                       _selectDate2(context);
                      // print("${selectedDate1.toLocal()}".split(' ')[0]);
                        
                     
                      
                  
                      

                     
                      
                      
                     
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.calendarCheck,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      '        To',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green,fontSize: 20.0,),
                    ),
                    



                    ],),
                   
                  ),
                )
                ),)





                     ],)




                   ),

                  Container(
                    padding: EdgeInsets.all(2.0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Fill All details of Alternate Arrangement of your class ")

                    ],)


                  ),
                 // here is the field of arrangement
                  
                   //----
                  Container(child: 
                   
                   Card(
                     color:Colors.yellow,
                     child: 
                    Column(children: <Widget>[
                      Text("Field 1:"),
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                      TextField(
                        onChanged: (text){
                         course1=text;
                        },
                        //---
                            decoration: InputDecoration(
                   labelText: "Course",
                  hintText: "Enter Course name for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         semroom1=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Sem & room no",
                  hintText: "Enter Semester&room no for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                        Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         cursub1=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Current Subject",
                  hintText: "Enter Current Subject of class that you want to arrange",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         altersub1=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Alternate Subject",
                  hintText: "Enter Subject That you want to run by your alternate",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),
                      Text("Choose the class Start time:"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime1(context);

                      }
                       

                      )
                      ),
                      Text("Choose the class End time"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime2(context);

                      }
                       

                      )
                      ),// center
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         arrange1=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Arranged by",
                  hintText: "Enter the Alternate Faculty Name",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding




                    

                    

                      

                    ],),
                    //column

                   
                   
                   ),// card
                   
                   
                   
                   
                   
                   
                  
                  
                  ),//container
                  //for 2nd field
                   Container(child: 
                   
                   Card(
                     color:Colors.yellow,
                     child: 
                    Column(children: <Widget>[
                      Text("Field 2:"),
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                      TextField(
                        onChanged: (text){
                         course2=text;
                        },
                        //---
                            decoration: InputDecoration(
                   labelText: "Course",
                  hintText: "Enter Course name for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         semroom2=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Sem & room no",
                  hintText: "Enter Semester&room no for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                        Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         cursub2=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Current Subject",
                  hintText: "Enter Current Subject of class that you want to arrange",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         altersub2=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Alternate Subject",
                  hintText: "Enter Subject That you want to run by your alternate",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),
                      Text("Choose the class Start time:"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime3(context);

                      }
                       

                      )
                      ),
                      Text("Choose the class End time"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime4(context);

                      }
                       

                      )
                      ),// center
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         arrange2=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Arranged by",
                  hintText: "Enter the Alternate Faculty Name",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding




                    

                    

                      

                    ],),
                    //column

                   
                   
                   ),// card
                   
                   
                   
                   
                   
                   
                  
                  
                  ),//container
                  // now third field
                   Container(child: 
                   
                   Card(
                     color:Colors.yellow,
                     child: 
                    Column(children: <Widget>[
                      Text("Field 3:"),
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                      TextField(
                        onChanged: (text){
                         course3=text;
                        },
                        //---
                            decoration: InputDecoration(
                   labelText: "Course",
                  hintText: "Enter Course name for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         semroom3=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Sem & room no",
                  hintText: "Enter Semester&room no for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                        Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         cursub3=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Current Subject",
                  hintText: "Enter Current Subject of class that you want to arrange",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         altersub3=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Alternate Subject",
                  hintText: "Enter Subject That you want to run by your alternate",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),
                      Text("Choose the class Start time:"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime5(context);

                      }
                       

                      )
                      ),
                      Text("Choose the class End time"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime6(context);

                      }
                       

                      )
                      ),// center
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         arrange3=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Arranged by",
                  hintText: "Enter the Alternate Faculty Name",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding




                    

                    

                      

                    ],),
                    //column

                   
                   
                   ),// card
                   
                   
                   
                   
                   
                   
                  
                  
                  ),//container
                   // now 4th field
                    Container(child: 
                   
                   Card(
                     color:Colors.yellow,
                     child: 
                    Column(children: <Widget>[
                      Text("Field 4:"),
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                      TextField(
                        onChanged: (text){
                         course4=text;
                        },
                        //---
                            decoration: InputDecoration(
                   labelText: "Course",
                  hintText: "Enter Course name for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield
                      Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         semroom4=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Sem & room no",
                  hintText: "Enter Semester&room no for Alternate class",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                        Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         cursub4=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Current Subject",
                  hintText: "Enter Current Subject of class that you want to arrange",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         altersub4=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Alternate Subject",
                  hintText: "Enter Subject That you want to run by your alternate",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),
                      Text("Choose the class Start time:"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime7(context);

                      }
                       

                      )
                      ),
                      Text("Choose the class End time"),
                      Center(child: 
                      IconButton(icon: Icon(Icons.alarm),
                      onPressed:()
                      {
                        selectTime8(context);

                      }
                       

                      )
                      ),// center
                       Padding(padding: EdgeInsets.all(5.0),
                      child:
                       TextField(
                        onChanged: (text){
                         arrange4=text;
                        },
                        //---
                    decoration: InputDecoration(
                   labelText: "Arranged by",
                  hintText: "Enter the Alternate Faculty Name",
                  fillColor: Colors.white,
                 border:OutlineInputBorder(
                 borderRadius:BorderRadius.circular(2.0),
                 borderSide: new BorderSide(),

            
      
      
               ),

     
      
      
      
             )
      
      
              //---
      
       
      



                      ),),//Textfield//padding




                    

                    

                      

                    ],),
                    //column

                   
                   
                   ),// card
                   
                   
                   
                   
                   
                   
                  
                  
                  ),//container



                   //----
                   Container(
                      padding:EdgeInsets.all(2.0),
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
                      // _selectDate1(context);
                     //Elmax(); // print("${selectedDate1.toLocal()}".split(' ')[0]);
                     
                     blankinfo();
                     _saveforstatus();
                     database();

                     
                    

                     
                     
                    

                     //print(selectedDate1.day);
                     
                     

                     //print(elements1[selectedIndex1]);

                      
                  
                      

                     
                      
                      
                     
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.checkDouble,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      '     Submit',
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
                        
                   
               
                 

                  ),

                 






                 //------creative space//-----------
                ],
              ),
            ),
          ),
        ],
      ),)
    );
    
  }

  Positioned _moodsHolder(BuildContext context) {
    return Positioned(
      bottom: -45,
      child: Container(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child: 
            Text("Your Remaining Leave🚀Quota",style: TextStyle(fontSize:15.0,fontFamily: "PermanentMarker",color: Colors.red),)
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(child:
               RichText(text:TextSpan(children:<TextSpan>[
              TextSpan(text:"CL :",style: TextStyle(color: Colors.blue,fontSize: 21.0,fontFamily: "PermanentMarker")),
              TextSpan(text:"$cl1  ",style: TextStyle(color: Colors.green,fontSize: 25.0,fontFamily: "PermanentMarker")),
              TextSpan(text:"EL :",style: TextStyle(color: Colors.blue,fontSize: 21.0,fontFamily: "PermanentMarker")),
              TextSpan(text:"$el1 \n",style: TextStyle(color: Colors.green,fontSize: 25.0,fontFamily: "PermanentMarker")),
              

            ],
            

      
            ) 
            
            
            ),
        
        

            //Text("C.L:$cl1  E.L:$el1",style: TextStyle(fontSize:17.0,fontFamily: "PermanentMarker"),),)
          )],),
         
        

          ],),
          
        height: 100.0,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
      ),
    );
  }
  

  Container _backBgCover() {
    return Container(
      
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        
        
         
            //---
            Row(children: <Widget>[
               Text(
            'Hi '+" "+"$myvar",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          //--
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.yellow,),
          tooltip: "Logout",
          hoverColor: Colors.white,
          splashColor: Colors.white,
          iconSize: 30.0,
          
           onPressed: null)

            ],),
         
          
          SizedBox(
            height: 10,
          ),
         //note :i was using flat button but now i has switch to wonderful icon button
          // FlatButton(
          //   onPressed:() {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => csed1()));
              
               
          //   },
            
          //   child: 
          //   Row(children: <Widget>[
          //     Icon(Icons.book,color:Colors.white),
          
          // Text("Click here to check recent status of leave",style: TextStyle(color: Colors.white,fontSize: 15.0,fontFamily: "PermanentMarker"))

          //   ],)
           
          // ),
          //----
          Row(children: <Widget>[
            IconButton(icon: Icon(Icons.person_pin,color: Colors.yellow,),
            tooltip: "Status",
            iconSize: 40.0,
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => csed1()));}
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              child:
            IconButton(icon: Icon(Icons.history,color: Colors.yellow,),
            tooltip: "History",
            iconSize: 40.0,
             onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => his()));}
            ))

          ],),
          Row(children: <Widget>[
            Text(" Status",style: TextStyle(color: Colors.yellow),),
             Text("       History",style: TextStyle(color: Colors.yellow),),

          ],)

          //------
        ],
      ),
    );
  }
  

  

 

 }
 class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}

      

      
  