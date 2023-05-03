import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/core/util/logging.dart';
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
    return BlocSelector<PostBloc, PostState, Post>(
      selector: (state) {
        try {
          debugPrint('selector: $id ${state.allPosts[id]}');
          return state.allPosts[id]!;
        } catch (e, st) {
          AppLogging.logger.e(e, 'Error in PostCard', st);
          return Post.empty();
        }
      },
      builder: (context, post) {
        debugPrint('building a post: $id $post');
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: ListTile(
            tileColor: Colors.red.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text('Post id: $id, Owner: ${post.ownerName}'),
            subtitle: post.note != null
                ? NoteCard(id: post.note!.id)
                : const SizedBox(),
            trailing: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.favorite,
                color: post.liked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                context.read<PostBloc>().add(LikePostEvent(post));
              },
            ),
          ),
        );
      },
    );
  }
}
