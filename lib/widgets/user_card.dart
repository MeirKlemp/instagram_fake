import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_fake/models/user.dart';

class UserCard extends StatefulWidget {
  final void Function(User user, bool selected) onDeletionSelectedChanged;
  final bool Function(User user) isDeletionSelected;
  final User user;
  final bool deleting;

  UserCard(
      {Key key,
      this.user,
      this.deleting: false,
      this.onDeletionSelectedChanged,
      this.isDeletionSelected})
      : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool _obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: widget.deleting
            ? () => setState(() => widget.onDeletionSelectedChanged(
                widget.user, !widget.isDeletionSelected(widget.user)))
            : null,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              widget.deleting
                  ? Checkbox(
                      onChanged: (value) => setState(() =>
                          widget.onDeletionSelectedChanged(widget.user,
                              !widget.isDeletionSelected(widget.user))),
                      value: widget.isDeletionSelected(widget.user),
                    )
                  : SizedBox.shrink(),
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
                    Row(
                      children: <Widget>[
                        _obscurePass ? SizedBox.shrink() :
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: widget.user.password));
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Copied to clipboard!"),
                            ));
                          },
                          icon: Icon(Icons.content_copy),
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
