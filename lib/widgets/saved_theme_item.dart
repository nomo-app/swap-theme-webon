import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/base/nomo_button.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/expandable/expandable.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:swap_theme_webon/provider/saved_themes_provider.dart';
import 'package:swap_theme_webon/widgets/example_theme.dart';

class SavedThemeItem extends ConsumerWidget {
  final NomoColors theme;
  final String name;
  final int index;

  const SavedThemeItem({
    super.key,
    required this.theme,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expandable(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
      title: NomoText(
        name,
        style: context.typography.b3,
        color: theme.primary,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryNomoButton(
              padding: const EdgeInsets.all(8),
              height: 48,
              width: 140,
              child: NomoText(
                "Set Theme",
                style: context.typography.b3,
                color: context.theme.colors.onPrimary,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () {},
            ),
            NomoButton(
              onPressed: () {
                ref
                    .read(savedThemeNotifierProvider.notifier)
                    .removeTheme(index);
              },
              height: 48,
              width: 100,
              padding: const EdgeInsets.all(8),
              border: Border.all(
                color: theme.error,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NomoText(
                    "Delete",
                    fontWeight: FontWeight.bold,
                    style: context.typography.b3.copyWith(
                      color: theme.error,
                    ),
                  ),
                  Icon(
                    NomoIcons.trashCan,
                    color: theme.error,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ExampleTheme(
          theme: theme,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
