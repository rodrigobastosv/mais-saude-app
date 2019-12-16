import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () => Navigator.of(context).pushNamed('/'),
            child: Text('Go Signin'),
          ),
        ],
      ),
    );
  }
}
