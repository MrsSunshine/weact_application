import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weact_application/JasonParsing/userModel.dart';
import 'package:weact_application/Login/signup.dart';
import 'package:weact_application/MainPage/mainpage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Signup();
    } else {
      return MainPage();
    }
  }
}
