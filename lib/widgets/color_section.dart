import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/expandable/expandable.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/widgets/color_widget.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expandable(
        title: NomoText(
          "Palette Colors",
          style: context.theme.typography.b2,
        ),
        children: [
          ColorsWidget(color: context.colors.primary, name: "Primary"),
          ColorsWidget(color: context.colors.onPrimary, name: "On Primary"),
          ColorsWidget(
              color: context.colors.primaryContainer,
              name: "Primary Container"),
          ColorsWidget(color: context.colors.secondary, name: "Secondary"),
          ColorsWidget(color: context.colors.onSecondary, name: "On Secondary"),
          ColorsWidget(
              color: context.colors.secondaryContainer,
              name: "Secondary Container"),
          ColorsWidget(color: context.colors.background1, name: "Background 1"),
          ColorsWidget(color: context.colors.background2, name: "Background 2"),
          ColorsWidget(color: context.colors.background3, name: "Background 3"),
          ColorsWidget(color: context.colors.disabled, name: "Disabled"),
          ColorsWidget(color: context.colors.error, name: "Error"),
          ColorsWidget(color: context.colors.surface, name: "Surface"),
        ]);
  }
}
