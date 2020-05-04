import 'package:flutter/material.dart';
import 'package:tododetail/splash.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return new MaterialApp(
      title: 'Todos',
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
       primaryColor: Colors.orangeAccent,
       
     ),
      home: new MyHomePage(title: 'Todos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {



   return Scaffold(
   
      body: SplashPage(),
    );
  }
}
