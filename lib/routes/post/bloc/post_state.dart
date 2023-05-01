part of 'post_bloc.dart';

class PostState extends Equatable {
  final Map<int, Post> allPosts;

  const PostState({this.allPosts = const {}});

  PostState copyWith({Map<int, Post>? allPosts}) {
    return PostState(allPosts: allPosts ?? this.allPosts);
  }

  @override
  List<Object> get props => [allPosts];
}
