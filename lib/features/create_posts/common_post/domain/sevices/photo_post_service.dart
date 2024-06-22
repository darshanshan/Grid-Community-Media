import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grid/model/post_model.dart';
import 'package:image_picker/image_picker.dart';

class CreatePhotoCommonPost {
  final _firbase = FirebaseFirestore.instance.collection('posts');
  final _storage = FirebaseStorage.instance;
  final userID = FirebaseAuth.instance.currentUser!.uid;

  Future<void> createCommonPost(
      {required String postTitle,
      required List<String> tags,
      required String postDescription,
      required String link,
      required bool isVideo,
      required List<XFile> images,
      XFile? video}) async {
    try {
      String videoDownloadUrl = '';
      List<String> imageDownloadUrl = [];

      if (isVideo) {
        try {
          File videoFile = File(video!.path);
          Reference ref = _storage.ref().child(
              'uploads/videos/${DateTime.now().millisecondsSinceEpoch.toString()}_${video.name}');
          final uploadVideo = await ref.putFile(videoFile);
          final url = await uploadVideo.ref.getDownloadURL();
          videoDownloadUrl = url;
        } catch (e) {
          throw Exception(e.toString());
        }
      } else {
        for (XFile image in images) {
          File file = File(image.path);
          try {
            Reference ref = _storage.ref().child(
                'uploads/images/${DateTime.now().millisecondsSinceEpoch.toString()}_${image.name}');
            final uploadImage = await ref.putFile(file);
            final url = await uploadImage.ref.getDownloadURL();
            imageDownloadUrl.add(url);
          } catch (e) {
            throw Exception(e.toString());
          }
        }
      }

      final data = PostModel(
        postType: 'common post',
        postUserID: userID,
        postedTime: DateTime.now(),
        postTitle: postTitle,
        postDescription: postDescription,
        videoUrl: videoDownloadUrl,
        imageUrls: imageDownloadUrl,
        tags: tags,
        announcementDate: null,
        announcementImage: '',
        groupID: '',
        totalLikes: 0,
        allLikes: [],
        thumbsUPLikes: [],
        heartLikes: [],
        celebrateLikes: [],
        totalComments: 0,
        link: link,
        isDeleted: false,
      );
      final createData = data.toMap();
      await _firbase.add(createData);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
