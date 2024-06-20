import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Login

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw Exception('Invalid email format.');
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Wrong password provided.');

        default:
          throw Exception('Something went wrong-${e.code}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Register

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw Exception('Password provided is too weak');

        case 'email-already-in-use':
          throw Exception('The account already exists for that email.');
        default:
          throw Exception('Something went wrong-${e.code}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //SignOut

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
