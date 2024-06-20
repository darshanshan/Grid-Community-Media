part of 'text_post_bloc.dart';

@immutable
sealed class TextPostEvent {}

final class TextPostAddTagEvent extends TextPostEvent {
  final String tag;

  TextPostAddTagEvent({required this.tag});
}

final class TextPostRemoveTagEvent extends TextPostEvent {
  final int tagIndex;

  TextPostRemoveTagEvent({required this.tagIndex});
}

final class CreateTextPostEvent extends TextPostEvent {
  final String title;
  final String description;
  final String link;

  CreateTextPostEvent(
      {required this.title, required this.description, required this.link});
}
