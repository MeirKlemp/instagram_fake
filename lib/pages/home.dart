import 'package:flutter/material.dart';
import 'package:instagram_fake/models/users.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Users _users;

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
      body: SafeArea(
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return Card(child: Text("${_users[index]}"));
          },
        ),
      ),
    );
  }
}
