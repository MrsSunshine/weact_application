import 'package:flutter/material.dart';
import 'package:weact_application/services/auth.dart';

class Signup extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Signup> {
  String password = "";
  String email = "";
  String passAgain = "";
  String name = "";
  String surname = "";
  String error = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WeAct"),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'WeAct Sign in',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                        validator: (val) => val.isEmpty ? 'Enter a name' : null,
                      ),
                      Padding(padding: EdgeInsets.all(5.0)),
                      TextFormField(
                        onChanged: (val) {
                          setState(() => surname = val);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Surname',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter a surname' : null,
                      ),
                      Padding(padding: EdgeInsets.all(5.0)),
                      TextFormField(
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                      ),
                      Padding(padding: EdgeInsets.all(5.0)),
                      TextFormField(
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: (val) => (val.length < 6)
                            ? 'Enter a password 6+ chars long'
                            : null,
                      ),
                      Padding(padding: EdgeInsets.all(5.0)),
                      TextFormField(
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => passAgain = val);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Repeat Password',
                        ),
                        validator: (val) => (val != password)
                            ? 'The passwords do not coincide'
                            : null,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Sign in'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'please supply a valid email');
                              print('please supply a valid email');
                            } else {
                              Navigator.of(context).pushNamed('/mainpage');
                            }
                          }
                        })),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Try the App!'),
                      onPressed: () async {
                        dynamic result = await _auth.signInAnon();
                        if (result == null) {
                          print("error signing in");
                        } else {
                          print("signed in");
                          print(result.uid);
                          Navigator.of(context).pushNamed('/mainpage');
                        }
                      },
                    )),
                Center(
                  child: Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Already have an account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'log in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
