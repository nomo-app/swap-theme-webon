import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_router/nomo_router.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/card/nomo_card.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';

class ExampleTheme extends ConsumerWidget {
  final NomoColors theme;
  final bool? isEditAble;
  final int? themeIndex;

  const ExampleTheme(
      {required this.theme,
      this.isEditAble = false,
      super.key,
      this.themeIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NomoCard(
      backgroundColor: context.theme.colors.background1,
      elevation: context.theme.colors.brightness == Brightness.light ? 4 : 0,
      border: context.theme.colors.brightness == Brightness.dark
          ? Border.all(color: context.theme.colors.foreground3, width: 1)
          : null,
      borderRadius: BorderRadius.circular(8),
      padding: isEditAble!
          ? const EdgeInsets.only(bottom: 16)
          : const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isEditAble != null && isEditAble == true) ...[
            IconButton(
              iconSize: 36,
              onPressed: () {
                ref
                    .read(colorPalatteNotifierProvider.notifier)
                    .setColors(theme);

                NomoNavigator.of(context).pushNamed(
                  "/editTheme",
                  urlArguments: {
                    "themeIndex": themeIndex,
                  },
                );
              },
              icon:
                  Icon(Icons.mode_edit_outline_outlined, color: theme.primary),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NomoText(
                'Small Text',
                style: context.theme.typography.b1.copyWith(
                  color: theme.foreground1,
                ),
              ),
              NomoText(
                'Medium Text',
                style: context.theme.typography.b3.copyWith(
                  color: theme.foreground1,
                ),
              ),
              NomoText(
                'Large Text',
                style: context.theme.typography.h1.copyWith(
                  color: theme.foreground1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrimaryNomoButton(
                onPressed: () {},
                padding: const EdgeInsets.all(12),
                width: 100,
                backgroundColor: theme.primary,
                child: NomoText(
                  "Button",
                  style: context.theme.typography.b3.copyWith(
                    color: theme.onPrimary,
                  ),
                ),
              ),
              SecondaryNomoButton(
                onPressed: () {},
                width: 100,
                padding: const EdgeInsets.all(12),
                text: "Button",
                textStyle: context.theme.typography.b3.copyWith(
                  color: theme.foreground1,
                ),
              ),
              NomoCard(
                backgroundColor: theme.secondaryContainer.lighten(),
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: Image.asset(
                    "assets/images/home.png",
                    color: theme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
