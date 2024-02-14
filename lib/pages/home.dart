import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/widgets/color_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPaletteProvider);

    return NomoRouteBody(
      builder: (context, route) => SingleChildScrollView(
        child: Column(
          children: [
            NomoText(
              'Welcome to the Swap Theme WebOn!',
              style: context.theme.typography.h1,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: context.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NomoText(
                    "Choose a color to start",
                    style: context.theme.typography.b3,
                  ),
                  SecondaryNomoButton(
                    text: "Clear Theme",
                    textStyle: context.theme.typography.b3.copyWith(
                      color: context.theme.colors.error,
                    ),
                    onPressed: () {
                      ref.read(colorPaletteProvider.notifier).clearColors();
                    },
                    type: ActionType.danger,
                    padding: const EdgeInsets.all(4),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const ColorSection(),
            const SizedBox(height: 32),
            PrimaryNomoButton(
              backgroundColor: colors.primary,
              onPressed: () {
                ref.read(colorPaletteProvider.notifier).setTheme();
              },
              height: 52,
              width: context.width * 0.8,
              padding: const EdgeInsets.all(8),
              child: NomoText(
                "Set Theme",
                style: context.theme.typography.b3.copyWith(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
