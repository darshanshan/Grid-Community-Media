import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'common_post_event.dart';
part 'common_post_state.dart';

class CommonPostBloc extends Bloc<CommonPostEvent, CommonPostState> {
  CommonPostBloc() : super(CommonPostInitial()) {
    on<CommonPostInitialEvent>(_initialEvent);
  }

  FutureOr<void> _initialEvent(
      CommonPostInitialEvent event, Emitter<CommonPostState> emit) {
    emit(CommonPostInitial());
  }
}
