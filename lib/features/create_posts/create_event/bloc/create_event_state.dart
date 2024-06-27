part of 'create_event_bloc.dart';

@immutable
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}

final class LoadingState extends CreateEventState {}

final class SuccessState extends CreateEventState {}

final class ErrorState extends CreateEventState {
  final String errorLabel;

  ErrorState({required this.errorLabel});
}
