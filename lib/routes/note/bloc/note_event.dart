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

class FetchNoteEvent extends NoteEvent {
  final Note note;

  const FetchNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}

class SubscribeToNoteEvent extends NoteEvent {
  final int id;

  const SubscribeToNoteEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class AddNoteEvent extends NoteEvent {
  final Note note;

  const AddNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}