import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:webon_kit_dart/webon_kit_dart.dart';

final savedThemesProvider =
    StateNotifierProvider<SavedThemeNotifier, AsyncValue<List<NomoColors>>>(
        (ref) {
  return SavedThemeNotifier(ref);
});

class SavedThemeNotifier extends StateNotifier<AsyncValue<List<NomoColors>>> {
  final Ref ref;

  SavedThemeNotifier(this.ref) : super(const AsyncValue.loading()) {
    readThemesFromLocalStorage('nomoTheme').then((value) {
      state = AsyncValue.data(value);
      if (value.isEmpty) {
        state = AsyncValue.error('No themes found!', StackTrace.current);
      }
    });
  }

  Future<List<NomoColors>> readThemesFromLocalStorage(String prefix) async {
    List<NomoColors> themes = [];
    int count = 0;
    while (true) {
      final result = await WebonKitDart.getLocalStorage(key: '$prefix/$count');
      if (result == null) {
        break;
      }

      Logger().i(result);
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
    final themes = state.value;
    if (themes == null) {
      await WebonKitDart.setLocalStorage(
        key: 'nomoTheme/0',
        value: jsonEncode(theme),
      );
    }
    if (themes != null) {
      final count = themes.length;

      await WebonKitDart.setLocalStorage(
        key: 'nomoTheme/$count',
        value: jsonEncode(theme),
      );
    }

    state = AsyncValue.data(
      await readThemesFromLocalStorage('nomoTheme'),
    );
  }
}
