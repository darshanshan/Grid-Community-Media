import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final _firebase = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('postedTime', descending: true);

  Stream feedPosts() {
    try {
      final posts = _firebase.snapshots();
      return posts;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
