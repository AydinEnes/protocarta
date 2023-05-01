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
    HomeTabViewRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    PostDetailedRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PostDetailedView(),
      );
    },
    NoteDetailedRoute.name: (routeData) {
      final args = routeData.argsAs<NoteDetailedRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NoteDetailedView(
          key: args.key,
          note: args.note,
        ),
      );
    },
    PostCreateRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PostCreateView(),
      );
    },
    NoteCreateRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NoteCreateView(),
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
          HomeTabViewRouter.name,
          path: '/',
          children: [
            RouteConfig(
              PostListRoute.name,
              path: '',
              parent: HomeTabViewRouter.name,
            ),
            RouteConfig(
              NoteListRoute.name,
              path: 'note-list-view',
              parent: HomeTabViewRouter.name,
            ),
          ],
        ),
        RouteConfig(
          PostDetailedRoute.name,
          path: '/post/:id',
        ),
        RouteConfig(
          NoteDetailedRoute.name,
          path: '/note/:id',
        ),
        RouteConfig(
          PostCreateRoute.name,
          path: '/post/create',
        ),
        RouteConfig(
          NoteCreateRoute.name,
          path: '/note/create',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeTabViewRouter extends PageRouteInfo<void> {
  const HomeTabViewRouter({List<PageRouteInfo>? children})
      : super(
          HomeTabViewRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeTabViewRouter';
}

/// generated route for
/// [PostDetailedView]
class PostDetailedRoute extends PageRouteInfo<void> {
  const PostDetailedRoute()
      : super(
          PostDetailedRoute.name,
          path: '/post/:id',
        );

  static const String name = 'PostDetailedRoute';
}

/// generated route for
/// [NoteDetailedView]
class NoteDetailedRoute extends PageRouteInfo<NoteDetailedRouteArgs> {
  NoteDetailedRoute({
    Key? key,
    required Note note,
  }) : super(
          NoteDetailedRoute.name,
          path: '/note/:id',
          args: NoteDetailedRouteArgs(
            key: key,
            note: note,
          ),
        );

  static const String name = 'NoteDetailedRoute';
}

class NoteDetailedRouteArgs {
  const NoteDetailedRouteArgs({
    this.key,
    required this.note,
  });

  final Key? key;

  final Note note;

  @override
  String toString() {
    return 'NoteDetailedRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [PostCreateView]
class PostCreateRoute extends PageRouteInfo<void> {
  const PostCreateRoute()
      : super(
          PostCreateRoute.name,
          path: '/post/create',
        );

  static const String name = 'PostCreateRoute';
}

/// generated route for
/// [NoteCreateView]
class NoteCreateRoute extends PageRouteInfo<void> {
  const NoteCreateRoute()
      : super(
          NoteCreateRoute.name,
          path: '/note/create',
        );

  static const String name = 'NoteCreateRoute';
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
