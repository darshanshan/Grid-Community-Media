class StudentModel {
  final String dob;
  final String batch;
  final String department;
  final String email;
  final String gender;
  final String name;
  final String registerNo;
  final String rollNo;
  final String section;

  StudentModel(
      {required this.dob,
      required this.batch,
      required this.department,
      required this.email,
      required this.gender,
      required this.name,
      required this.registerNo,
      required this.rollNo,
      required this.section});

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      dob: map['dob'],
      batch: map['batch'],
      department: map['department'],
      email: map['email'],
      gender: map['gender'],
      name: map['name'],
      registerNo: map['registerNo'],
      rollNo: map['rollNo'],
      section: map['section'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dob': dob,
      'batch': batch,
      'department': department,
      'email': email,
      'gender': gender,
      'name': name,
      'registerNo': registerNo,
      'rollNo': rollNo,
      'section': section,
    };
  }
}
