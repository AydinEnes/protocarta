part of 'note_bloc.dart';

class NoteState extends Equatable {

  final bool saved;
  final String text;
  final int postId;
  final int id;

  const NoteState({
    this.saved = false,
    this.text = '',
    this.postId = 0,
    this.id = 0,
  });

  NoteState copyWith({
    bool? saved,
    String? text,
    int? postId,
    int? id,
  }) {
    return NoteState(
      saved: saved ?? this.saved,
      text: text ?? this.text,
      postId: postId ?? this.postId,
      id: id ?? this.id,
    );
  }

  @override
  List<Object> get props => [saved, text, postId, id];
}