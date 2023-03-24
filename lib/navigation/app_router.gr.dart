// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeView(),
      );
    },
    PostDetailedRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PostDetailedView(),
      );
    },
    NoteDetailedRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NoteDetailedView(),
      );
    },
    PostListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PostListView(),
      );
    },
    NoteListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NoteListView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            RouteConfig(
              PostListRoute.name,
              path: '',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              NoteListRoute.name,
              path: 'note-list-view',
              parent: HomeRoute.name,
            ),
          ],
        ),
        RouteConfig(
          PostDetailedRoute.name,
          path: 'post/:id',
        ),
        RouteConfig(
          NoteDetailedRoute.name,
          path: 'note/:id',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [PostDetailedView]
class PostDetailedRoute extends PageRouteInfo<void> {
  const PostDetailedRoute()
      : super(
          PostDetailedRoute.name,
          path: 'post/:id',
        );

  static const String name = 'PostDetailedRoute';
}

/// generated route for
/// [NoteDetailedView]
class NoteDetailedRoute extends PageRouteInfo<void> {
  const NoteDetailedRoute()
      : super(
          NoteDetailedRoute.name,
          path: 'note/:id',
        );

  static const String name = 'NoteDetailedRoute';
}

/// generated route for
/// [PostListView]
class PostListRoute extends PageRouteInfo<void> {
  const PostListRoute()
      : super(
          PostListRoute.name,
          path: '',
        );

  static const String name = 'PostListRoute';
}

/// generated route for
/// [NoteListView]
class NoteListRoute extends PageRouteInfo<void> {
  const NoteListRoute()
      : super(
          NoteListRoute.name,
          path: 'note-list-view',
        );

  static const String name = 'NoteListRoute';
}
