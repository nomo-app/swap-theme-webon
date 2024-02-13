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
    final selectedColor = ref.watch(selectedColorProvider);
    final selectedColorName = ref.watch(selectedColorNameProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColorsWidget(
              color: colors.primary,
              name: "Primary",
              isSelected: selectedColor == colors.primary,
              onTap: () {
                ref.read(selectedColorNameProvider.notifier).state = "Primary";
                ref.read(selectedColorProvider.notifier).state = colors.primary;
              },
            ),
            ColorsWidget(
              color: colors.foreground1,
              name: "Foreground",
              isSelected: selectedColor == colors.foreground1,
              onTap: () {
                ref.read(selectedColorNameProvider.notifier).state =
                    "Foreground";
                ref.read(selectedColorProvider.notifier).state =
                    colors.foreground1;
              },
            ),
            ColorsWidget(
              color: colors.background1,
              name: "Background",
              isSelected: selectedColor == colors.background1,
              onTap: () {
                ref.read(selectedColorNameProvider.notifier).state =
                    "Background";
                ref.read(selectedColorProvider.notifier).state =
                    colors.background1;
              },
            ),
            ColorsWidget(
              color: colors.surface,
              isSelected: selectedColor == colors.surface,
              name: "Surface",
              onTap: () {
                ref.read(selectedColorNameProvider.notifier).state = "Surface";
                ref.read(selectedColorProvider.notifier).state = colors.surface;
              },
            ),
          ],
        ),
        SizedBox(
          width: 400,
          height: 500,
          child: ColorPicker(
            color: selectedColor ?? Colors.white,
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
                    selectedColorName ?? "Primary",
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

enum ColorMode {
  Primary,
  Foreground,
  Background,
  Surface,
}
