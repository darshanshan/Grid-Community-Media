import 'package:cloud_firestore/cloud_firestore.dart';

class GetUser {
  final _firebase = FirebaseFirestore.instance.collection('users');

  Future<DocumentSnapshot> getUserDoc({required String userID}) async {
    DocumentSnapshot userDoc = await _firebase.doc(userID).get();
    return userDoc;
  }
}
