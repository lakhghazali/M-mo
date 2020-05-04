import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tododetail/screens/todolist.dart';
import 'package:tododetail/util/colors.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
@override
  void initState() {
    super.initState();
    startTimer();
  }
  

  @override
  Widget build(BuildContext context) {


    final leading= Stack(
   children: <Widget>[
      Container(
        child:new Image.asset('assets/leanding.jpg',
         height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

        
         fit: BoxFit.cover,
         )
      ),

      Positioned(
        bottom: 0,
        child:Container(
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.only(left:92.0),
        child: Column(children: <Widget>[
        
        new Text('Manage Your Life'),
        Row(children: <Widget>[
          ActionChip(label: Text('Manage'), onPressed:(){}),
          SizedBox(width: 10.0,),
          ActionChip(label: Text('Day'), onPressed:(){})
        ],)



      ],),
        )   )
     

        ],
    );






    
    return Material(
      child:  Container(
              //padding: EdgeInsets.only(top: 100.0),
              //decoration: BoxDecoration(gradient: primaryGradient),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:leading
              ),
            );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() async {

    await Navigator.push(context, 
        MaterialPageRoute(builder: (context) => TodoList()));


  }

  final txtCenter = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Welcome in Todo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
          ),
        ),
        SizedBox(height: 21.0),
        Text(
          '               We Missed You',

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );


  



      

  
}