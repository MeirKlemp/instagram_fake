import 'package:flutter/material.dart';
import 'package:instagram_fake/models/users.dart';
import 'package:instagram_fake/widgets/user_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Users _users;
  bool _deleting = false;

  @override
  Widget build(BuildContext context) {
    if (_users == null) {
      Users.instance().then((users) => setState(() => _users = users));
      return Scaffold(
        body: SafeArea(
            child: Center(
          child: CircularProgressIndicator(),
        )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Fake"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => setState(() => _deleting = !_deleting),
            icon:Icon( _deleting ? Icons.done : Icons.delete),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 1.0),
            child: UserCard(
              user: _users[index],
              deleting: _deleting,
            ),
          );
        },
      ),
    );
  }
}
