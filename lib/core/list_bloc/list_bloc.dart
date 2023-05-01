import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/repo/post_repo.dart';
import 'package:protocarta/models/note.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/core/util/ActionStatus.dart';

part 'list_state.dart';

part 'list_event.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({
    required this.noteRepository,
    required this.postRepository,
    required this.listObjectType,
  }) : super(const ListState()) {
    on<FetchListEvent>(_onFetchListEvent);
    on<ListSubscriptionRequested>(_onListSubscriptionRequested);
  }

  final NoteRepository noteRepository;
  final PostRepository postRepository;

  final Type listObjectType;

  /// We update ids of state in two ways:
  /// 1. Through fetch list. This will update the list upon fetching the list,
  /// pagination, and refresh. All lists use this.
  /// 2. Through list subscription requested. This is called when we want to
  /// add an element to the list in real time. Only certain lists use this.
  FutureOr<void> _onFetchListEvent(
      FetchListEvent event, Emitter<ListState> emit) async {
    // if Note is the listObjectType then fetch notes
    if (listObjectType == Note) {
      final notes = await noteRepository.fetchNotes();
      //debugPrint('notes: $notes');
      emit(state.copyWith(
        status: ActionStatus.success,
        ids: notes.map((e) => e.id).toList(),
      ));
    }
    // if Post is the listObjectType then fetch posts
    if (listObjectType == Post) {
      final posts = await postRepository.fetchPosts();
      final List<Note> notes = posts
          .where((element) => element.note != null)
          .map((e) => e.note!)
          .toList();
      noteRepository.updateNoteStream(notes);
      emit(state.copyWith(
        status: ActionStatus.success,
        ids: posts.map((e) => e.id).toList(),
      ));
    }
  }

  FutureOr<void> _onListSubscriptionRequested(
      ListSubscriptionRequested event, Emitter<ListState> emit) async {
    // if Note is the listObjectType then subscribe to notes
    // if (listObjectType == Note) {
    //   await emit.forEach<ListUpdateObject>(noteRepository.getListUpdateStream,
    //       onData: (ListUpdateObject listUpdateObject) {
    //     List<int> ids = List<int>.from(state.ids);
    //     debugPrint('listUpdateObject: $listUpdateObject');
    //     debugPrint('ids: $ids');
    //     return state.copyWith(ids: [listUpdateObject.id, ...ids]);
    //   });
    // }

    if (listObjectType == Post) {
      await emit.forEach<ListUpdateObject>(postRepository.getListUpdateStream,
          onData: (ListUpdateObject listUpdateObject) {
        List<int> ids = List<int>.from(state.ids);
        debugPrint('listUpdateObject: $listUpdateObject');
        debugPrint('ids: $ids');
        return state.copyWith(ids: [listUpdateObject.id, ...ids]);
      });
      // await emit.forEach<CombinedUpdate>(postRepository.combinedStream,
      //     onData: (CombinedUpdate combinedUpdate) {
      //   debugPrint('combinedUpdate: $combinedUpdate');
      //   List<int> ids = List<int>.from(state.ids);
      //   if (combinedUpdate.allPosts.containsKey(combinedUpdate.listUpdate.id)) {
      //     return state.copyWith(ids: [combinedUpdate.listUpdate.id, ...ids]);
      //   } else {
      //     return state;
      //   }
      // });
    }
  }
}
