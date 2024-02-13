import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/app/nomo_app.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/routes.dart';
import 'package:swap_theme_webon/theme.dart';

final appRouter = AppRouter();
void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NomoApp(
      appRouter: appRouter,
      supportedLocales: const [Locale('en', 'US')],
      theme: NomoThemeData(
        colorTheme: ColorMode.LIGHT.theme,
        sizingTheme: SizingMode.LARGE.theme,
        textTheme: typography,
        constants: constants,
      ),
      sizingThemeBuilder: (width) => switch (width) {
        < 480 => sizingSmall,
        < 1080 => sizingMedium,
        _ => sizingLarge,
      },
    );
  }
}
