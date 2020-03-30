import 'package:instagram_fake/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Users {
  static List<User> _users;

  static Future<void> init() async {
    _users = await _load();
  }

  static Future<Users> instance() async {
    if (_users == null) await init();
    return Users._();
  }

  Users._();

  User operator [](int index) => _users[index];
  void forEach(void Function(User) f) => _users.forEach(f);
  void clear() => removeRange(_users);
  int get length => _users.length;

  bool addUser(User user) {
    if (!_users.contains(user)) {
      _users.add(user);
      _save();
      return true;
    }
    return false;
  }

  bool removeUser(User user) {
    if (_users.contains(user)) {
      _users.remove(user);
      _save();
      return true;
    }
    return false;
  }

  bool removeRange(List<User> users) {
    bool removed = false;
    for (User user in users) {
      if (_users.contains(user)) {
        _users.remove(user);
        removed = true;
      }
    }
    if (removed) _save();
    return removed;
  }

  static const String _START_USERNAME = "<USERNAME!>";
  static const String _END_USERNAME = "</USERNAME~>";
  static const String _START_PASSWORD = "<PASSWORD!>";
  static const String _END_PASSWORD = "</PASSWORD~>";

  static Future<void> _save() async {
    final file = await _localFile;
    String data = "";
    _users.forEach((user) {
      data += "$_START_USERNAME${user.username}$_END_USERNAME\n" +
          "$_START_PASSWORD${user.password}$_END_PASSWORD\n";
    });

    // write the file
    file.writeAsString(data);
  }

  static Future<List<User>> _load() async {
    List<User> users = [];
    try {
      final file = await _localFile;

      // read the file
      String contents = await file.readAsString();

      while (contents.contains(_START_USERNAME)) {
        contents = contents.substring(
            contents.indexOf(_START_USERNAME) + _START_USERNAME.length);
        users.add(User(
          username: contents.substring(0, contents.indexOf(_END_USERNAME)),
          password: contents.substring(
              contents.indexOf(_START_PASSWORD) + _START_PASSWORD.length,
              contents.indexOf(_END_PASSWORD)),
        ));
      }
    } catch (e) {
      print("Error while loading.");
    }
    return users;
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.txt');
  }
}
