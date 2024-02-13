import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/widgets/color_widget.dart';

class ColorSection extends ConsumerWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPaletteProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColorsWidget(color: colors.primary, name: "Primary"),
            ColorsWidget(color: colors.foreground1, name: "Foreground"),
            ColorsWidget(color: colors.background1, name: "Background"),
            ColorsWidget(color: colors.surface, name: "Surface"),
          ],
        ),
        SizedBox(
          width: 400,
          height: 500,
          child: ColorPicker(
            color: colors.primary,
            enableOpacity: true,
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
              ref.read(colorPaletteProvider.notifier).updateColor(
                    color,
                    "name",
                  );
            },
            borderRadius: 8,
            spacing: 4,
            wheelDiameter: 200,
            wheelWidth: 16,
            showColorName: true,
            showColorCode: true,
            copyPasteBehavior: const ColorPickerCopyPasteBehavior(
              longPressMenu: true,
            ),
            actionButtons: const ColorPickerActionButtons(),
          ),
        ),
      ],
    );
  }
}
