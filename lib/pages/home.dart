import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/app/routebody/nomo_route_body.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/widgets/color_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NomoRouteBody(
      builder: (context, route) => SingleChildScrollView(
        child: Column(
          children: [
            NomoText(
              'Welcome to the Swap Theme WebOn!',
              style: context.theme.typography.h1,
            ),
            const SizedBox(height: 32),
            NomoText(
              "Choose a color to start",
              style: context.theme.typography.b3,
            ),
            const SizedBox(height: 16),
            const ColorSection(),
          ],
        ),
      ),
    );
  }
}
