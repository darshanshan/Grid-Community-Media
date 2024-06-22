part of 'common_post_bloc.dart';

@immutable
sealed class CommonPostState {}

final class CommonPostInitial extends CommonPostState {}

final class CommonPostLoadingState extends CommonPostState {}

final class CommonPostSuccessState extends CommonPostState {}

final class CommonPostErrorState extends CommonPostState {
  final String errorText;

  CommonPostErrorState({required this.errorText});
}
