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

class NoteSubscriptionRequestedEvent extends NoteEvent {
  const NoteSubscriptionRequestedEvent();

  @override
  List<Object?> get props => [];
}

class AddNoteEvent extends NoteEvent {
  final Note note;

  const AddNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}
