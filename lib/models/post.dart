
import 'package:freezed_annotation/freezed_annotation.dart';
import 'note.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const Post._();
  const factory Post({
    required String ownerName,
    required bool liked,
    required Note note,
    required int id,
  }) = _Post;
}
