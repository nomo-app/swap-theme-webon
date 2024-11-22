import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nomo_ui_kit/components/app/scaffold/nomo_scaffold.dart';
import 'package:nomo_ui_kit/components/divider/nomo_divider.dart';
import 'package:nomo_ui_kit/components/expandable/expandable.dart';
import 'package:nomo_ui_kit/components/info_item/nomo_info_item.dart';
import 'package:nomo_ui_kit/components/input/textInput/nomo_input.dart';
import 'package:nomo_ui_kit/components/loading/shimmer/shimmer.dart';
import 'package:nomo_ui_kit/components/outline_container/nomo_outline_container.dart';
import 'package:nomo_ui_kit/components/snackbar/nomo_snackbar.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_constants.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_sizing_theme.dart';
import 'package:swap_theme_webon/predefined_themes.dart';

enum ColorMode {
  LIGHT,
  DARK,
  AVINOC,
  BLACK,
  MODERNBLUE,
  NATUREGREEN,
  WARMDESERT,
  DARKOCEAN,
  CYBERPUNKNIGHT,
  VOLCANICDARK
}

enum SizingMode {
  SMALL,
}

class AppThemeDelegate extends NomoThemeDelegate<ColorMode, SizingMode> {
  @override
  NomoConstantsThemeData get constants {
    return NomoConstantsThemeData(
      constants: NomoConstants(),
      componentConstantsBuilder: (core) {
        return const NomoComponentConstants();
      },
    );
  }

  @override
  NomoComponentSizesNullable defaultComponentsSize(NomoSizes core) {
    return const NomoComponentSizesNullable(
      inputSizing: NomoInputSizingDataNullable(),
    );
  }

  @override
  ColorMode initialColorTheme() {
    return ColorMode.DARK;
  }

  @override
  SizingMode sizingThemeBuilder(double width) {
    return SizingMode.SMALL;
  }

  @override
  NomoTypographyTheme get typography => NomoTypographyTheme(
        b1: GoogleFonts.roboto(),
        b2: GoogleFonts.roboto(),
        b3: GoogleFonts.roboto(),
        h1: GoogleFonts.dancingScript(),
        h2: GoogleFonts.dancingScript(),
        h3: GoogleFonts.dancingScript(),
      );

  @override
  Map<SizingMode, NomoSizingThemeDataNullable> getSizingThemes() {
    return {
      SizingMode.SMALL: NomoSizingThemeDataNullable(
        key: const ValueKey('small'),
        sizes: const NomoSizes(
          fontSizeB1: 14,
          fontSizeB2: 18,
          fontSizeB3: 28,
          fontSizeH1: 36,
          fontSizeH2: 48,
          fontSizeH3: 64,
          spacing1: 4,
          spacing2: 6,
          spacing3: 8,
        ),
        buildComponents: (core) {
          return const NomoComponentSizesNullable(
            scaffoldSizing: NomoScaffoldSizingDataNullable(
              showSider: false,
            ),
          );
        },
      ),
    };
  }

