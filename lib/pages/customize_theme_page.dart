import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/app/app_bar/nomo_app_bar.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/app/scaffold/nomo_scaffold.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:nomo_ui_kit/theme/theme_provider.dart';
import 'package:nomo_ui_kit/utils/layout_extensions.dart';
import 'package:swap_theme_webon/widgets/color_picker_dialog.dart';
import 'package:swap_theme_webon/widgets/color_widget.dart';
import 'package:webon_kit_dart/webon_kit_dart.dart';

class CutomizeThemePage extends HookConsumerWidget {
  const CutomizeThemePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ThemeProvider.of(context);
    final themeState = useState<NomoColorThemeDataNullable>(theme.colorTheme);

    return NomoScaffold(
      floatingActionButton: PrimaryNomoButton(
        backgroundColor: themeState.value.colors.primary,
        onPressed: () {
          final colors = themeState.value.colors.toJson();
          final Map<String, dynamic> colorsMap = {
            "colors": colors.toString(),
          };
          WebonKitDart.setNomoColors(colorsMap);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NomoText(
              "Set theme",
              fontWeight: FontWeight.bold,
              color: themeState.value.colors.onPrimary,
            ),
            8.hSpacing,
            Icon(
              Icons.check,
              color: themeState.value.colors.onPrimary,
            ),
          ],
        ),
      ),
      appBar: NomoAppBar(
        title: NomoText(
          "Customize",
          style: context.theme.typography.h1,
          fit: true,
        ),
        leading: BackButton(
          color: context.theme.colors.foreground1,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      child: NomoRouteBody(
        padding: const EdgeInsets.all(16),
        maxContentWidth: 650,
        children: [
          8.vSpacing,
          NomoText(
            "Customize the theme to your liking by changing the colors or simply use the predefined theme!",
            style: context.theme.typography.b2,
            textAlign: TextAlign.center,
          ),
          16.vSpacing,
          ColorsWidget(
            color: themeState.value.colors.primary,
            name: "Primary",
            onTap: () => showDialog(
              context: context,
              builder: (context) => ColorPickerDialog(
                pickerColor: themeState.value.colors.primary,
                onColorChanged: (newColor) {
                  themeState.value = themeState.value.copyWith(
                    colors: themeState.value.colors.copyWith(
                      primary: newColor, // Use the new color
                    ),
                  );
                },
              ),
            ),
            colorData: themeState.value,
          ),
          ColorsWidget(
            color: themeState.value.colors.secondary,
            name: "Secondary",
            onTap: () => showDialog(
              context: context,
              builder: (context) => ColorPickerDialog(
                pickerColor: themeState.value.colors.secondary,
                onColorChanged: (newColor) {
                  themeState.value = themeState.value.copyWith(
                    colors: themeState.value.colors.copyWith(
                      secondary: newColor,
                    ),
                  );
                },
              ),
            ),
            colorData: themeState.value,
          ),
          ColorsWidget(
            color: themeState.value.colors.background1,
            name: "Background",
            onTap: () => showDialog(
              context: context,
              builder: (context) => ColorPickerDialog(
                pickerColor: themeState.value.colors.background1,
                onColorChanged: (newColor) {
                  themeState.value = themeState.value.copyWith(
                    colors: themeState.value.colors.copyWith(
                      background1: newColor,
                    ),
                  );
                },
              ),
            ),
            colorData: themeState.value,
          ),
          ColorsWidget(
            color: themeState.value.colors.foreground1,
            name: "Font",
            onTap: () => showDialog(
              context: context,
              builder: (context) => ColorPickerDialog(
                pickerColor: themeState.value.colors.foreground1,
                onColorChanged: (newColor) {
                  themeState.value = themeState.value.copyWith(
                    colors: themeState.value.colors.copyWith(
                      foreground1: newColor,
                    ),
                  );
                },
              ),
            ),
            colorData: themeState.value,
          ),
        ],
      ),
    );
  }
}

extension on NomoColorThemeDataNullable {
  NomoColorThemeDataNullable copyWith({required NomoColors colors}) {
    return NomoColorThemeDataNullable(
      colors: colors,
      key: key,
    );
  }
}
