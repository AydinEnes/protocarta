import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';
import 'package:protocarta/models/note.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({
    required this.noteRepository,
    required this.postRepository,
  }) : super(const NoteState()) {
    on<SaveNoteEvent>(_onSaveNoteEvent);
    on<NoteSubscriptionRequestedEvent>(_onNoteSubscriptionRequestedEvent);
    on<FetchNoteEvent>(_onFetchNoteEvent);
    on<AddNoteEvent>(_onAddNoteEvent);
  }

  final NoteRepository noteRepository;
  final PostRepository postRepository;

  FutureOr<void> _onSaveNoteEvent(
      SaveNoteEvent event, Emitter<NoteState> emit) async {
    Note _ = await noteRepository.saveNoteStream(event.note);

  }

  // subscribe to note
  FutureOr<void> _onNoteSubscriptionRequestedEvent(
      NoteSubscriptionRequestedEvent event, Emitter<NoteState> emit) async {
    await emit.forEach<Map<int, Note>>(
      noteRepository.getNoteStream,
      onData: (Map<int, Note> allNotes) {
        final newMap = Map<int, Note>.from(allNotes);
        return state.copyWith(allNotes: newMap);
      },
    );
  }

  // fetch note
  FutureOr<void> _onFetchNoteEvent(
      FetchNoteEvent event, Emitter<NoteState> emit) async {}

  FutureOr<void> _onAddNoteEvent(
      AddNoteEvent event, Emitter<NoteState> emit) async {
    Note _ = await noteRepository.addNoteStream(event.note);
  }
}
