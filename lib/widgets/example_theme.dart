import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/card/nomo_card.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';

class ExampleTheme extends StatelessWidget {
  final NomoColors theme;

  const ExampleTheme({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return NomoCard(
      backgroundColor: theme.surface,
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
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
            ],
          ),
        ],
      ),
    );
  }
}
