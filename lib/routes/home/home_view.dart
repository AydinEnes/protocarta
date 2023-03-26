import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/navigation/app_router.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';
import 'package:protocarta/routes/note/note_list_view.dart';
import 'package:protocarta/routes/post/post_list_view.dart';

import '../../core/list_bloc/list_bloc.dart';

class HomeView extends StatelessWidget {
  @override
  // there should be an AppBar, BottomNavigationBar, and tabs for posts and notes list views using AutoRoute
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protocarta'),
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
    );
  }
} // HomeView


