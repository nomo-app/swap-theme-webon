import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nomo_router/nomo_router.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/widgets/color_section.dart';
import 'package:swap_theme_webon/widgets/example_theme.dart';
import 'package:swap_theme_webon/widgets/expanded_preview.dart';

class ChooseColor extends ConsumerWidget {
  final bool? isEditTheme;

  const ChooseColor({super.key, this.isEditTheme = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPalatteNotifierProvider);
    return NomoRouteBody(
      childrenBuilder: (context, route) {
        final colorArgs = route.urlArguments;

        ColorFields colorField = colorArgs?["name"] ?? ColorFields.primary;

        Logger().i(colorField);

        final startColor = switch (colorField) {
          ColorFields.primary => colors.primary,
          ColorFields.foreground1 => colors.foreground1,
          ColorFields.background1 => colors.background1,
          ColorFields.surface => colors.surface,
          ColorFields.onPrimary => colors.onPrimary,
        };

        Logger().i(colorArgs);

        return [
          Row(
            children: [
              IconButton(
                color: context.theme.colors.foreground1,
                onPressed: () => NomoNavigator.of(context).pop(),
                icon: const Icon(NomoIcons.arrowLeft),
              ),
              const Spacer(),
              NomoText(
                colorField.name,
                style: context.theme.typography.h2,
                color: context.theme.colors.foreground1,
              ),
              const Spacer(),
              const SizedBox(width: 48),
            ],
          ),
          SizedBox(
            width: 400,
            child: Material(
              color: context.theme.colors.background1,
              child: ColorPicker(
                color: startColor,
                enableOpacity: false,
                enableShadesSelection: true,
                pickersEnabled: const <ColorPickerType, bool>{
                  ColorPickerType.both: false,
                  ColorPickerType.primary: false,
                  ColorPickerType.accent: false,
                  ColorPickerType.wheel: true,
                },
                onColorChanged: (Color color) {},
                onColorChangeEnd: (Color color) {
                  Logger().i(color.toString());

                  ref
                      .read(colorPalatteNotifierProvider.notifier)
                      .updateColor(color, colorField.name);
                },
                borderRadius: 8,
                spacing: 4,
                wheelDiameter: 200,
                wheelWidth: 16,
                showColorName: false,
                showColorCode: false,
                copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                  longPressMenu: true,
                ),
                actionButtons: const ColorPickerActionButtons(),
              ),
            ),
          ),
          ExampleTheme(
            theme: colors,
          ),
          const SizedBox(height: 16),
          const ExpandedPreview(),
        ];
      },
    );
  }
}
