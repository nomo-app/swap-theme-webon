import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomo_router/router/nomo_navigator.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:swap_theme_webon/provider/colors_provider.dart';

class HomeHeading extends ConsumerWidget {
  const HomeHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            iconSize: 32,
            onPressed: () {
              ref.read(colorPalatteNotifierProvider.notifier).clearColors();
            },
            icon: const Icon(Icons.delete_outline_outlined),
            color: context.colors.error,
          ),
          IconButton(
            iconSize: 32,
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
