part of 'create_event_bloc.dart';

@immutable
sealed class CreateEventEvent {}

final class CreatingEvent extends CreateEventEvent {
  final String title;
  final String description;
  final XFile coverImage;
  final String eventType;
  final String location;
  final String eventLink;
  final String clubName;
  final String registrations;
  final DateTime date;
  final DateTime time;

  CreatingEvent({
    required this.title,
    required this.date,
    required this.time,
    required this.description,
    required this.coverImage,
    required this.eventType,
    required this.location,
    required this.eventLink,
    required this.clubName,
    required this.registrations,
  });
}

final class ErrorEvent extends CreateEventEvent {
  final String errorText;

  ErrorEvent({required this.errorText});
}
