import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/expandable/expandable.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NomoText(
            name,
            style: context.typography.h2,
            color: theme.primary,
          ),
          PrimaryNomoButton(
            backgroundColor: theme.primary,
            padding: const EdgeInsets.all(8),
            child: NomoText(
              "Set Theme",
              style: context.typography.b3,
              color: context.theme.colors.onPrimary,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () {
              ref.read(colorPalatteNotifierProvider.notifier).setTheme(theme);
            },
          ),
          IconButton(
            iconSize: 36,
            onPressed: () {
              ref.read(savedThemeNotifierProvider.notifier).removeTheme(index);
            },
            icon: Icon(
              Icons.delete_forever_outlined,
              color: context.colors.error,
            ),
          ),
        ],
      ),
      children: [
        const SizedBox(height: 16),
        ExampleTheme(
          isEditAble: true,
          theme: theme,
          themeIndex: index,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
