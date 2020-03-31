import 'package:flutter/material.dart';
import 'dart:async';
import 'package:instagram_fake/models/users.dart';


class FirstLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Users.init();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/start");
    });

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 50.0),
                SizedBox(
                    width: 75.0,
                    height: 75.0,
                    child: Image.asset("assets/images/logo.png")),
                Column(
                  children: <Widget>[
                    Text(
                      "from",
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "FACEBOOK",
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
