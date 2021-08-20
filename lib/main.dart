import 'package:flutter/material.dart';
import 'package:jittl/login setup/homesetup.dart';

import 'dart:async';


void main() => runApp(MyApp(  
));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      
      routes: {
        '/panel':(context)=>WelcomePage()


      },
      debugShowCheckedModeBanner:false,
      
      
      title: "Leisure",
      theme: ThemeData(primarySwatch: Colors.red),
      home: splash(),
      
    );
  }
}
 
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
   startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
    
  }
   @override
  void initState() {
    super.initState();
    startTime();
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/panel');
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width,
             height:  MediaQuery.of(context).size.height,
                child: Image.asset('assets/m.png',
                   
                   
                   fit: BoxFit.fill,
                  // color: Color.fromRGBO(255, 255, 255, 0.6),
                  //colorBlendMode: BlendMode.modulate
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment:CrossAxisAlignment.end,
                    
                    children: <Widget>[
                    Text("Made in india with 💙",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle:FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    
                    
                    
                    
                    ),
                    
                    
                    
                    
                    )










                  ],)











                ],









              ),






        ]
      
      
      
      
      
      
      )
      

      
    ));
  }
}
    
  


