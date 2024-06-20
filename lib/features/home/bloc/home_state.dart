part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final Stream feed;

  HomeSuccessState({required this.feed});
}
