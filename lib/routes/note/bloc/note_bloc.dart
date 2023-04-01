import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';


import '../../../models/note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({
    required this.noteRepository,
    required this.postRepository,
  }) : super(NoteState()) {
    on<SaveNoteEvent>(_onSaveNoteEvent);
    on<SubscribeToNoteEvent>(_onSubscribeToNoteEvent);
    on<FetchNoteEvent>(_onFetchNoteEvent);
    on<AddNoteEvent>(_onAddNoteEvent);
  }

  final NoteRepository noteRepository;
  final PostRepository postRepository;

  FutureOr<void> _onSaveNoteEvent(SaveNoteEvent event, Emitter<NoteState> emit) async {
    Note note = await noteRepository.saveNoteStream(
      event.note.id,
      event.note.text,
      event.note.postId,
      event.note.saved,
    );
    postRepository.updatePostsWithNotes(
      [note],
    );
    emit(state.copyWith(saved: note.saved));
  }

  // subscribe to note
  FutureOr<void> _onSubscribeToNoteEvent(SubscribeToNoteEvent event, Emitter<NoteState> emit) async {
    await emit.forEach<Set<Note>>(
      noteRepository.getNoteStream,
      onData: (Set<Note> list) {
        Note note = list.firstWhere((element) => element.id == event.id);
        return state.copyWith(saved: note.saved, text: note.text, postId: note.postId, id: note.id);
      },
    );
  }

  // fetch note
  FutureOr<void> _onFetchNoteEvent(FetchNoteEvent event, Emitter<NoteState> emit) async {
    Note note = event.note;
    emit(state.copyWith(saved: note.saved, text: note.text, postId: note.postId, id: note.id));
  }
  

  FutureOr<void> _onAddNoteEvent(AddNoteEvent event, Emitter<NoteState> emit) async {
    Note note = await noteRepository.addNoteStream(
      event.note
    );
  }


}



