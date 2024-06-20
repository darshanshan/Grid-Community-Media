import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grid/features/home/domain/home_feed_services.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_homeInitialEvent);
  }

  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());

      final feeds = HomeServices().feedPosts();

      emit(HomeSuccessState(feed: feeds));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
