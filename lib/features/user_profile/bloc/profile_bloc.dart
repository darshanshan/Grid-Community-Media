import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialEvent>(_profileInitialEvent);
  }

  FutureOr<void> _profileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit) {}
}
