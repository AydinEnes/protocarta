part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LikePostEvent extends PostEvent {
  final Post post;

  const LikePostEvent(this.post);

  @override
  List<Object?> get props => [post];
}

class PostSubscriptionRequestedEvent extends PostEvent {
  const PostSubscriptionRequestedEvent();

  @override
  List<Object?> get props => [];
}
