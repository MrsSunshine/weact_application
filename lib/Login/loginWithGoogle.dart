import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogle extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginWithGoogle> {
  bool _isLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _isLoggedIn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      _googleSignIn.currentUser.photoUrl,
                      height: 50.0,
                      width: 50.0,
                    ),
                    Text(_googleSignIn.currentUser.displayName),
                    Text(_googleSignIn.currentUser.email),
                    OutlineButton(
                        child: Text("Logout"),
                        onPressed: () {
                          _logout();
                        })
                  ],
                )
              : OutlineButton(
                  child: Text("Login WIth Google"),
                  onPressed: () {
                    _login();
                    //save user to firebase
                  },
                ),
        ),
      ),
    );
  }
}
