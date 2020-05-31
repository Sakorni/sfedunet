class User {
  final String id;
  List<String> watched = [];
  List<String> read = [];

  User({this.id});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        watched = data['wathced'],
        read = data['read'];
}
