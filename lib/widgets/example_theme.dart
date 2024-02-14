import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/card/nomo_card.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';

class ExampleTheme extends ConsumerWidget {
  const ExampleTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPaletteProvider);

    return NomoCard(
      backgroundColor: colors.surface,
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NomoText(
                'Small Text',
                style: context.theme.typography.b1.copyWith(
                  color: colors.foreground1,
                ),
              ),
              NomoText(
                'Medium Text',
                style: context.theme.typography.b3.copyWith(
                  color: colors.foreground1,
                ),
              ),
              NomoText(
                'Large Text',
                style: context.theme.typography.h1.copyWith(
                  color: colors.foreground1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrimaryNomoButton(
                onPressed: () {},
                padding: const EdgeInsets.all(12),
                width: 100,
                text: "Button",
                backgroundColor: colors.primary,
                textStyle: context.theme.typography.b3.copyWith(
                  color: colors.onPrimary,
                ),
              ),
              SecondaryNomoButton(
                onPressed: () {},
                width: 100,
                padding: const EdgeInsets.all(12),
                text: "Button",
                textStyle: context.theme.typography.b3.copyWith(
                  color: colors.foreground1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
