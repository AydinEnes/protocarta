import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/core/list_bloc/list_bloc.dart';
import 'package:protocarta/core/util/post_card.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';


class PostListView extends StatelessWidget {
  // use dummy page that says "PostListView" for now
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context)  => ListBloc(
          noteRepository: RepositoryProvider.of<NoteRepository>(context),
          postRepository: RepositoryProvider.of<PostRepository>(context),
          listObjectType: Post,
        )..add(const FetchListEvent())
          ..add(const ListSubscriptionRequested()),
        child: BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              // add fetch list event
              //debugPrint('items: $state');
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PostCard(id: state.ids[index]);
                },
                itemCount: state.ids.length,
              );
            }
        ),
      ),
    );
  }

}