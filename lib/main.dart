import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:nomo_router/nomo_router.dart';
import 'package:nomo_ui_kit/app/nomo_app.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webon_kit_dart/webon_kit_dart.dart';
import 'package:zeniq_swap_frontend/providers/swap_provider.dart';
import 'package:zeniq_swap_frontend/routes.dart';
import 'package:zeniq_swap_frontend/theme.dart';

final appRouter = AppRouter();

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  final String address;
  try {
    address = await WebonKitDart.getEvmAddress();
  } catch (e) {
    launchUrl(Uri.parse("https://zeniqswap.com/#/swap"));
    runApp(
      const MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning, size: 64.0, color: Colors.redAccent),
                  SizedBox(height: 16.0),
                  Text(
                    'Not inside the NomoApp. Please use zeniqswap.com for Swapping in the browser.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Or download the Nomo App from the App Store or Google Play Store.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return;
  }

  runApp(
    InheritedSwapProvider(
      swapProvider: SwapProvider(address),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NomoNavigator(
      delegate: appRouter.delegate,
      child: NomoApp(
        color: Colors.red,
        routerConfig: appRouter.config,
        supportedLocales: const [Locale('en', 'US')],
        themeDelegate: AppThemeDelegate(),
      ),
    );
  }
}

class InheritedSwapProvider extends InheritedWidget {
  const InheritedSwapProvider({
    super.key,
    required this.swapProvider,
    required super.child,
  });

  final SwapProvider swapProvider;

  static SwapProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<InheritedSwapProvider>();
    if (result == null) {
      throw Exception('InheritedSwapProvider not found in context');
    }
    return result.swapProvider;
  }

  @override
  bool updateShouldNotify(InheritedSwapProvider oldWidget) {
    return true;
  }
}
