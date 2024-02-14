import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_router/router/nomo_navigator.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';

class SavedThemes extends ConsumerWidget {
  const SavedThemes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorPaletteProvider);
    return NomoRouteBody(
      builder: (context, route) {
        return Column(
          children: [
            SizedBox(
              width: context.width * 0.8,
              child: Row(
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
                    color: colors.foreground1,
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
