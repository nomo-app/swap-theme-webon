import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';

class PredefinedThemes {
  // Modern Blue Theme - Clean, professional look with blue accents
  static final modernBlue = NomoColorThemeDataNullable(
    key: const ValueKey("modern_blue"),
    colors: const NomoColors(
      primary: Color(0xFF2196F3), // Material Blue
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFE3F2FD),
      secondary: Color(0xFF1976D2), // Darker Blue
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFBBDEFB),
      background1: Color(0xFFFAFAFA),
      background2: Color(0xFFF5F5F5),
      background3: Color(0xFFEEEEEE),
      surface: Colors.white,
      error: Color(0xFFE53935),
      disabled: Color(0xFFE0E0E0),
      foreground1: Color(0xDF000000),
      foreground2: Color(0xCC000000),
      foreground3: Color(0xBD000000),
      brightness: Brightness.light,
      onDisabled: Color(0xFF9E9E9E),
    ),
  );

  // Nature Green Theme - Organic, calming palette inspired by nature
  static final natureGreen = NomoColorThemeDataNullable(
    key: const ValueKey("nature_green"),
    colors: const NomoColors(
      primary: Color(0xFF4CAF50), // Material Green
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFE8F5E9),
      secondary: Color(0xFF388E3C), // Darker Green
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFC8E6C9),
      background1: Color(0xFFF1F8E9),
      background2: Color(0xFFE8F5E9),
      background3: Color(0xFFDCEDC8),
      surface: Colors.white,
      error: Color(0xFFE53935),
      disabled: Color(0xFFCFD8DC),
      foreground1: Color(0xDF000000),
      foreground2: Color(0xCC000000),
      foreground3: Color(0xBD000000),
      brightness: Brightness.light,
      onDisabled: Color(0xFF90A4AE),
    ),
  );

  // Warm Desert Theme - Warm, earthy tones inspired by desert landscapes
  static final warmDesert = NomoColorThemeDataNullable(
    key: const ValueKey("warm_desert"),
    colors: const NomoColors(
      primary: Color(0xFFE65100), // Deep Orange
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFFBE9E7),
      secondary: Color(0xFFBF360C), // Darker Orange
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFFFCCBC),
      background1: Color(0xFFFFF3E0),
      background2: Color(0xFFFFE0B2),
      background3: Color(0xFFFFCC80),
      surface: Color(0xFFFFFBE6),
      error: Color(0xFFD32F2F),
      disabled: Color(0xFFE0E0E0),
      foreground1: Color(0xDF000000),
      foreground2: Color(0xCC000000),
      foreground3: Color(0xBD000000),
      brightness: Brightness.light,
      onDisabled: Color(0xFF9E9E9E),
    ),
  );

  // Lavender Dreams Theme - Soft, elegant purple-based palette
  static final lavenderDreams = NomoColorThemeDataNullable(
    key: const ValueKey("lavender_dreams"),
    colors: const NomoColors(
      primary: Color(0xFF9C27B0), // Rich Purple
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFF3E5F5),
      secondary: Color(0xFF7B1FA2), // Deeper Purple
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFE1BEE7),
      background1: Color(0xFFF8F5FA),
      background2: Color(0xFFF3F0F6),
      background3: Color(0xFFEDE7F1),
      surface: Colors.white,
      error: Color(0xFFE53935),
      disabled: Color(0xFFE0E0E0),
      foreground1: Color(0xDF000000),
      foreground2: Color(0xCC000000),
      foreground3: Color(0xBD000000),
      brightness: Brightness.light,
      onDisabled: Color(0xFF9E9E9E),
    ),
  );

  // Sea Breeze Theme - Fresh coastal-inspired palette
  static final seaBreeze = NomoColorThemeDataNullable(
    key: const ValueKey("sea_breeze"),
    colors: const NomoColors(
      primary: Color(0xFF00ACC1), // Cyan
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFE0F7FA),
      secondary: Color(0xFF0097A7), // Darker Cyan
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFB2EBF2),
      background1: Color(0xFFF5FCFD),
      background2: Color(0xFFEFF8F9),
      background3: Color(0xFFE5F4F5),
      surface: Colors.white,
      error: Color(0xFFE53935),
      disabled: Color(0xFFE0E0E0),
      foreground1: Color(0xDF000000),
      foreground2: Color(0xCC000000),
      foreground3: Color(0xBD000000),
      brightness: Brightness.light,
      onDisabled: Color(0xFF9E9E9E),
    ),
  );

  // Dark Ocean Theme - Dark theme with cool ocean-inspired colors
  static final darkOcean = NomoColorThemeDataNullable(
    key: const ValueKey("dark_ocean"),
    colors: const NomoColors(
      primary: Color(0xFF0288D1), // Light Blue
      onPrimary: Colors.white,
      primaryContainer: Color(0xFF01579B),
      secondary: Color(0xFF039BE5), // Brighter Blue
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFF0277BD),
      background1: Color(0xFF102027),
      background2: Color(0xFF37474F),
      background3: Color(0xFF455A64),
      surface: Color(0xFF263238),
      error: Color(0xFFEF5350),
      disabled: Color(0xFF546E7A),
      foreground1: Color(0xFFFFFFFF),
      foreground2: Color(0xEEFFFFFF),
      foreground3: Color(0xDDFFFFFF),
      brightness: Brightness.dark,
      onDisabled: Color(0xFFB0BEC5),
    ),
  );

  // Cyberpunk Night Theme - Futuristic dark theme with neon accents
  static final cyberpunk = NomoColorThemeDataNullable(
    key: const ValueKey("cyberpunk"),
    colors: const NomoColors(
      primary: Color(0xFF00FF9C), // Neon Green
      onPrimary: Color(0xFF000000), // Black text on neon
      primaryContainer: Color(0xFF004D40),
      secondary: Color(0xFFFF00FF), // Neon Pink
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFF4A0072),
      background1: Color(0xFF0A0A0F), // Very dark blue-black
      background2: Color(0xFF16161F),
      background3: Color(0xFF1E1E2A),
      surface: Color(0xFF121212),
      error: Color(0xFFFF0062), // Neon Red
      disabled: Color(0xFF353535),
      foreground1: Color(0xFFFFFFFF),
      foreground2: Color(0xFFE6E6E6),
      foreground3: Color(0xFFCCCCCC),
      brightness: Brightness.dark,
      onDisabled: Color(0xFF666666),
    ),
  );

  // Volcanic Dark Theme - Rich dark theme with deep red accents
  static final volcanicDark = NomoColorThemeDataNullable(
    key: const ValueKey("volcanic_dark"),
    colors: const NomoColors(
      primary: Color(0xFFFF5722), // Deep Orange
      onPrimary: Colors.white,
      primaryContainer: Color(0xFF3E2723), // Dark Brown
      secondary: Color(0xFFFF8A65), // Light Orange
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFF4E342E),
      background1: Color(0xFF1A0F0F), // Very dark red-tinted black
      background2: Color(0xFF251515),
      background3: Color(0xFF2F1C1C),
      surface: Color(0xFF1F1412),
      error: Color(0xFFD32F2F),
      disabled: Color(0xFF382B2B),
      foreground1: Color(0xFFFAFAFA),
      foreground2: Color(0xFFE0E0E0),
      foreground3: Color(0xFFBDBDBD),
      brightness: Brightness.dark,
      onDisabled: Color(0xFF757575),
    ),
  );
}
