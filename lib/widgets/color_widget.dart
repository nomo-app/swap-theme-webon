import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nomo_ui_kit/components/dialog/nomo_dialog.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';

class ColorsWidget extends ConsumerWidget {
  final Color color;
  final String name;
  const ColorsWidget({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typo = context.theme.typography;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return NomoDialog(
                        title: "Select a color",
                        titleStyle: context.theme.typography.h2,
                        maxWidth: 450,
                        content: Material(
                          color: Colors.transparent,
                          child: ColorPicker(
                            color: color,
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
                              ref
                                  .read(colorPaletteProvider.notifier)
                                  .updateColor(
                                    color,
                                    name,
                                  );
                            },
                            borderRadius: 8,
                            spacing: 4,
                            wheelDiameter: 200,
                            wheelWidth: 16,
                            showColorName: true,
                            showColorCode: true,
                            copyPasteBehavior:
                                const ColorPickerCopyPasteBehavior(
                              longPressMenu: true,
                            ),
                            actionButtons: const ColorPickerActionButtons(),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  width: 48,
                  height: 48,
                ),
              ),
              const SizedBox(width: 16),
              NomoText(
                name,
                style: typo.b3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
