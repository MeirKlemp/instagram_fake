import 'package:flutter/material.dart';
import 'dart:async';

class FirstLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  width: 100.0,
                  height: 32.25,
                  child: Image.asset("assets/images/from_facebook_gradient.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
