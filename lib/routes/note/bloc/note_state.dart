part of 'note_bloc.dart';

class NoteState extends Equatable {
  final Map<int, Note> allNotes;

  const NoteState({this.allNotes = const {}});

  NoteState copyWith({Map<int, Note>? allNotes}) {
    return NoteState(allNotes: allNotes ?? this.allNotes);
  }

  @override
  List<Object> get props => [allNotes];
}
