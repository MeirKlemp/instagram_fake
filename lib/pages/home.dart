import 'package:flutter/material.dart';
import 'package:instagram_fake/models/users.dart';
import 'package:instagram_fake/models/user.dart';
import 'package:instagram_fake/widgets/user_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> _deleteUsers = [];
  bool _deleting = false;

  void _delete() {
    Users().removeRange(_deleteUsers);
    _deleteUsers.clear();
  }

  Image get _titleLogo =>
      Image.asset(Theme.of(context).brightness == Brightness.light
          ? "assets/images/title_light_mode.png"
          : "assets/images/title_dark_mode.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100.0,
              height: 50.0,
              child: _titleLogo,
            ),
            Text(" Fake"),
          ],
        ),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              onPressed: () => setState(() {
                _deleting = !_deleting;
                if (!_deleting && _deleteUsers.length > 0) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(
                        duration: Duration(seconds: 5),
                        content: Text("Undo deletion?"),
                        action: SnackBarAction(
                          label: "Undo",
                          textColor: Colors.blue,
                          onPressed: () => setState(() => _deleteUsers.clear()),
                        ),
                      ))
                      .closed
                      .then((value) {
                    if (value != SnackBarClosedReason.action) setState(_delete);
                  });
                } else if (_deleting)
                  Scaffold.of(context).hideCurrentSnackBar();
              }),
              icon: Icon(_deleting ? Icons.done : Icons.delete),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          AnimatedContainer(
            padding: const EdgeInsets.all(8.0),
            height: _deleting ? 50.0 : 0,
            duration: Duration(milliseconds: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _deleting
                  ? <Widget>[
                      FlatButton.icon(
                        onPressed: () => setState(
                            () => _deleteUsers = List.from(Users.toList())),
                        icon: Icon(Icons.check_box),
                        label: Text("Select All"),
                      ),
                      FlatButton.icon(
                        onPressed: () => setState(() => _deleteUsers.clear()),
                        icon: Icon(Icons.check_box_outline_blank),
                        label: Text("Unselect All"),
                      ),
                    ]
                  : [],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Users().length,
              itemBuilder: (context, index) {
                return !_deleting && _deleteUsers.contains(Users()[index])
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 1.0),
                        child: UserCard(
                          user: Users()[index],
                          deleting: _deleting,
                          onDeletionSelectedChanged: (user, selected) {
                            if (selected)
                              _deleteUsers.add(user);
                            else
                              _deleteUsers.remove(user);
                          },
                          isDeletionSelected: (user) =>
                              _deleteUsers.contains(user),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
