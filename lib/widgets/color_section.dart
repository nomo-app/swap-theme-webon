import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_router/nomo_router.dart';
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
            ColorsWidget(
              color: colors.primary,
              name: "Primary",
              onTap: () {
                NomoNavigator.of(context)
                    .pushNamed("/chooseColor", urlArguments: {
                  "color": colors.primary,
                  "name": "Primary",
                });
              },
            ),
            ColorsWidget(
              color: colors.foreground1,
              name: "Foreground",
              onTap: () {
                NomoNavigator.of(context)
                    .pushNamed("/chooseColor", urlArguments: {
                  "color": colors.foreground1,
                  "name": "Foreground",
                });
              },
            ),
            ColorsWidget(
              color: colors.background1,
              name: "Background",
              onTap: () {
                NomoNavigator.of(context)
                    .pushNamed("/chooseColor", urlArguments: {
                  "color": colors.background1,
                  "name": "Background",
                });
              },
            ),
            ColorsWidget(
              color: colors.surface,
              name: "Surface",
              onTap: () {
                NomoNavigator.of(context)
                    .pushNamed("/chooseColor", urlArguments: {
                  "color": colors.surface,
                  "name": "Surface",
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
