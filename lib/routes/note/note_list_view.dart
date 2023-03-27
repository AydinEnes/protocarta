import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/core/list_bloc/list_bloc.dart';
import 'package:protocarta/models/note.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context)  => ListBloc(
          noteRepository: RepositoryProvider.of<NoteRepository>(context),
          postRepository: RepositoryProvider.of<PostRepository>(context),
          listObjectType: Note,
        )..add(FetchListEvent())
        ..add(ListSubscriptionRequested()),
        child: BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              // add fetch list event
              debugPrint('items: $state');
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${(state.itemList[index] as Note).text}'),
                    onTap: () {
                      // navigate to NoteDetailedView
                    },
                  );
                },
                itemCount: state.itemList.length,
              );
            }
        ),
      ),
    );
  }

}

/*
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Note $index'),
            onTap: () {
              // navigate to NoteDetailedView
            },
          );
        },
      ),

      body: BlocProvider(
        create: (BuildContext context)  => ListBloc(
          noteRepository: RepositoryProvider.of<NoteRepository>(context),
          postRepository: RepositoryProvider.of<PostRepository>(context),
          listObjectType: Post,
        ),
        child: BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: Text('Home ${state.status}'),
                  ),
                  OutlinedButton(onPressed: (){
                    context.read<ListBloc> ().add(FetchListEvent());
                  },
                    child: Text('Fetch List'),
                  ),
                ],
              );
            }
        ),
      ),
 */