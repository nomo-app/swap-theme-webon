import 'dart:convert';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:webon_kit_dart/webon_kit_dart.dart';

part 'saved_themes_provider.g.dart';

@riverpod
class SavedThemeNotifier extends _$SavedThemeNotifier {
  @override
  Future<List<NomoColors>> build() async {
    final themes = await _readThemesFromLocalStorage('nomoTheme');
    if (themes.isEmpty) {
      return [];
    }

    return themes;
  }

  Future<List<NomoColors>> _readThemesFromLocalStorage(String prefix) async {
    List<NomoColors> themes = [];
    int count = 0;
    while (true) {
      final result = await WebonKitDart.getLocalStorage(key: '$prefix/$count');
      if (result == null) {
        break;
      }
      final themeFromLocalStorage = json.decode(result);

      count++;
      themes.add(NomoColors.fromJson(themeFromLocalStorage));
    }

    if (themes.isEmpty) {
      return [];
    }

    return themes;
  }

  void addTheme(NomoColors theme) async {
    final themes = AsyncData(
      await _readThemesFromLocalStorage('nomoTheme'),
    );

    final count = themes.value.length;

    await WebonKitDart.setLocalStorage(
      key: 'nomoTheme/$count',
      value: jsonEncode(theme),
    );

    state = AsyncValue.data([
      ...themes.value,
      theme,
    ]);
  }
}
