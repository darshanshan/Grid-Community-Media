import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grid/features/create_posts/create_event/domain/create_event_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'create_event_event.dart';
part 'create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  CreateEventBloc() : super(CreateEventInitial()) {
    on<CreatingEvent>(_createEvent);
    on<ErrorEvent>(_errorEvent);
  }

  FutureOr<void> _createEvent(
      CreatingEvent event, Emitter<CreateEventState> emit) async {
    emit(LoadingState());
    try {
      await CreateEventService().createEvent(
          title: event.title,
          description: event.description,
          date: event.date,
          time: event.time,
          coverImage: event.coverImage,
          eventType: event.eventType,
          location: event.location,
          eventLink: event.eventLink,
          clubName: event.clubName,
          registrations: event.registrations);
      emit(SuccessState());
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _errorEvent(ErrorEvent event, Emitter<CreateEventState> emit) {
    emit(ErrorState(errorLabel: event.errorText));
  }
}
