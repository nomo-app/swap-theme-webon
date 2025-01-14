import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_router/nomo_router.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/widgets/color_widget.dart';

enum ColorFields {
  primary("Primary"),
  foreground1("Foreground"),
  background1("Background"),
  surface("Surface"),
  onPrimary("On Primary");

  final String name;

  const ColorFields(this.name);
}

class ColorSection extends ConsumerWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPalatteNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ColorsWidget(
          color: colors.primary,
          name: "Primary Color of the App",
          onTap: () => _onTap(ColorFields.primary, context),
        ),
        ColorsWidget(
          color: colors.onPrimary,
          name: "Text Color on Primary Color",
          onTap: () => _onTap(ColorFields.onPrimary, context),
        ),
        ColorsWidget(
          color: colors.foreground1,
          name: "Foreground Color of the App",
          onTap: () => _onTap(ColorFields.foreground1, context),
        ),
        ColorsWidget(
          color: colors.background1,
          name: "Background Color of the App",
          onTap: () => _onTap(ColorFields.background1, context),
        ),
        // ColorsWidget(
        //   color: colors.surface,
        //   name: "Surface",
        //   description: "The surface color of the app (cards, etc)",
        //   onTap: () => _onTap(ColorFields.surface, context),
        // ),
      ],
    );
  }

  _onTap(ColorFields field, BuildContext context) {
    NomoNavigator.of(context).pushNamed("/chooseColor", urlArguments: {
      "name": field,
    });
  }
}
