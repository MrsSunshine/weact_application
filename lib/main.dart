import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:weact_application/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:weact_application/User/personalPage.dart';
import 'Login/signup.dart';
import 'package:weact_application/MainPage/mainpage.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/login':(context)=>Login(),
    '/signup':(context)=>Signup(),
    '/mainpage':(context)=>MainPage(),
    '/personalPage':(context)=>PersonalPage(),
  },
  home:MyHomePage()
));

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible=true;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:Center(
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(seconds: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Container(
            width: 550,
            height: 550,
            child: FittedBox(
            child: FloatingActionButton(
              onPressed: (){
                Navigator.pushNamed(context, '/login');
                setState(() {
                  _visible=!_visible;
                });
              },
              child: Image(
                image:AssetImage('assets/WeActLogo.jpeg'),
                width:100.0,
                height: 300.0,
              ),
              tooltip: 'Toggle Opacity',
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            ),
          ),
            Text(
              'Welcome to WeAct',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      )
    ),
      backgroundColor: Colors.white,
  );
  }
}
