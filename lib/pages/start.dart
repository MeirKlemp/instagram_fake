import 'package:flutter/material.dart';
import 'package:instagram_fake/widgets/enter_menu.dart';
import 'package:instagram_fake/widgets/login.dart';

class Start extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Start> {
  bool _login = false;

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
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 65.0),
                      child: Image.asset("assets/images/title.png"),
                    ),
                    _login ? Login() :
                    EnterMenu(
                      onLogin: () => setState(() => _login = true),
                      onSignup: () {},
                    ),
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
