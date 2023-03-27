import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:protocarta/core/ActionStatus.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/repo/post_repo.dart';

import '../../../models/note.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    required this.postRepository,
  }) : super(PostState()) {
    on<LikePostEvent>(_onLikePostEvent);
  }

  final PostRepository postRepository;

FutureOr<void> _onLikePostEvent(LikePostEvent event, Emitter<PostState> emit) {
    postRepository.likePost(
      event.post.id,
      event.post.liked,
      event.post.ownerName,
      event.post.note,
    );
    emit(state.copyWith(liked: !event.post.liked));
  }
}
