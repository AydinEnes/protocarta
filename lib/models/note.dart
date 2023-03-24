
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();
  const factory Note({
    required bool saved,
    required String text,
    required int postId,
    required int id,
  }) = _Note;
}
