import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grid/features/create_posts/domain/services/create_post_service.dart';
import 'package:meta/meta.dart';

part 'text_post_event.dart';
part 'text_post_state.dart';

class TextPostBloc extends Bloc<TextPostEvent, TextPostState> {
  List<String> tags = [];
  TextPostBloc() : super(TextPostInitial()) {
    on<TextPostAddTagEvent>(_addTagEvent);
    on<TextPostRemoveTagEvent>(_removeTagEvent);
    on<CreateTextPostEvent>(_createPost);
  }

  FutureOr<void> _addTagEvent(
      TextPostAddTagEvent event, Emitter<TextPostState> emit) {
    tags.add(event.tag);
    emit(TextPostTagsState(tags: tags));
  }

  FutureOr<void> _removeTagEvent(
      TextPostRemoveTagEvent event, Emitter<TextPostState> emit) {
    tags.removeAt(event.tagIndex);
    emit(TextPostTagsState(tags: tags));
  }

  FutureOr<void> _createPost(
      CreateTextPostEvent event, Emitter<TextPostState> emit) async {
    try {
      emit(TextPostLoadingState());
      await CreatePost().textPost(
          postTitle: event.title,
          tags: tags,
          postDescription: event.description,
          link: event.link);
      tags = [];
      emit(TextPostSuccessState());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
