import 'package:flutter/material.dart';
import 'package:instagram_fake/widgets/enter_menu.dart';
import 'package:instagram_fake/widgets/login.dart';

class Start extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Start> {
  bool _login = false;

  Image get _title =>
      Image.asset(Theme.of(context).brightness == Brightness.light
          ? "assets/images/title_light_mode.png"
          : "assets/images/title_dark_mode.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        alignment: AlignmentDirectional.topCenter,
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
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 65.0),
                      child: _title,
                    ),
                    _login
                        ? Login(
                            onLogin: (username, password) {
                              print("Username: $username, Password: $password");
                            },
                          )
                        : EnterMenu(
                            onLogin: () => setState(() => _login = true),
                            onSignup: () {},
                          ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey[400],
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Center(child: Text("Loading")),
            ),
          ],
        ),
      ),
    );
  }
}
