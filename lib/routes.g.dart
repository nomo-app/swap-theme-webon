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
            ChooseColorRoute.path: ([a]) {
              final typedArgs = a as ChooseColorArguments?;
              return ChooseColorRoute(
                isEditTheme: typedArgs?.isEditTheme ?? false,
              );
            },
            SavedThemesRoute.path: ([a]) => SavedThemesRoute(),
            EditThemeRoute.path: ([a]) => EditThemeRoute(),
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
  final bool? isEditTheme;
  const ChooseColorArguments({
    required this.isEditTheme,
  });
}

class ChooseColorRoute extends AppRoute implements ChooseColorArguments {
  @override
  final bool? isEditTheme;
  ChooseColorRoute({
    this.isEditTheme = false,
  }) : super(
          name: '/chooseColor',
          page: ChooseColor(
            isEditTheme: isEditTheme,
          ),
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

class EditThemeArguments {
  const EditThemeArguments();
}

class EditThemeRoute extends AppRoute implements EditThemeArguments {
  EditThemeRoute()
      : super(
          name: '/editTheme',
          page: EditTheme(),
        );
  static String path = '/editTheme';
}
