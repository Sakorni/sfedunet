import 'package:firebase_auth/firebase_auth.dart';

class FBAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///Аутентификация через почту и пароль
  Future<FirebaseUser> logIn({String email, String password}) async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        print(user.uid);
      }
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  ///Регистрация через почту и пароль
  Future<FirebaseUser> reg({String email, String password}) async {
    print('email is $email');
    print('password is $password');
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    print(user);
    return user;
  }
}
