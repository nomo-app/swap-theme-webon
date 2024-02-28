import 'package:logger/logger.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
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
    return ColorMode.LIGHT.theme.colors.copyWith(
      secondaryContainer:
          ColorMode.LIGHT.theme.colors.secondaryContainer.lighten(0.1),
    );
  }

  void updateColor(Color color, String name) {
    switch (name) {
      case "Primary":
        state = state.copyWith(primary: color);
        state = state.copyWith(
          primaryContainer: color.lighten(0.1),
        );
      case "On Primary":
        state = state.copyWith(onPrimary: color);
      case "Primary Container":
        state = state.copyWith(primaryContainer: color);
      case "Secondary":
        state = state.copyWith(secondary: color);
      case "On Secondary":
        state = state.copyWith(onSecondary: color);
      case "Secondary Container":
        state = state.copyWith(secondaryContainer: color);
      case "Background":
        state = state.copyWith(
          background1: color,
          background2: color.darken(0.2),
          background3: color.darken(0.3),
          secondaryContainer: color.lighten(0.2),
        );
        Logger().i("Updated Background colors!");

      case "Disabled":
        state = state.copyWith(disabled: color);
      case "Error":
        state = state.copyWith(error: color);
      case "Foreground":
        state = state.copyWith(
          foreground1: color,
          foreground2: color.darken(0.2),
          foreground3: color.darken(0.3),
        );

        Logger().i("Updated Foreground colors!");

      case "Surface":
        state = state.copyWith(surface: color);
        break;
      default:
    }
  }

  void updateBrigthness(Brightness brightness) {
    state = state.copyWith(brightness: brightness);
  }

  void clearColors() {
    state = ColorMode.LIGHT.theme.colors;
  }

  void changeColorTheme(NomoColors colors) {
    state = colors;
  }

  void setTheme(NomoColors colors) async {
    Logger().i("Setting Theme");

    //ref.read(savedThemeNotifierProvider.notifier).addTheme(colors);

    await WebonKitDart.setColors(colors);
  }

  void saveTheme() {
    ref.read(savedThemeNotifierProvider.notifier).addTheme(state);
  }

  void setColors(NomoColors colors) {
    state = colors;
  }

  NomoColors getCurrentColors() {
    return state;
  }
}
