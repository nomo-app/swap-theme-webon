import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/app/app.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:nomo_ui_kit/theme/theme_provider.dart';
import 'package:nomo_ui_kit/utils/layout_extensions.dart';
import 'package:swap_theme_webon/theme.dart';
import 'package:swap_theme_webon/widgets/theme_mode_toggle.dart';
import 'package:swap_theme_webon/widgets/theme_selection_list.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  Map<ColorMode, NomoColorThemeDataNullable> getThemes(ThemeDisplayMode mode) {
    final allThemes = AppThemeDelegate().getColorThemes();

    if (mode == ThemeDisplayMode.dark) {
      return {
        ColorMode.DARK: allThemes[ColorMode.DARK]!,
        ColorMode.BLACK: allThemes[ColorMode.BLACK]!,
        ColorMode.DARKOCEAN: allThemes[ColorMode.DARKOCEAN]!,
        ColorMode.CYBERPUNK: allThemes[ColorMode.CYBERPUNK]!,
        ColorMode.VOLCANICDARK: allThemes[ColorMode.VOLCANICDARK]!,
        ColorMode.AVINOC: allThemes[ColorMode.AVINOC]!,
      };
    } else {
      return {
        ColorMode.LIGHT: allThemes[ColorMode.LIGHT]!,
        ColorMode.MODERNBLUE: allThemes[ColorMode.MODERNBLUE]!,
        ColorMode.NATUREGREEN: allThemes[ColorMode.NATUREGREEN]!,
        ColorMode.WARMDESERT: allThemes[ColorMode.WARMDESERT]!,
        ColorMode.LAVENDERDREAMS: allThemes[ColorMode.LAVENDERDREAMS]!,
        ColorMode.SEABREEZE: allThemes[ColorMode.SEABREEZE]!,
      };
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeDisplayMode = useState(
      ThemeDisplayMode.dark,
    );

    return NomoScaffold(
      appBar: NomoAppBar(
        title: NomoText("Select Theme", style: context.theme.typography.h1),
      ),
      floatingActionButton: PrimaryNomoButton(
        onPressed: () {
          context.push('/customize');
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const NomoText(
              "Customize",
              fontWeight: FontWeight.bold,
            ),
            8.hSpacing,
            const Icon(
              Icons.arrow_forward,
            ),
          ],
        ),
      ),
      child: NomoRouteBody(
        maxContentWidth: 650,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeModeToggle(
              selectedMode: themeDisplayMode.value,
              onModeChanged: (mode) {
                themeDisplayMode.value = mode;
              },
            ),
            Expanded(
              child: ThemeSelectionList(
                themes: getThemes(themeDisplayMode.value),
                selectedMode: ThemeProvider.of(context).colorMode as ColorMode,
                onThemeSelected: (theme) {
                  ThemeProvider.of(context).changeColorTheme(theme);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
