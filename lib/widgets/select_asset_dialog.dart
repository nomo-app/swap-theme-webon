import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/dialog/nomo_dialog.dart';
import 'package:nomo_ui_kit/components/divider/nomo_divider.dart';
import 'package:nomo_ui_kit/components/input/textInput/nomo_input.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/utils/layout_extensions.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final assets = [
  zeniqSmart,
  avinocZSC,
  tupanToken,
];

class SelectAssetDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NomoDialog(
      padding: const EdgeInsets.all(24),
      maxWidth: 480,
      widthRatio: 0.9,
      titleStyle: context.typography.h2,
      leading: NomoText(
        "Select Asset",
        style: context.typography.h2,
      ),
      content: SizedBox(
        height: context.height * 0.7,
        child: Column(
          children: [
            NomoInput(
              titleStyle: context.typography.h2,
              placeHolder: "Search name or paste address",
              placeHolderStyle: context.typography.h1,
              height: 48,
            ),
            32.vSpacing,
            const Row(
              children: [
                Text("Name"),
                Spacer(),
                SecondaryNomoButton(
                  icon: Icons.sort,
                  backgroundColor: Colors.transparent,
                  border: Border.fromBorderSide(BorderSide.none),
                )
              ],
            ),
            const NomoDivider(),
            Expanded(
              child: ListView.builder(
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  final asset = assets[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(asset);
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: 48,
                        child: Row(
                          children: [
                            4.hSpacing,
                            const Icon(Icons.token),
                            12.hSpacing,
                            NomoText(
                              asset.name,
                              style: context.typography.h1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
