part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class InformationMisMatchState extends AuthState {}

class AuthInitialState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String successsMessage;

  AuthSuccessState({required this.successsMessage});
}

class AuthLoginErroState extends AuthState {}

class AuthLoadingState extends AuthState {}
