import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class ColorsWidget extends StatelessWidget {
  final Color color;
  final String name;
  const ColorsWidget({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
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
                      return AlertDialog(
                        title: const Text('Pick a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerTypeLabels: <ColorPickerType, String>{
                              ColorPickerType.wheel: 'Custom',
                            },
                            onColorChanged: (Color color) {},
                            width: 40,
                            height: 40,
                            borderRadius: 8,
                            spacing: 4,
                            runSpacing: 4,
                            wheelDiameter: 160,
                            heading: const Text('Select color'),
                            subheading: const Text('Select color shade'),
                            wheelWidth: 20,
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
