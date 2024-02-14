import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/base/nomo_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';

class ColorsWidget extends ConsumerWidget {
  final Color color;
  final String name;
  final Function() onTap;
  const ColorsWidget({
    super.key,
    required this.color,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typo = context.theme.typography;

    return NomoButton(
      width: context.width * 0.8,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      border: Border.all(
        color: context.theme.colors.primary.withOpacity(0.6),
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
            style: typo.b3,
          ),
          const Spacer(),
          Icon(
            NomoIcons.arrowRight,
            color: context.theme.colors.primary,
            size: 24,
          ),
        ],
      ),
    );
  }
}
