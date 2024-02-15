import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';

class ColorSectionHeading extends ConsumerWidget {
  const ColorSectionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
