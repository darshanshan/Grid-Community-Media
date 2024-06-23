import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String displayName;
  final String batch;
  final int blazePoints;
  final String department;
  final String dob;
  final bool canMessage;
  final String email;
  final bool notifications;
  final String role;
  final String uid;
  final bool showEmail;
  final String userID;
  final DateTime? createdTime;

  UserModel({
    required this.displayName,
    required this.batch,
    required this.blazePoints,
    required this.department,
    required this.dob,
    required this.canMessage,
    required this.email,
    required this.notifications,
    required this.role,
    required this.uid,
    required this.userID,
    required this.showEmail,
    required this.createdTime,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] ?? '',
      batch: map['batch'] ?? '',
      blazePoints: map['blazePoints'] ?? 0,
      department: map['department'] ?? '',
      dob: map['dob'] ?? '',
      canMessage: map['canMessage'] ?? false,
      email: map['email'] ?? '',
      notifications: map['notifications'] ?? false,
      role: map['role'] ?? '',
      uid: map['uid'] ?? '',
      userID: map['userID'] ?? '',
      showEmail: map['showEmail'] ?? false,
      createdTime: map['createdTime'] != null
          ? (map['createdTime'] as Timestamp).toDate()
          : null,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'batch': batch,
      'blazePoints': blazePoints,
      'department': department,
      'dob': dob,
      'canMessage': canMessage,
      'email': email,
      'notifications': notifications,
      'uid': uid,
      'userID': userID,
      'role': role,
      'showEmail': showEmail,
      'createdTime': createdTime,
    };
  }
}
