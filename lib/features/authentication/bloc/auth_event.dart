part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String batch;
  final String registerNo;
  final String department;
  final String dob;
  final String email;
  final String password;

  RegisterEvent(
      {required this.batch,
      required this.registerNo,
      required this.department,
      required this.dob,
      required this.email,
      required this.password});
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});
}
