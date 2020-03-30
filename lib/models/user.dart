class User {
  String username;
  String password;
  User({this.username, this.password});
  @override
  bool operator ==(Object other) {
    return other is User && other.hashCode == hashCode;
  }

  @override
  int get hashCode {
    return username.hashCode + password.hashCode;
  }

  @override
  String toString() => "Username: $username, Password: $password";
}
