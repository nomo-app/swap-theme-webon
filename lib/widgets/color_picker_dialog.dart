import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/dialog/nomo_dialog.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';

class ColorPickerDialog extends HookConsumerWidget {
  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;

  const ColorPickerDialog(
      {required this.pickerColor, required this.onColorChanged, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = useState<Color>(pickerColor);

    return NomoDialog(
      showCloseButton: false,
      maxWidth: 440,
      title: "Pick a color",
      titleStyle: context.theme.typography.h1,
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: pickerColor,
          onColorChanged: (value) => selectedColor.value = value,
        ),
      ),
      actions: [
        PrimaryNomoButton(
          onPressed: () {
            onColorChanged(selectedColor.value);
            Navigator.of(context).pop();
          },
          child: const NomoText("Set color"),
        )
      ],
    );
  }
}
