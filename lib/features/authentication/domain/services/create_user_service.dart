import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grid/features/authentication/data/models/student_model.dart';

class CreateUser {
  Future create(StudentModel studentData) async {
    String documentID = FirebaseAuth.instance.currentUser!.uid;

    Map<String, dynamic> data = {
      'email': studentData.email,
      'displayName': studentData.name,
      'uid': studentData.registerNo,
      'createdTime': DateTime.now(),
      'batch': studentData.batch,
      'dob': studentData.dob,
      'showEmail': true,
      'department': studentData.department,
      'canMessage': true,
      'blazePoints': 0,
      'role': 'student',
      'notifications': true,
      'userID': documentID,
    };
    final userDocument = await FirebaseFirestore.instance
        .collection('users')
        .doc(documentID)
        .set(data);

    return userDocument;
  }
}
