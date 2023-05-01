import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();

  factory Note.empty() {
    return const Note(
      saved: false,
      text: 'empty',
      postId: 0,
      id: 0,
    );
  }

  const factory Note({
    required bool saved,
    required String text,
    required int postId,
    required int id,
  }) = _Note;
}
