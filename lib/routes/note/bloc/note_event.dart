part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();
}

class SaveNoteEvent extends NoteEvent {
  final Note note;

  const SaveNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}