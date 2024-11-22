import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/app/nomo_app.dart';
import 'package:swap_theme_webon/routes.dart';
import 'package:swap_theme_webon/theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NomoApp(
      themeDelegate: AppThemeDelegate(),
      routerConfig: router,
      color: const Color(0xFF1A1A1A),
      supportedLocales: const [
        Locale('en', 'US'),
      ],
    );
  }
}
