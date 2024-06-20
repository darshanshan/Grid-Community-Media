part of 'common_post_bloc.dart';

@immutable
sealed class CommonPostState {}

final class CommonPostInitial extends CommonPostState {}

final class CommonPostLoadingState extends CommonPostState {}
