import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:swap_theme_webon/theme.dart';

final colorPaletteProvider =
    StateNotifierProvider<ColorPalette, NomoColors>((ref) {
  return ColorPalette(ref);
});

class ColorPalette extends StateNotifier<NomoColors> {
  ColorPalette(this.ref) : super(ColorMode.LIGHT.theme.colors);

  final Ref ref;

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

  void setTheme() {}
}

final selectedColorProvider = StateProvider<Color?>((ref) {
  return null;
});

final selectedColorNameProvider = StateProvider<String?>((ref) {
  return null;
});
