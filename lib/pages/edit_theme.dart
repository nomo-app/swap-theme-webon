import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_router/router/nomo_navigator.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/icons/nomo_icons.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';
import 'package:swap_theme_webon/provider/saved_themes_provider.dart';
import 'package:swap_theme_webon/widgets/color_section.dart';

class EditTheme extends ConsumerWidget {
  const EditTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NomoRouteBody(
      childrenBuilder: (context, route) {
        final themeIndex = route.urlArguments?["themeIndex"] as int;

        return [
          Row(
            children: [
              IconButton(
                color: context.colors.foreground1,
                onPressed: () {
                  ref.invalidate(colorPalatteNotifierProvider);
                  NomoNavigator.of(context).pop();
                },
                icon: const Icon(NomoIcons.arrowLeft),
              ),
              const Spacer(),
              NomoText(
                "Edit Theme",
                style: context.theme.typography.h2,
                fontWeight: FontWeight.bold,
                color: context.colors.foreground1,
              ),
              const Spacer(),
              const SizedBox(width: 48),
            ],
          ),
          const ColorSection(),
          PrimaryNomoButton(
            onPressed: () {
              // something not working propperly
              ref.read(colorPalatteNotifierProvider.notifier).saveTheme();
              ref
                  .read(savedThemeNotifierProvider.notifier)
                  .removeTheme(themeIndex);

              ref.invalidate(colorPalatteNotifierProvider);
              NomoNavigator.of(context).pop();
            },
            text: "Save Theme",
            textStyle: context.theme.typography.b3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ];
      },
    );
  }
}
