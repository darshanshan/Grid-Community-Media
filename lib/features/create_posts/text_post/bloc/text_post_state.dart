part of 'text_post_bloc.dart';

@immutable
sealed class TextPostState {}

final class TextPostInitial extends TextPostState {}

final class TextPostTagsState extends TextPostState {
  final List<String> tags;

  TextPostTagsState({required this.tags});
}

final class TextPostSuccessState extends TextPostState {}

final class TextPostLoadingState extends TextPostState {}
