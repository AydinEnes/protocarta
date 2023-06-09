import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protocarta/routes/note/bloc/note_bloc.dart';
import 'package:protocarta/routes/note/note_create_view.dart';
import 'package:protocarta/routes/note/note_detailed_view.dart';
import 'package:protocarta/routes/post/bloc/post_bloc.dart';
import 'package:protocarta/routes/post/post_create_view.dart';
import 'package:protocarta/routes/post/post_detailed_view.dart';
import 'package:protocarta/routes/post/post_list_view.dart';

import '../models/note.dart';
import '../routes/home/home_view.dart';
import '../routes/note/note_list_view.dart';

part 'app_router.gr.dart';
@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'HomeTabViewRouter',
      page: HomeView,
      children: [
        AutoRoute(page: PostListView, initial: true),
        AutoRoute(page: NoteListView),
      ],
    ),
    AutoRoute(
      page: PostDetailedView,
      path: '/post/:id',
    ),
    AutoRoute(
      page: NoteDetailedView,
      path: '/note/:id',
    ),
    AutoRoute(
      page: PostCreateView,
      path: '/post/create',
    ),
    AutoRoute(
      page: NoteCreateView,
      path: '/note/create',
    ),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}