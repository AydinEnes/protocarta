part of 'post_bloc.dart';

class PostState extends Equatable {
  // state elements
  final String ownerName;
  final bool liked;
  final Note note;
  final int id;

  const PostState({
    this.ownerName = " ",
    this.liked = false,
    // dummy Note
    this.note = const Note(saved: false, text: "a", postId: 1, id: 1),
    this.id = 1,
  });

  PostState copyWith({
  String? ownerName,
  bool? liked,
  Note? note,
  int? id,
  }) {
    return PostState(
      ownerName: ownerName ?? this.ownerName,
      liked: liked ?? this.liked,
      note: note ?? this.note,
      id: id ?? this.id,
    );
  }

  @override
  List<Object> get props => [ownerName, liked, note, id];
}
