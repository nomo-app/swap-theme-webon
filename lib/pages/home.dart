import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/widgets/color_section.dart';
import 'package:swap_theme_webon/widgets/color_section_heading.dart';
import 'package:swap_theme_webon/widgets/divider_widget.dart';
import 'package:swap_theme_webon/widgets/home_heading.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPalatteNotifierProvider);

    return NomoRouteBody(
      builder: (context, route) => SingleChildScrollView(
        child: Column(
          children: [
            HomeHeading(colors: colors),
            const SizedBox(height: 24),
            ColorSectionHeading(colors: colors),
            const SizedBox(height: 16),
            const ColorSection(),
            const SizedBox(height: 16),
            PrimaryNomoButton(
              backgroundColor: colors.primary,
              onPressed: () {
                ref.read(colorPalatteNotifierProvider.notifier).setTheme();
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
            ),
            DividerWidget(colors: colors),
            SecondaryNomoButton(
              width: context.width * 0.8,
              height: 52,
              padding: const EdgeInsets.all(8),
              textStyle: context.theme.typography.b3.copyWith(
                color: colors.foreground1,
              ),
              onPressed: () {
                ref.read(colorPalatteNotifierProvider.notifier).saveTheme();
              },
              text: "Save Theme",
            )
          ],
        ),
      ),
    );
  }
}
