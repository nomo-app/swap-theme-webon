import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';

enum ThemeDisplayMode {
  light,
  dark,
}

class ThemeModeToggle extends StatelessWidget {
  final ThemeDisplayMode selectedMode;
  final ValueChanged<ThemeDisplayMode> onModeChanged;

  const ThemeModeToggle({
    Key? key,
    required this.selectedMode,
    required this.onModeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final isSelected = [
      selectedMode == ThemeDisplayMode.light,
      selectedMode == ThemeDisplayMode.dark,
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ToggleButtons(
        constraints: const BoxConstraints(
          minWidth: 120,
          maxWidth: 220,
          minHeight: 40,
        ),
        direction: Axis.horizontal,
        onPressed: (index) {
          onModeChanged(ThemeDisplayMode.values[index]);
        },
        borderRadius: BorderRadius.circular(20),
        borderColor: theme.colors.foreground1,
        selectedColor: theme.colors.onPrimary,
        selectedBorderColor: theme.colors.foreground1,
        fillColor: theme.colors.primary,
        borderWidth: 1.5,
        color: theme.colors.foreground1,
        isSelected: isSelected,
        children: const [
          NomoText(
            'Light Themes',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          NomoText(
            'Dark Themes',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
