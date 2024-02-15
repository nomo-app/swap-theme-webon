import 'package:flutter/material.dart';
import 'package:nomo_router/router/nomo_navigator.dart';
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
        children: [
          Expanded(
            flex: 5,
            child: NomoText(
              'Welcome to the Swap Theme WebOn!',
              style: context.theme.typography.h1,
              color: context.colors.foreground1,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              NomoNavigator.of(context).pushNamed("/savedThemes");
            },
            icon: const Icon(
              Icons.save,
            ),
            color: context.colors.foreground1,
          )
        ],
      ),
    );
  }
}
