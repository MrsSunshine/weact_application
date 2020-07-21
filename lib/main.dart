import 'package:provider/provider.dart';
import 'package:weact_application/JasonParsing/userModel.dart';
import 'package:weact_application/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:weact_application/Login/loginWithGoogle.dart';
import 'package:weact_application/User/personalPage.dart';
import 'package:weact_application/User/wrapper.dart';
import 'package:weact_application/services/auth.dart';
import 'Login/resetPassword.dart';
import 'Login/signup.dart';
import 'package:weact_application/MainPage/mainpage.dart';
import 'package:weact_application/User/wrapper.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          routes: {
            '/login': (context) => Login(),
            '/signup': (context) => Signup(),
            '/mainpage': (context) => MainPage(),
            '/personalPage': (context) => PersonalPage(),
            '/loginWithGoogle': (context) => LoginWithGoogle(),
            '/resetPassword': (context) => ResetPassword(),
          },
          home: Wrapper(),
        ));
  }
}
