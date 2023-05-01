import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/navigation/app_router.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';
import 'package:protocarta/routes/note/bloc/note_bloc.dart';
import 'package:protocarta/routes/post/bloc/post_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  // there should be an AppBar, BottomNavigationBar, and tabs for posts and notes list views using AutoRoute
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteBloc(
              noteRepository: RepositoryProvider.of<NoteRepository>(context),
              postRepository: RepositoryProvider.of<PostRepository>(context))
            ..add(const NoteSubscriptionRequestedEvent()),
        ),
        BlocProvider(
          create: (context) => PostBloc(
            postRepository: RepositoryProvider.of<PostRepository>(context),
            noteRepository: RepositoryProvider.of<NoteRepository>(context),
          )..add(const PostSubscriptionRequestedEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Protocarta'),
          actions: [
            IconButton(
              icon: const Icon(Icons.post_add),
              onPressed: () {
                context.router.push(const NoteCreateRoute());
              },
            ),
            IconButton(
              icon: const Icon(Icons.note_add),
              onPressed: () {
                context.router.push(const PostCreateRoute());
              },
            )
          ],
        ),
        // add AutoRoute tabs here
        body: AutoTabsScaffold(
          routes: const [
            PostListRoute(),
            NoteListRoute(),
          ],
          bottomNavigationBuilder: (context, tabsRouter) {
            return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  label: 'Posts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Notes',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
} // HomeView
