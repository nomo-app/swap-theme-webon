import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/base/nomo_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';

class ColorsWidget extends ConsumerWidget {
  final Color color;
  final String name;
  final Function() onTap;
  final String description;
  const ColorsWidget({
    super.key,
    required this.color,
    required this.name,
    required this.onTap,
    required this.description,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typo = context.theme.typography;
    final colors = ref.watch(colorPaletteProvider);

    return NomoButton(
      backgroundColor: colors.surface,
      width: context.width * 0.8,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      border: Border.all(
        color: colors.primary.withOpacity(0.5),
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
                color: Colors.black.withOpacity(0.3),
                width: 1,
              ),
            ),
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 16),
          NomoText(
            name,
            style: typo.b3.copyWith(
              color: colors.foreground1,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: NomoText(
              description,
              maxLines: 3,
              style: typo.b2.copyWith(
                color: colors.foreground1,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            NomoIcons.arrowRight,
            color: colors.primary,
            size: 24,
          ),
        ],
      ),
    );
  }
}
