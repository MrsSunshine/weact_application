import 'package:flutter/material.dart';
import 'package:weact_application/services/auth.dart';

class ResetPassword extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ResetPassword> {
  String email = "";
  String error = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scrollbar(
        child: Scaffold(
            appBar: AppBar(title: Text("WeAct")),
            body: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'WeAct Reset Password',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Input Password',
                        style: TextStyle(fontSize: 20),
                      )),
                  Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        )
                      ])),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text(
                            'Reset',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            _auth.resetPassword(email);
                            setState((() =>
                                error = 'An email is been sent to ' + email));
                          })),
                  //Sized Box
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ),
                ]))));
  }
}
