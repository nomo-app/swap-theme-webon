import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomo_ui_kit/components/app/app_bar/nomo_app_bar.dart';
import 'package:nomo_ui_kit/components/app/scaffold/nomo_scaffold.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NomoScaffold(
      appBar: NomoAppBar(
        title: NomoText("Customize Theme", style: context.theme.typography.h1),
      ),
      child: Column(
        children: [
          PrimaryNomoButton(
            onPressed: () {
              context.go('/predefined');
            },
            child: const NomoText("Select Predefined Theme"),
          ),
        ],
      ),
    );
  }
}
