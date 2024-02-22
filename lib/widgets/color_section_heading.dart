import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/theme_provider.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/theme.dart';

class ColorSectionHeading extends ConsumerWidget {
  const ColorSectionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ThemeProvider.of(context);

    return SizedBox(
      width: context.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NomoText(
            "Choose a color to start",
            style: context.theme.typography.b3,
            color: context.theme.colors.foreground1,
          ),
          const Spacer(),
          if (themeProvider.colorTheme == ColorMode.DARK.theme)
            IconButton(
              onPressed: () {
                ThemeProvider.of(context).changeColorTheme(
                  ColorMode.LIGHT.theme,
                );
                ref
                    .read(colorPalatteNotifierProvider.notifier)
                    .changeColorTheme(themeProvider.colorTheme.colors);
              },
              icon: const Icon(
                Icons.light_mode,
                color: Colors.white,
              ),
            )
          else
            IconButton(
              onPressed: () {
                ThemeProvider.of(context).changeColorTheme(
                  ColorMode.DARK.theme,
                );
                ref
                    .read(colorPalatteNotifierProvider.notifier)
                    .changeColorTheme(themeProvider.colorTheme.colors);
              },
              icon: const Icon(
                Icons.dark_mode,
              ),
            ),
          const SizedBox(width: 16),
          SecondaryNomoButton(
            text: "Clear Theme",
            textStyle: context.theme.typography.b3.copyWith(
              color: context.theme.colors.error,
            ),
            onPressed: () {
              ref.read(colorPalatteNotifierProvider.notifier).clearColors();
            },
            type: ActionType.danger,
            padding: const EdgeInsets.all(8),
          )
        ],
      ),
    );
  }
}