  @override
  Map<ColorMode, NomoColorThemeDataNullable> getColorThemes() {
    return {
      ColorMode.LIGHT: NomoColorThemeDataNullable(
        key: const ValueKey("light"),
        colors: const NomoColors(
          primary: primaryColor,
          onPrimary: Colors.white,
          primaryContainer: Color(0xffFCFAF7),
          secondary: secondary,
          onSecondary: Color(0xff000000),
          secondaryContainer: Color(0xFFe9e1d1),
          background1: Color(0xFFfafafa),
          background2: Color(0xFFf5f5f5),
          background3: Color(0xFFf0f0f0),
          surface: Colors.white,
          error: Colors.redAccent,
          disabled: Color(0xFFE0E0E0),
          foreground1: Color(0xCF000000),
          foreground2: Color(0xDF000000),
          foreground3: Color(0xEF000000),
          brightness: Brightness.light,
          onDisabled: Colors.grey,
        ),
        buildComponents: (core) {
          return NomoComponentColorsNullable(
            outlineContainerColor: NomoOutlineContainerColorData(
              background: core.background1.darken(0.05),
            ),
            shimmerColor: const ShimmerColorDataNullable(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFEBEBF4),
                  Color(0xFFF4F4F4),
                  Color(0xFFEBEBF4)
                ],
              ),
            ),
            snackBarColor: const NomoSnackBarColorDataNullable(
              elevation: 1,
              border: BorderSide.none,
            ),
          );
        },
      ),
      ColorMode.DARK: NomoColorThemeDataNullable(
        key: const ValueKey("dark"),
        colors: const NomoColors(
          primary: primaryColor,
          onPrimary: Colors.white,
          primaryContainer: Color(0xFF4b422d),
          secondary: secondary,
          onSecondary: Color(0xff000000),
          secondaryContainer: Color(0xFFe9e1d1),
          background1: Color(0xff293138),
          background2: Color(0xff1e2428),
          background3: Color(0xff13191d),
          surface: Color(0xff2e363c),
          error: Colors.redAccent,
          disabled: Color(0xFFE0E0E0),
          foreground1: Color(0xEAFFFFFF),
          foreground2: Color(0xF0FFFFFF),
          foreground3: Color(0xFAFFFFFF),
          brightness: Brightness.dark,
          onDisabled: Colors.grey,
        ),
        buildComponents: (core) {
          return const NomoComponentColorsNullable(
            expandableColor: ExpandableColorData(
              splashColor: Colors.white24,
              highlightColor: Colors.white24,
            ),
          );
        },
      ),
      ColorMode.AVINOC: NomoColorThemeDataNullable(
        key: const ValueKey("avinoc"),
        colors: const NomoColors(
          primary: Color(0xff2FAAA5),
          onPrimary: Colors.white,
          primaryContainer: Color.fromARGB(255, 202, 255, 253),
          secondary: Color(0xff2FAAA5),
          onSecondary: Color(0xff1C1C1C),
          secondaryContainer: Color(0xFFc3eeed),
          background1: Color(0xff272F4A),
          background2: Color(0xFF333A66),
          background3: Color(0xFF232846),
          surface: Color(0xFF101d42),
          error: Colors.redAccent,
          disabled: Color(0xFFE0E0E0),
          foreground1: Color(0xEAFFFFFF),
          foreground2: Color(0xF0FFFFFF),
          foreground3: Color(0xFAFFFFFF),
          brightness: Brightness.dark,
          onDisabled: Colors.grey,
        ),
        buildComponents: (core) {
          return const NomoComponentColorsNullable(
            expandableColor: ExpandableColorData(
              splashColor: Colors.white24,
              highlightColor: Colors.white24,
            ),
          );
        },
      ),
      ColorMode.BLACK: NomoColorThemeDataNullable(
        key: const ValueKey("black"),
        colors: const NomoColors(
          primary: primaryColor,
          onPrimary: Colors.white,
          primaryContainer: Color(0xFF4b422d),
          secondary: secondary,
          onSecondary: Color(0xff000000),
          secondaryContainer: Color(0xFFe9e1d1),
          background1: Color(0xFF1f1f1f),
          background2: Color(0xFF262626),
          background3: Color(0xFF434343),
          surface: Color(0xFF141414),
          error: Colors.redAccent,
          disabled: Color(0xFFE0E0E0),
          foreground1: Color(0xEAFFFFFF),
          foreground2: Color(0xF0FFFFFF),
          foreground3: Color(0xFAFFFFFF),
          brightness: Brightness.dark,
          onDisabled: Colors.grey,
        ),
        buildComponents: (core) {
          return const NomoComponentColorsNullable(
            expandableColor: ExpandableColorData(
              splashColor: Colors.white24,
              highlightColor: Colors.white24,
            ),
          );
        },
      ),
      ColorMode.MODERNBLUE: PredefinedThemes.modernBlue,
      ColorMode.NATUREGREEN: PredefinedThemes.natureGreen,
      ColorMode.WARMDESERT: PredefinedThemes.warmDesert,
      ColorMode.DARKOCEAN: PredefinedThemes.darkOcean,
      ColorMode.CYBERPUNKNIGHT: PredefinedThemes.cyberpunkNight,
      ColorMode.VOLCANICDARK: PredefinedThemes.volcanicDark,
    };
  }

  @override
  NomoComponentColorsNullable defaultComponentsColor(NomoColors core) {
    return NomoComponentColorsNullable(
      inputColor: NomoInputColorDataNullable(
        borderRadius: BorderRadius.circular(12),
      ),
      infoItemColor: const NomoInfoItemColorDataNullable(),
      dividerColor: NomoDividerColorDataNullable(
        color: core.background1,
      ),
      shimmerColor: const ShimmerColorDataNullable(
        gradient: LinearGradient(
          colors: [
            Color(0x222FAAA5),
            Color.fromARGB(126, 104, 115, 154),
            Color(0x222FAAA5)
          ],
          stops: [0.1, 0.3, 0.4],
          begin: Alignment(-1.0, -0.3),
          end: Alignment(1.0, 0.3),
        ),
      ),
    );
  }
}
