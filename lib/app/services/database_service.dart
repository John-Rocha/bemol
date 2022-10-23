import 'package:bemol_test/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  static DatabaseService? _instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool isSaved = false;

  DatabaseService._();
  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }

  Future<bool> addUser(UserModel userModel) async {
    try {
      await _db.collection('users').add(userModel.toMap()).then((user) {
        isSaved = true;
      }).catchError((error) {
        isSaved = false;
      });
      return isSaved;
    } on FirebaseException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }
}
