import 'package:flutter/material.dart';
import 'dart:async';
import 'package:instagram_fake/widgets/password_text_field.dart';

class Login extends StatefulWidget {
  final void Function(String username, String password) onLogin;
  final void Function(String username, String password) onDoneLoad;

  Login({this.onLogin, this.onDoneLoad, Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = "";
  String _password = "";
  bool _loading = false;

  bool get _canLogin => _username != "" && _password != "";

  void _login() {
    widget.onLogin(_username, _password);
    setState(() => _loading = true);
    Timer(Duration(seconds: 3), () {
      widget.onDoneLoad(_username, _password);
      setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          onChanged: (username) => setState(() => _username = username),
          decoration: new InputDecoration(
            hintText: "Phone number, email or username",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.6),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.6),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        PasswordTextField(
          onTextChanged: (password) => setState(() => _password = password),
          onSubmitted: (password) {
            if (_canLogin) _login();
          },
        ),
        SizedBox(height: 15.0),
        FlatButton(
          onPressed: !_loading && _canLogin ? _login : null,
          padding: const EdgeInsets.all(15.0),
          color: Colors.blue,
          disabledColor: Colors.blue[200],
          splashColor: Colors.transparent,
          child: _loading
              ? SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
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
