import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/expandable/expandable.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:swap_theme_webon/widgets/example_theme.dart';

class SavedThemeItem extends ConsumerWidget {
  final NomoColors theme;
  final String name;

  const SavedThemeItem({super.key, required this.theme, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expandable(
        title: NomoText(
          name,
          style: context.typography.b3,
          color: theme.primary,
        ),
        children: [
          ExampleTheme(
            theme: theme,
          ),
        ]);
  }
}
