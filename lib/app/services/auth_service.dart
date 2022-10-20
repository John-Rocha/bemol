import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static AuthService? _instance;
  final _auth = FirebaseAuth.instance;

  AuthService._();
  static AuthService get instance {
    _instance ??= AuthService._();
    return _instance!;
  }

  Future<void> register(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> login(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    userCredential.user?.email;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
