import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeAct"),
      ),
      drawer: Drawer(
    child: ListView(
    children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text("Ashish Rawat"),
        accountEmail: Text("ashishrawat2911@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor:
          Theme.of(context).platform == TargetPlatform.iOS
              ? Colors.blue
              : Colors.white,
          child: ListTile(
            title: Text("A", textAlign: TextAlign.center, style: TextStyle(fontSize: 40.0, color: Colors.blue), ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/personalPage');
              })
        ),
      ),
      ListTile(
    title: Text("My Events"),
    trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/login');
        },
    ),
    ListTile(
    title: Text("Events I joined"),
    trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed('/login');
      },
    ),
    ],
    ),
    ),
    );
  }
}