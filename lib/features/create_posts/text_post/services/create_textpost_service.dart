import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePost {
  final _firebase = FirebaseFirestore.instance.collection('posts');
  final String _authUser = FirebaseAuth.instance.currentUser!.uid;
  final _emptyList = <String>[];

  Future<void> textPost({
    required String postTitle,
    required List<String> tags,
    required String postDescription,
    required String link,
  }) async {
    try {
      Map<String, dynamic> data = {
        'postType': 'Text Post',
        'postUserID': _authUser,
        'postedTime': DateTime.now(),
        'postTitle': postTitle,
        'tags': tags,
        'postDescription': postDescription,
        'totalLikes': 0,
        'allLikes': _emptyList,
        'thumbsUPLikes': _emptyList,
        'heartLikes': _emptyList,
        'celebrateLike': _emptyList,
        'totalComments': 0,
        'link': link,
        'isDeleted': false
      };

      await _firebase.add(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
