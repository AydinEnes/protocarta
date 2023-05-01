import 'dart:async';
import 'package:equatable/equatable.dart';
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
      emit(state.copyWith(
        status: ActionStatus.success,
        ids: posts.map((e) => e.id).toList(),
      ));
    }
  }

  FutureOr<void> _onListSubscriptionRequested(
      ListSubscriptionRequested event, Emitter<ListState> emit) async {
    // listen to notes and posts streams and emit the state with the new list
    // if (listObjectType == Note) {
    //   await emit.forEach<Set<Note>>(noteRepository.getNoteStream,
    //       onData: (Set<Note> list) {
    //     final List<int> ids = List<int>.from(state.itemList.map((e) => e.id));
    //     final List finalList = ids
    //         .map((e) => list.firstWhere((element) => element.id == e))
    //         .toList();
    //     return state.copyWith(itemList: finalList);
    //   });
    // }

    if (listObjectType == Post) {
      await emit.forEach<ListUpdateObject>(postRepository.getListUpdateStream,
          onData: (ListUpdateObject listUpdateObject) {
        List<int> ids = List<int>.from(state.ids);

        return state.copyWith(ids: [listUpdateObject.id, ...ids]);
      });
    }
  }
}
