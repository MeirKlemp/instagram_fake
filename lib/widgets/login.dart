import 'package:flutter/material.dart';
import 'package:instagram_fake/widgets/password_text_field.dart';

class Login extends StatefulWidget {
  final void Function(String username, String password) onLogin;

  Login({Key key, this.onLogin}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          decoration: new InputDecoration(
            hintText: "Phone number, email or username",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        PasswordTextField(),
        SizedBox(height: 15.0),
        FlatButton(
          onPressed: null,
          padding: const EdgeInsets.all(20.0),
          color: Colors.blue,
          disabledColor: Colors.blue[200],
          splashColor: Colors.transparent,
          child: Text(
            "Log In",
            style: TextStyle(
              color: Colors.white,
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
