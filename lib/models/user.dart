class User {
  String username;
  String password;
  User({this.username, this.password});
  bool operator==(Object other) {
    return other is User && other.hashCode == hashCode;
  }
  int get hashCode {
    return username.hashCode + password.hashCode;
  }
  String toString() => "Username: $username, Password: $password";
}
