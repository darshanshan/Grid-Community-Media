import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grid/model/event_model.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventService {
  final _firebase = FirebaseFirestore.instance.collection('events');
  final _storage = FirebaseStorage.instance;
  final _userID = FirebaseAuth.instance.currentUser!.uid;

  Future<void> createEvent(
      {required String title,
      required String description,
      required DateTime date,
      required DateTime time,
      required XFile coverImage,
      required String eventType,
      required String location,
      required String eventLink,
      required String clubName,
      required String registrations}) async {
    String? imageDownloadUrl;

    try {
      try {
        final imagePath = File(coverImage.path);
        final ref = _storage.ref(
            'uploads/images/${DateTime.now().millisecondsSinceEpoch.toString()}_${coverImage.name}');
        final upload = await ref.putFile(imagePath);
        final imageUrl = await upload.ref.getDownloadURL();
        imageDownloadUrl = imageUrl;
      } catch (e) {
        rethrow;
      }
      final data = EventModel(
        eventName: title,
        eventID: '',
        eventLocation: location,
        eventDate: date,
        eventTime: time,
        eventParticipants: [],
        eventType: eventType,
        createdUserID: _userID,
        coverPic: imageDownloadUrl,
        eventDescription: description,
        eventLink: eventLink,
        registrations: registrations,
        createdTime: DateTime.now(),
        chatID: '',
        isdeleted: false,
      ).toMap();
      final createdEvent = await _firebase.add(data);
      final String createdEventID = createdEvent.id;
      await _firebase.doc(createdEventID).update({'eventID': createdEventID});
    } catch (e) {
      rethrow;
    }
  }
}
