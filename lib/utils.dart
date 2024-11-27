import 'package:swap_theme_webon/theme.dart';

String getThemeName(ColorMode mode) {
  return mode
      .toString()
      .split('.')
      .last
      .split('_')
      .map(
        (word) => word[0].toUpperCase() + word.substring(1).toLowerCase(),
      )
      .join(' ');
}
