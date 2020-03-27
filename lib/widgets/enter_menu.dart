import 'package:flutter/material.dart';

class EnterMenu extends StatelessWidget {
  final void Function() onLogin;
  final void Function() onSignup;

  EnterMenu({Key key, this.onLogin, this.onSignup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FlatButton(
          onPressed: onSignup,
          padding: const EdgeInsets.all(20.0),
          color: Colors.blue,
          splashColor: Colors.transparent,
          child: Text(
            "Create New Account",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6.0),
              side: BorderSide(color: Colors.blue)),
        ),
        SizedBox(height: 8.0),
        FlatButton(
          onPressed: onLogin,
          padding: const EdgeInsets.all(20.0),
          color: Colors.transparent,
          splashColor: Colors.transparent,
          child: Text(
            "Log In",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6.0),
              side: BorderSide(color: Colors.transparent)),
        ),
      ],
    );
  }
}
