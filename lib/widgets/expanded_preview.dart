// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nomo_ui_kit/components/expandable/expandable.dart';
// import 'package:nomo_ui_kit/components/text/nomo_text.dart';
// import 'package:nomo_ui_kit/theme/nomo_theme.dart';
// import 'package:swap_theme_webon/provider/colors_provider.dart';

// class ExpandedPreview extends ConsumerWidget {
//   const ExpandedPreview({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final theme = ref.watch(colorPalatteNotifierProvider);
//     return Expandable(
//       initiallyExpanded: true,
//       iconColor: theme.foreground1,
//       childrenPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//       decoration: BoxDecoration(
//           color: theme.background2,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//           border:
//               const Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
//       title: Row(
//         children: [
//           const SizedBox(
//             width: 15,
//           ),
//           SizedBox(
//             width: 29,
//             child: Icon(color: theme.foreground1, Icons.lock),
//           ),
//           const SizedBox(
//             width: 15,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 NomoText(
//                   "Security",
//                   style: context.typography.b3,
//                   color: theme.foreground1,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 NomoText(
//                   "Biometric, Update PIN & Recovery Phrase",
//                   style: context.typography.b1,
//                   color: theme.foreground1,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       children: [
//         Material(
//           color: theme.background3,
//           borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(8),
//             topLeft: Radius.circular(8),
//             bottomRight: Radius.circular(8),
//             bottomLeft: Radius.circular(8),
//           ),
//           child: InkWell(
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(8),
//               topLeft: Radius.circular(8),
//               bottomRight: Radius.circular(8),
//               bottomLeft: Radius.circular(8),
//             ),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(8),
//                   topLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                   bottomLeft: Radius.circular(8),
//                 ),
//               ),
//               height: 60,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 30,
//                     child: Icon(
//                       Icons.cancel_presentation,
//                       color: theme.foreground1,
//                       size: 22,
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: NomoText(
//                       "Wipe Out Wallet",
//                       textAlign: TextAlign.start,
//                       style: context.typography.b2,
//                       color: theme.foreground1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
