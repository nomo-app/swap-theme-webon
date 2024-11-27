import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/buttons/base/nomo_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';

class ColorsWidget extends StatelessWidget {
  final Color color;
  final String name;
  final Function() onTap;
  final NomoColorThemeDataNullable colorData;
  const ColorsWidget({
    super.key,
    required this.color,
    required this.name,
    required this.onTap,
    required this.colorData,
  });

  @override
  Widget build(BuildContext context) {
    final typo = context.theme.typography;

    return NomoButton(
      expandToConstraints: true,
      backgroundColor: context.colors.surface,
      margin: const EdgeInsets.only(bottom: 16),
      width: context.width * 0.9,
      padding: const EdgeInsets.all(16),
      border: Border.all(
        color: colorData.colors.foreground2.withOpacity(0.3),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
      onPressed: onTap,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: colorData.colors.foreground2.withOpacity(0.3),
                width: 2,
              ),
            ),
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 16),
          NomoText(
            "$name Color",
            style: typo.b2.copyWith(
              color: colorData.colors.foreground2,
            ),
          ),
          const Spacer(),
          Icon(
            NomoIcons.arrowRight,
            color: colorData.colors.foreground2,
            size: 24,
          ),
        ],
      ),
    );
  }
}
