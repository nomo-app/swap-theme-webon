import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_router/nomo_router.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/widgets/color_widget.dart';

enum ColorFields {
  primary("Primary"),
  foreground1("Foreground"),
  background1("Background"),
  surface("Surface");

  final String name;

  const ColorFields(this.name);
}

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
                  "name": ColorFields.primary,
                });
              },
            ),
            ColorsWidget(
              color: colors.foreground1,
              name: "Foreground",
              onTap: () {
                NomoNavigator.of(context)
                    .pushNamed("/chooseColor", urlArguments: {
                  "name": ColorFields.foreground1,
                });
              },
            ),
            ColorsWidget(
              color: colors.background1,
              name: "Background",
              onTap: () {
                NomoNavigator.of(context)
                    .pushNamed("/chooseColor", urlArguments: {
                  "name": ColorFields.background1,
                });
              },
            ),
            ColorsWidget(
              color: colors.surface,
              name: "Surface",
              onTap: () {
                NomoNavigator.of(context)
                    .pushNamed("/chooseColor", urlArguments: {
                  "name": ColorFields.surface,
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
