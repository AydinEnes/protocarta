import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:protocarta/repo/note_repo.dart';


import '../../../models/note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({
    required this.noteRepository,
  }) : super(NoteState()) {
    on<SaveNoteEvent>(_onSaveNoteEvent);
  }

  final NoteRepository noteRepository;

  FutureOr<void> _onSaveNoteEvent(SaveNoteEvent event, Emitter<NoteState> emit) {
    noteRepository.saveNoteStream(
      event.note.id,
      event.note.text,
      event.note.postId,
      event.note.saved,
    );
    emit(state.copyWith(saved: !event.note.saved));
  }
}
