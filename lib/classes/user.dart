class User {
  final String token;

  User({this.token});
  User.fromData(Map<String, dynamic> data) : token = data['jwt'];
}
