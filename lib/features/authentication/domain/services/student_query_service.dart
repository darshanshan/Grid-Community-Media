import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grid/features/authentication/data/models/student_model.dart';

class StudentQuery {
  final _firebase = FirebaseFirestore.instance.collection('students');

  Future checkStudent(String email, String registerNo, String department,
      String batch, String dob) async {
    final document = await _firebase
        .where('email', isEqualTo: email)
        .where('registerNo', isEqualTo: registerNo)
        .where('department', isEqualTo: department)
        .where('batch', isEqualTo: batch)
        .where('dob', isEqualTo: dob)
        .get();

    if (document.docs.isEmpty) {
      return null;
    } else {
      final queryDocument = document.docs.first;
      return StudentModel.fromMap(queryDocument.data());
    }
  }
}
