// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
// import 'package:nomo_ui_kit/components/text/nomo_text.dart';
// import 'package:nomo_ui_kit/theme/nomo_theme.dart';
// import 'package:nomo_ui_kit/theme/theme_provider.dart';
// import 'package:swap_theme_webon/provider/colors_provider.dart';
// import 'package:swap_theme_webon/theme.dart';

// class ColorSectionHeading extends ConsumerWidget {
//   const ColorSectionHeading({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final themeProvider = ThemeProvider.of(context);

//     return SizedBox(
//       width: context.width * 0.8,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SecondaryNomoButton(
//             foregroundColor: Colors.red,
//             padding: const EdgeInsets.all(8),
//             height: 50,
//             onPressed: () {
//               ref.read(colorPalatteNotifierProvider.notifier).clearColors();
//             },
//             child: NomoText(
//               "Reset Theme",
//               style: context.typography.b3.copyWith(
//                 color: context.theme.colors.error,
//               ),
//             ),
//           ),
//           const Spacer(),
//           if (themeProvider.colorTheme == ColorMode.DARK.theme)
//             SecondaryNomoButton(
//               height: 50,
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: context.theme.colors.foreground1,
//                     content: NomoText(
//                       "Currently creating a light theme!",
//                       textAlign: TextAlign.center,
//                       style: context.theme.typography.b3.copyWith(
//                         color: context.theme.colors.primary,
//                       ),
//                     ),
//                     duration: const Duration(seconds: 1),
//                   ),
//                 );
//                 ThemeProvider.of(context).changeColorTheme(
//                   ColorMode.LIGHT.theme,
//                 );
//                 ref
//                     .read(colorPalatteNotifierProvider.notifier)
//                     .changeColorTheme(themeProvider.colorTheme.colors);

//                 ref
//                     .read(colorPalatteNotifierProvider.notifier)
//                     .updateBrigthness(Brightness.light);
//               },
//               child: Row(
//                 children: [
//                   NomoText(
//                     "Color Mode",
//                     style: context.theme.typography.b3,
//                   ),
//                   const SizedBox(width: 8),
//                   const Icon(
//                     Icons.light_mode,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             )
//           else
//             SecondaryNomoButton(
//               height: 50,
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: context.theme.colors.foreground1,
//                     content: NomoText(
//                       "Currently creating a dark theme!",
//                       textAlign: TextAlign.center,
//                       style: context.theme.typography.b3.copyWith(
//                         color: context.theme.colors.primary,
//                       ),
//                     ),
//                     duration: const Duration(seconds: 1),
//                   ),
//                 );
//                 ThemeProvider.of(context).changeColorTheme(
//                   ColorMode.DARK.theme,
//                 );
//                 ref
//                     .read(colorPalatteNotifierProvider.notifier)
//                     .changeColorTheme(themeProvider.colorTheme.colors);
//                 ref
//                     .read(colorPalatteNotifierProvider.notifier)
//                     .updateBrigthness(Brightness.dark);
//               },
//               child: Row(
//                 children: [
//                   NomoText(
//                     "Color Mode",
//                     style: context.theme.typography.b3,
//                   ),
//                   const SizedBox(width: 8),
//                   const Icon(
//                     Icons.dark_mode,
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
