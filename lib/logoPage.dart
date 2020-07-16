import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LogoPage> {
  bool _visible = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  child: Image(
                    image: AssetImage('assets/WeActLogo.jpeg'),
                    width: 100.0,
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
      )),
      backgroundColor: Colors.white,
    );
  }
}
