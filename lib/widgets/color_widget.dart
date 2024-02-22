import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/buttons/base/nomo_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';

class ColorsWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final typo = context.theme.typography;

    return NomoButton(
      expandToConstraints: true,
      backgroundColor: context.colors.surface,
      margin: const EdgeInsets.only(bottom: 16),
      width: context.width * 0.9,
      padding: const EdgeInsets.all(16),
      border: Border.all(
        color: Colors.black.withOpacity(0.5),
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
                width: 2,
              ),
            ),
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 16),
          NomoText(
            name,
            style: typo.b3.copyWith(
              color: context.colors.foreground1,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: NomoText(
              description,
              fit: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: typo.b2.copyWith(
                color: context.colors.foreground1,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            NomoIcons.arrowRight,
            color: context.theme.colors.foreground1,
            size: 24,
          ),
        ],
      ),
    );
  }
}
