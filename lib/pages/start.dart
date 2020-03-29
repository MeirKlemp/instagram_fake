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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
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
                          child: _title,
                        ),
                        _login
                            ? Login(
                                onLogin: (username, password) {
                                  print(
                                      "Username: $username, Password: $password");
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Can't Find Account"),
                                          content: Text(
                                              "We can't find an account with $username. Try another phone number or email."),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: Text(
                                                "Try Again",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                              )
                            : EnterMenu(
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
      }),
    );
  }
}
