import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/core/util/note_card.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/routes/post/bloc/post_bloc.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (previous, current) {
        debugPrint(
            'build when($id): ${current.allPosts.containsKey(id) && (!previous.allPosts.containsKey(id) || previous.allPosts[id] != current.allPosts[id])}');
        return current.allPosts.containsKey(id) &&
            (!previous.allPosts.containsKey(id) ||
                previous.allPosts[id] != current.allPosts[id]);
      },
      builder: (context, state) {
        debugPrint(
            'building a post: $id ${state.allPosts.keys}\n${state.allPosts.values}');
        if (!state.allPosts.containsKey(id)) {
          return Container(
            height: 20,
            width: double.infinity,
            color: Colors.red,
          );
        }
        debugPrint(
            'building a post: $id ${state.allPosts.keys}\n${state.allPosts.values}');
        debugPrint('building a post: $id ${state.allPosts.containsKey(id)}');
        final posts = Map<int, Post>.from(state.allPosts);
        final displayPost = posts.putIfAbsent(id, () => Post.empty());
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(displayPost.ownerName),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  displayPost.note != null
                      ? Expanded(child: NoteCard(id: displayPost.note!.id))
                      : const SizedBox(),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: displayPost.liked ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<PostBloc>().add(LikePostEvent(displayPost));
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
