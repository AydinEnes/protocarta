import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/repo/post_repo.dart';

import '../../models/note.dart';
import '../../models/post.dart';
import '../../repo/note_repo.dart';
part 'list_state.dart';
part 'list_event.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({
    required this.noteRepository,
    required this.postRepository,
    required this.listObjectType
  }) : super(const ListState()){
    on<FetchListEvent>(_onFetchListEvent);
  }

  final NoteRepository noteRepository;
  final PostRepository postRepository;

  final Type listObjectType;

  FutureOr<void> _onFetchListEvent(FetchListEvent event, Emitter<ListState> emit) async{
    // if Note is the listObjectType then fetch notes
    if (listObjectType == Note) {
      final notes = await noteRepository.fetchNotes();
      debugPrint('notes: $notes');
      emit (state.copyWith(
        status: ActionStatus.success,
        itemList: notes,
      ));
    }
    // if Post is the listObjectType then fetch posts
    if (listObjectType == Post) {
      final posts = await postRepository.fetchPosts();
      emit (state.copyWith(
        status: ActionStatus.success,
        itemList: posts,
      ));
    }
  }
}

