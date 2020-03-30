import 'package:flutter/material.dart';
import 'package:instagram_fake/models/user.dart';

class UserCard extends StatefulWidget {
  final User user;
  final bool deleting;

  UserCard({Key key, this.user, this.deleting : false}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool _obscurePass = true;
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: widget.deleting ? () {setState(() => _checked = !_checked); } : null,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              widget.deleting ? Checkbox(
                onChanged: (value) {
                  setState(() => _checked = !_checked);
                },
                value: _checked,
              ) : SizedBox.shrink(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.user.username}",
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Text(
                          "Password: ${_obscurePass ? '•' * widget.user.password.length : widget.user.password}",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () =>
                          setState(() => _obscurePass = !_obscurePass),
                      icon: Icon(_obscurePass
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
