import 'dart:convert';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:webon_kit_dart/webon_kit_dart.dart';

part 'saved_themes_provider.g.dart';

@riverpod
class SavedThemeNotifier extends _$SavedThemeNotifier {
  @override
  Future<List<NomoColors>> build() async {
    final themes = await _readThemesFromLocalStorage('nomoTheme');

    return themes;
  }

  Future<List<NomoColors>> _readThemesFromLocalStorage(String prefix) async {
    final result = await WebonKitDart.getLocalStorage(key: prefix);

    if (result == null) {
      return [];
    }

    final decodedJson = jsonDecode(result);

    List<Map<String, dynamic>> themesData =
        List<Map<String, dynamic>>.from(decodedJson);

    final themes = themesData.map((e) => NomoColors.fromJson(e)).toList();

    return themes;
  }

  void addTheme(NomoColors theme) async {
    var themes = AsyncData(
      await _readThemesFromLocalStorage('nomoTheme'),
    );

    themes.value.add(theme);

    final themesJson = jsonEncode(themes.value).toString();

    await WebonKitDart.setLocalStorage(
      key: 'nomoTheme',
      value: themesJson,
    );

    state = AsyncData(themes.value);
  }

  void removeTheme(int index) async {
    var themes = AsyncData(
      await _readThemesFromLocalStorage('nomoTheme'),
    );

    themes.value.removeAt(index);

    final themesJson = jsonEncode(themes.value).toString();

    await WebonKitDart.setLocalStorage(
      key: 'nomoTheme',
      value: themesJson,
    );

    state = AsyncValue.data(themes.value);
  }

  void editSavedTheme(int index) async {
    state = AsyncValue.data(state.value ?? []);

    NomoColors themeToEdit = state.value![index];

    themeToEdit =
        ref.read(colorPalatteNotifierProvider.notifier).getCurrentColors();

    state.value![index] = themeToEdit;

    final themesJson = jsonEncode(state.value).toString();

    await WebonKitDart.setLocalStorage(
      key: 'nomoTheme',
      value: themesJson,
    );

    state = AsyncValue.data(state.value!);

    ref.invalidate(colorPalatteNotifierProvider);
  }
}
