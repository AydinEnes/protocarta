import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/core/util/logging.dart';
import 'package:protocarta/models/note.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  final NoteRepository noteRepository;

  PostBloc({
    required this.postRepository,
    required this.noteRepository,
  }) : super(const PostState()) {
    on<LikePostEvent>(_onLikePostEvent);
    on<PostSubscriptionRequestedEvent>(_onPostSubscriptionRequestedEvent);
  }

  Future<FutureOr<void>> _onPostSubscriptionRequestedEvent(
      PostSubscriptionRequestedEvent event, Emitter<PostState> emit) async {
    await emit.forEach<Map<int, Post>>(postRepository.getPostStream,
        onData: (Map<int, Post> allPosts) {
      final newMap = Map<int, Post>.from(allPosts);
      noteRepository.updateNoteStream(
          newMap.values.map((e) => e.note ?? Note.empty()).toList());
      return state.copyWith(allPosts: newMap);
    }, onError: (e, st) {
      AppLogging.logger.e(e, 'Error in _onPostSubscriptionRequestedEvent', st);
      return state.copyWith(allPosts: state.allPosts);
    });
  }

  FutureOr<void> _onLikePostEvent(
      LikePostEvent event, Emitter<PostState> emit) {
    postRepository.likePost(event.post);
  }
}
