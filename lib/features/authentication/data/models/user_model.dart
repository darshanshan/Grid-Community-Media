class UserModel {
  final String dob;
  final String batch;
  final String department;
  final String email;
  final String name;
  final String registerNo;

  UserModel({
    required this.dob,
    required this.batch,
    required this.department,
    required this.email,
    required this.name,
    required this.registerNo,
  });

  factory UserModel.toMap(Map<String, dynamic> map) {
    return UserModel(
      dob: map['dob'],
      batch: map['batch'],
      department: map['department'],
      email: map['email'],
      name: map['name'],
      registerNo: map['registerNo'],
    );
  }

  Map<String, dynamic> fromMap() {
    return {
      'email': email,
      'name': name,
      'registerNo': registerNo,
      'batch': batch,
      'dob': dob,
      'department': department,
    };
  }
}
