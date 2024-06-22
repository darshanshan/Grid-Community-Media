import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:grid/features/create_posts/common_post/domain/sevices/photo_post_service.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'common_post_event.dart';
part 'common_post_state.dart';

class CommonPostBloc extends Bloc<CommonPostEvent, CommonPostState> {
  CommonPostBloc() : super(CommonPostInitial()) {
    on<CreateCommonPostEvent>(_createCommonPost);
    on<CommonPostErrorEvent>(_commonPostError);
  }

  FutureOr<void> _createCommonPost(
      CreateCommonPostEvent event, Emitter<CommonPostState> emit) async {
    try {
      emit(CommonPostLoadingState());
      await CreatePhotoCommonPost().createCommonPost(
        postTitle: event.postTitle,
        tags: event.tags,
        postDescription: event.postDescription,
        link: event.link,
        isVideo: event.isVideo,
        images: event.images,
        video: event.video,
      );
      emit(CommonPostSuccessState());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  FutureOr<void> _commonPostError(
      CommonPostErrorEvent event, Emitter<CommonPostState> emit) {
    emit(CommonPostErrorState(errorText: event.errorText));
  }
}
