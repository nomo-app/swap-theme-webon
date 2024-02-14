import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_router/router/nomo_navigator.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/provider/saved_themes_provider.dart';
import 'package:swap_theme_webon/widgets/saved_theme_item.dart';

class SavedThemes extends ConsumerWidget {
  const SavedThemes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPaletteProvider);
    final themes = ref.watch(savedThemesProvider);

    return NomoRouteBody(
      builder: (context, route) {
        return Column(
          children: [
            Row(
              children: [
                IconButton(
                  color: colors.foreground1,
                  onPressed: () {
                    NomoNavigator.of(context).pop();
                  },
                  icon: const Icon(NomoIcons.arrowLeft),
                ),
                const Spacer(),
                NomoText(
                  "Saved Themes",
                  style: context.theme.typography.h2,
                  fontWeight: FontWeight.bold,
                  color: colors.foreground1,
                ),
                const Spacer(),
                const SizedBox(width: 48),
              ],
            ),
            if (themes.isLoading)
              const Center(child: CircularProgressIndicator()),
            if (themes.hasError)
              NomoText(
                themes.error.toString(),
                style: context.theme.typography.h2,
                color: colors.error,
              ),
            if (themes.hasValue)
              Expanded(
                child: ListView.builder(
                  itemCount: themes.value!.length,
                  itemBuilder: (context, index) {
                    final theme = themes.value![index];
                    return SavedThemeItem(
                      theme: theme,
                      name: "Theme ${index + 1}",
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
