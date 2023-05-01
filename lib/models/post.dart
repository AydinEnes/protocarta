import 'package:freezed_annotation/freezed_annotation.dart';
import 'note.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const Post._();

  factory Post.empty() {
    return const Post(
      ownerName: 'empty',
      liked: false,
      id: 0,
    );
  }

  const factory Post({
    required String ownerName,
    required bool liked,
    Note? note,
    required int id,
  }) = _Post;
}
