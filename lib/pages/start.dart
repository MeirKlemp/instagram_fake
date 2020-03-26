import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Start> {
  bool _signedUp = false;
  Widget get _cannotSignUp {
    if (_signedUp) {
      return Text(
        "Cannot Create New Account",
        style: TextStyle(
          color: Colors.red,
        ),
      );
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 65.0),
                      child: Image.asset("assets/images/title.png"),
                    ),
                    FlatButton(
                      onPressed: () => setState(() => _signedUp = true),
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.blue,
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
                      onPressed: () {
                        
                      },
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.transparent,
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
                    Center(child: _cannotSignUp),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Divider(color: Colors.grey[400]),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Instagram from Facebook",
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
