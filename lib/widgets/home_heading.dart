import 'package:flutter/material.dart';
import 'package:nomo_router/router/nomo_navigator.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: NomoText(
              "Choose a color!",
              maxLines: 2,
              style: context.theme.typography.h2,
              color: context.theme.colors.foreground1,
              fontWeight: FontWeight.bold,
            ),
          ),
          SecondaryNomoButton(
            height: 50,
            padding: const EdgeInsets.all(8),
            onPressed: () {
              NomoNavigator.of(context).pushNamed("/savedThemes");
            },
            child: NomoText(
              "Saved Themes",
              style: context.typography.b3,
            ),
          )
        ],
      ),
    );
  }
}
