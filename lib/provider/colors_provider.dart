import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swap_theme_webon/provider/saved_themes_provider.dart';
import 'package:swap_theme_webon/theme.dart';
import 'package:webon_kit_dart/webon_kit_dart.dart';

part 'colors_provider.g.dart';

@riverpod
class ColorPalatteNotifier extends _$ColorPalatteNotifier {
  @override
  NomoColors build() {
    return ColorMode.LIGHT.theme.colors;
  }

  void updateColor(Color color, String name) {
    state = state.copyWith(
      primary: name == "Primary" ? color : state.primary,
      onPrimary: name == "On Primary" ? color : state.onPrimary,
      primaryContainer:
          name == "Primary Container" ? color : state.primaryContainer,
      secondary: name == "Secondary" ? color : state.secondary,
      onSecondary: name == "On Secondary" ? color : state.onSecondary,
      secondaryContainer:
          name == "Secondary Container" ? color : state.secondaryContainer,
      background1: name == "Background" ? color : state.background1,
      background2: name == "Background 2" ? color : state.background2,
      background3: name == "Background 3" ? color : state.background3,
      disabled: name == "Disabled" ? color : state.disabled,
      error: name == "Error" ? color : state.error,
      foreground1: name == "Foreground" ? color : state.foreground1,
      surface: name == "Surface" ? color : state.surface,
    );
  }

  void clearColors() {
    state = ColorMode.LIGHT.theme.colors;
  }

  void setTheme(NomoColors colors) async {
    Logger().i("Setting Theme");

    ref.read(savedThemeNotifierProvider.notifier).addTheme(colors);

    await WebonKitDart.setColors(colors);
  }

  void saveTheme() {
    ref.read(savedThemeNotifierProvider.notifier).addTheme(state);
  }

  void setColors(NomoColors colors) {
    state = colors;
  }
}
