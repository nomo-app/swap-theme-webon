import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';

class ColorsWidget extends ConsumerWidget {
  final Color color;
  final String name;
  final Function() onTap;
  final bool isSelected;
  const ColorsWidget({
    super.key,
    required this.color,
    required this.name,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typo = context.theme.typography;

    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              isSelected ? Colors.black.withOpacity(0.3) : Colors.transparent,
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(16),
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
          ],
        ),
      ),
    );
  }
}
