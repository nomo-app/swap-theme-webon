// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// RouteGenerator
// **************************************************************************

class AppRouter extends NomoAppRouter {
  AppRouter()
      : super(
          {
            HomeScreenRoute.path: ([a]) => HomeScreenRoute(),
            ChooseColorRoute.path: ([a]) => ChooseColorRoute(),
            SavedThemesRoute.path: ([a]) => SavedThemesRoute(),
          },
          _routes.expanded.where((r) => r is! NestedPageRouteInfo).toList(),
          _routes.expanded.whereType<NestedPageRouteInfo>().toList(),
        );
}

class HomeScreenArguments {
  const HomeScreenArguments();
}

class HomeScreenRoute extends AppRoute implements HomeScreenArguments {
  HomeScreenRoute()
      : super(
          name: '/',
          page: HomeScreen(),
        );
  static String path = '/';
}

class ChooseColorArguments {
  const ChooseColorArguments();
}

class ChooseColorRoute extends AppRoute implements ChooseColorArguments {
  ChooseColorRoute()
      : super(
          name: '/chooseColor',
          page: ChooseColor(),
        );
  static String path = '/chooseColor';
}

class SavedThemesArguments {
  const SavedThemesArguments();
}

class SavedThemesRoute extends AppRoute implements SavedThemesArguments {
  SavedThemesRoute()
      : super(
          name: '/savedThemes',
          page: SavedThemes(),
        );
  static String path = '/savedThemes';
}
