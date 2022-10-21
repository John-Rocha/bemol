import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static AuthService? _instance;
  final _auth = FirebaseAuth.instance;
  bool isAuth = false;

  AuthService._();
  static AuthService get instance {
    _instance ??= AuthService._();
    return _instance!;
  }

  Future<bool> register(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => isAuth = true)
          .onError((error, stackTrace) => isAuth = false);
      return isAuth;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => isAuth = true)
          .onError((error, stackTrace) => isAuth = false);
      return isAuth;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
