import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/signup'),
              child: Text('Go Signup'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/home'),
              child: Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
