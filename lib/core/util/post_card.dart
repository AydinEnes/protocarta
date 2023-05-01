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
            'build when: ${current.allPosts.containsKey(id) && (!previous.allPosts.containsKey(id) || previous.allPosts[id] != current.allPosts[id])}');
        return current.allPosts.containsKey(id) &&
            (!previous.allPosts.containsKey(id) ||
                previous.allPosts[id] != current.allPosts[id]);
      },
      builder: (context, state) {
        final posts = Map.from(state.allPosts);
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
