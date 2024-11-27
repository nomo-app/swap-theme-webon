import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:swap_theme_webon/theme.dart';
import 'package:swap_theme_webon/utils.dart';
import 'package:swap_theme_webon/widgets/theme_preview_card.dart';

class ThemeSelectionList extends StatelessWidget {
  final ColorMode selectedMode;
  final ValueChanged<ColorMode> onThemeSelected;
  final Map<ColorMode, NomoColorThemeDataNullable> themes;

  const ThemeSelectionList({
    Key? key,
    required this.themes,
    required this.selectedMode,
    required this.onThemeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeModes = themes.keys.toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: themes.length,
        itemBuilder: (context, index) {
          final mode = themeModes[index];
          final theme = themes[mode]!;
          return ThemePreviewCard(
            theme: theme,
            themeName: getThemeName(mode),
            isSelected: selectedMode == mode,
            onSelect: () => onThemeSelected(mode),
            colorMode: mode,
          );
        },
      ),
    );
  }
}
