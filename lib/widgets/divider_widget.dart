import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.colors,
  });

  final NomoColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: colors.foreground1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: NomoText(
              "or",
              color: colors.foreground1,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: colors.foreground1,
            ),
          ),
        ],
      ),
    );
  }
}
