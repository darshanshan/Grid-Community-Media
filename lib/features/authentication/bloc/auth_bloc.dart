import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grid/features/authentication/domain/services/auth_services.dart';
import 'package:grid/features/authentication/domain/services/create_user_service.dart';
import 'package:grid/features/authentication/domain/services/student_query_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<RegisterEvent>(_registerEvent);
    on<AuthLoginEvent>(_authLoginEvent);
  }

  //Register....

  FutureOr<void> _registerEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      final studentDataValues = await StudentQuery().checkStudent(event.email,
          event.registerNo, event.department, event.batch, event.dob);

      if (studentDataValues == null) {
        emit(InformationMisMatchState());
      } else {
        await AuthServices().register(event.email, event.password);

        await CreateUser().create(studentDataValues);

        emit(AuthSuccessState(successsMessage: 'SignUp Successful'));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Batch Dropdown Value....

  FutureOr<void> _authLoginEvent(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      // ignore: unused_local_variable
      final login = await AuthServices().login(event.email, event.password);
      emit(AuthSuccessState(successsMessage: 'SignIn Successful'));
    } catch (e) {
      emit(AuthLoginErroState());
    }
  }
}
