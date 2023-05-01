import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/models/note.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/routes/post/bloc/post_bloc.dart';

class PostCreateView extends StatelessWidget {
  // use dummy page that says "PostDetailedView" for now
  const PostCreateView({super.key, required this.postBloc});

  final PostBloc postBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: postBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('PostCreateView')),
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                return CupertinoButton(
                    onPressed: () {
                      context.read<PostBloc>().add(
                        const CreatePostEvent(Post(
                          note: Note(
                            text: 'Newest note',
                            saved: false,
                            postId: 26863,
                            id: 26666,
                          ),
                          ownerName: 'Dora',
                          liked: false,
                          id: 26863,
                        )),
                      );
                    },
                    child: const Text('Create Post'));
              },
            )
          ],
        ),
      ),
    );
  }
}
