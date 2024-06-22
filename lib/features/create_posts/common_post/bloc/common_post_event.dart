part of 'common_post_bloc.dart';

@immutable
sealed class CommonPostEvent {}

final class CreateCommonPostEvent extends CommonPostEvent {
  final String postTitle;
  final List<String> tags;
  final String postDescription;
  final String link;
  final bool isVideo;
  final List<XFile> images;
  final XFile? video;

  CreateCommonPostEvent({
    required this.postTitle,
    required this.tags,
    required this.postDescription,
    required this.link,
    required this.isVideo,
    required this.images,
    this.video,
  });
}

final class CommonPostErrorEvent extends CommonPostEvent {
  final String errorText;

  CommonPostErrorEvent({required this.errorText});
}
