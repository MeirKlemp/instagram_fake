import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final void Function(String password) onTextChanged;
  final void Function(String value) onSubmitted;

  PasswordTextField({Key key, this.onTextChanged, this.onSubmitted}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          width: 1,
          color: Colors.grey[400],
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: widget.onTextChanged,
              onSubmitted: widget.onSubmitted,
              obscureText: _obscure,
              decoration: new InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _obscure = !_obscure),
            icon: Icon(
              _obscure ? Icons.visibility : Icons.visibility_off,
              color: _obscure ? Colors.grey : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
