import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/card/nomo_card.dart';
import 'package:nomo_ui_kit/components/info_item/nomo_info_item.dart';
import 'package:nomo_ui_kit/components/input/textInput/nomo_input.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/utils/layout_extensions.dart';
import 'package:walletkit_dart/walletkit_dart.dart';
import 'package:zeniq_swap_frontend/main.dart';
import 'package:zeniq_swap_frontend/pages/background_painter.dart';
import 'package:zeniq_swap_frontend/providers/swap_provider.dart';
import 'package:zeniq_swap_frontend/widgets/select_asset_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final $swapProvider = InheritedSwapProvider.of(context);
    return CustomPaint(
      painter: BackgroundPainter(),
      child: Center(
        child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ZeniqSwap",
                  style: context.typography.b3.copyWith(fontSize: 48),
                ),
                32.vSpacing,
                ValueListenableBuilder(
                    valueListenable: $swapProvider.fromToken,
                    builder: (context, token, child) {
                      return NomoInput(
                        title: 'From',
                        height: 64,
                        titleStyle: context.typography.h2,
                        placeHolderStyle: context.typography.h1,
                        style: context.typography.h1,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        placeHolder: '0',
                        valueNotifier: $swapProvider.fromAmountString,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(
                              r'^\d+([.,]?\d{0,' +
                                  (token?.decimals ?? 18).toString() +
                                  r'})',
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          final bi =
                              parseFromString(value, token?.decimals ?? 0);

                          final amount = bi != null
                              ? Amount(
                                  value: bi, decimals: token?.decimals ?? 0)
                              : null;

                          $swapProvider.setFromAmount(amount);
                        },
                        trailling: SwapInputTrailling(
                          token: token,
                          onTokenSelected: (token) {
                            $swapProvider.setFromToken(token);
                          },
                        ),
                      );
                    }),
                16.vSpacing,
                Center(
                  child: SecondaryNomoButton(
                    border: const Border.fromBorderSide(BorderSide.none),
                    icon: Icons.swap_vert,
                    height: 48,
                    width: 48,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      $swapProvider.changePosition();
                    },
                  ),
                ),
                16.vSpacing,
                ValueListenableBuilder(
                  valueListenable: $swapProvider.toToken,
                  builder: (context, token, child) {
                    return NomoInput(
                      title: 'To',
                      titleStyle: context.typography.h2,
                      style: context.typography.h1,
                      placeHolderStyle: context.typography.h1,
                      placeHolder: '0',
                      height: 64,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(
                            r'^\d+([.,]?\d{0,' +
                                (token?.decimals ?? 18).toString() +
                                r'})',
                          ),
                        ),
                      ],
                      valueNotifier: $swapProvider.toAmountString,
                      onChanged: (value) {
                        final bi = parseFromString(value, token?.decimals ?? 0);

                        final amount = bi != null
                            ? Amount(value: bi, decimals: token?.decimals ?? 0)
                            : null;

                        $swapProvider.setToAmount(amount);
                      },
                      trailling: ValueListenableBuilder(
                        valueListenable: $swapProvider.toToken,
                        builder: (context, value, child) {
                          return SwapInputTrailling(
                            token: value,
                            onTokenSelected: (token) {
                              $swapProvider.setToToken(token);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                32.vSpacing,
                ValueListenableBuilder(
                    valueListenable: $swapProvider.swapInfo,
                    builder: (context, swapInfo, child) {
                      if (swapInfo == null) {
                        return const SizedBox();
                      }
                      return NomoCard(
                        elevation: 0,
                        padding: const EdgeInsets.all(16),
                        backgroundColor: context.colors.background2,
                        child: Column(
                          children: [
                            ...switch (swapInfo!) {
                              FromSwapInfo info => [
                                  NomoInfoItem(
                                    title: "Price",
                                    value: info.getPrice(true),
                                  ),
                                  NomoInfoItem(
                                    title: "Slippage Tolerance",
                                    value: "0.5%",
                                  ),
                                  NomoInfoItem(
                                    title: "Liquidity Provider Fee",
                                    value: "0.3%",
                                  ),
                                  NomoInfoItem(
                                    title: "Minimum Received",
                                    value: "0",
                                  ),
                                ],
                              ToSwapInfo info => [
                                  NomoInfoItem(
                                    title: "Price",
                                    value: "1 Tuple per Zeniq",
                                  ),
                                  NomoInfoItem(
                                    title: "Slippage Tolerance",
                                    value: "0.5%",
                                  ),
                                  NomoInfoItem(
                                    title: "Liquidity Provider Fee",
                                    value: "0.3%",
                                  ),
                                  NomoInfoItem(
                                    title: "Minimum Received",
                                    value: "0",
                                  ),
                                ]
                            }
                          ],
                        ),
                      );
                    }),
                const Spacer(),
                ValueListenableBuilder(
                    valueListenable: $swapProvider.swapState,
                    builder: (context, state, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: state == SwapState.NotApproved
                            ? PrimaryNomoButton(
                                text: 'Approve',
                                expandToConstraints: true,
                                height: 48,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                textStyle: context.typography.b3,
                              )
                            : PrimaryNomoButton(
                                text: 'Swap',
                                expandToConstraints: true,
                                height: 48,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                textStyle: context.typography.b3,
                              ),
                      );
                    }),
              ],
            )),
      ),
    );
  }
}

class SwapInputTrailling extends StatelessWidget {
  final TokenEntity? token;

  final void Function(TokenEntity token) onTokenSelected;

  const SwapInputTrailling({
    super.key,
    required this.token,
    required this.onTokenSelected,
  });

  void onPressed(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (c) => SelectAssetDialog(),
    );

    if (result is TokenEntity) {
      onTokenSelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 200,
      ),
      child: token == null
          ? PrimaryNomoButton(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              spacing: 4,
              textStyle: context.typography.b2,
              onPressed: () => onPressed(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NomoText(
                    'Select Token',
                    style: context.typography.b2,
                    color: context.colors.onPrimary,
                  ),
                  8.hSpacing,
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            )
          : SecondaryNomoButton(
              backgroundColor: Colors.transparent,
              height: 42,
              onPressed: () => onPressed(context),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.token),
                  8.hSpacing,
                  NomoText(
                    token!.symbol,
                    style: context.typography.h1,
                    useInheritedTheme: true,
                  ),
                  8.hSpacing,
                  const Icon(
                    Icons.arrow_downward,
                    size: 18,
                  ),
                ],
              ),
            ),
    );
  }
}

BigInt? parseFromString(String value, int decimals) {
  final split = value.replaceAll(',', '.').split('.');

  if (split.length > 2) {
    return null;
  }

  final right = split.length == 2
      ? split[1].padRight(decimals, '0')
      : ''.padRight(decimals, '0');
  final left = split[0];

  return BigInt.tryParse('$left$right');
}
