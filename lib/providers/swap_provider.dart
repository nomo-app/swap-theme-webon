import 'package:flutter/foundation.dart';
import 'package:walletkit_dart/walletkit_dart.dart';

final rpc = EvmRpcInterface(ZeniqSmartNetwork);
final zeniqSwapRouter = ZeniqSwapRouter(client: rpc.client.asWeb3);
final zeniqSwapFactory = ZeniqSwapFactoryContract(client: rpc.client.asWeb3);

enum SwapType {
  ExactTokenToToken,
  ExactTokenToZeniq,
  ExactZeniqToToken,
}

enum SwapState {
  NotApproved,
  Approved,
  Swapping,
  Swapped,
}

class SwapProvider {
  final String ownAddress;

  final ValueNotifier<TokenEntity?> fromToken = ValueNotifier(zeniqSmart);
  final ValueNotifier<TokenEntity?> toToken = ValueNotifier(null);

  final ValueNotifier<Amount?> fromAmount = ValueNotifier(null);
  final ValueNotifier<Amount?> toAmount = ValueNotifier(null);
  final ValueNotifier<String> fromAmountString = ValueNotifier('');
  final ValueNotifier<String> toAmountString = ValueNotifier('');

  SwapProvider(this.ownAddress) {
    fromToken.addListener(checkSwapInfo);
    toToken.addListener(checkSwapInfo);
    fromAmount.addListener(checkSwapInfo);
    toAmount.addListener(checkSwapInfo);
  }

  SwapType? swapType;

  final ValueNotifier<SwapState?> swapState = ValueNotifier(null);

  final ValueNotifier<SwapInfo?> swapInfo = ValueNotifier(null);

  void updateSwapType() {
    swapType = switch ((fromToken.value, toToken.value)) {
      (zeniqSmart, _) => SwapType.ExactZeniqToToken,
      (_, zeniqSmart) => SwapType.ExactTokenToZeniq,
      (_, _) => SwapType.ExactTokenToToken,
    };
  }

  void changePosition() {
    final from = fromToken.value;
    final to = toToken.value;

    fromToken.value = to;
    toToken.value = from;

    updateSwapType();
  }

  void setFromToken(TokenEntity token) {
    if (token == toToken.value) {
      toToken.value = fromToken.value;
    }
    fromToken.value = token;
    updateSwapType();
  }

  void setToToken(TokenEntity token) {
    if (token == fromToken.value) {
      fromToken.value = toToken.value;
    }
    toToken.value = token;
    updateSwapType();
  }

  void setFromAmount(Amount? amount) {
    fromAmount.value = amount;
  }

  void setToAmount(Amount? amount) {
    toAmount.value = amount;
  }

  /// Gets called whenever any of the swap info changes
  /// If all the necessary info is present, it calculates the swap info
  void checkSwapInfo() {
    if (fromToken.value == null) return;
    if (toToken.value == null) return;
    if (fromAmount.value == null && toAmount.value == null) return;

    if (switch ((fromAmount.value, toAmount.value)) {
      (Amount a, _) => a.value == BigInt.zero,
      (_, Amount a) => a.value == BigInt.zero,
      _ => true,
    }) {
      toAmountString.value = '';
      fromAmountString.value = '';
      return;
    }

    calculateSwapInfo();
  }

  void calculateSwapInfo() async {
    swapInfo.value = await switch (swapType) {
      SwapType.ExactZeniqToToken => swapInfoZeniqToToken(
          zeniq: wrappedZeniqSmart,
          token: toToken.value as EthBasedTokenEntity,
          fromAmount: fromAmount.value!,
        ),
      SwapType.ExactTokenToZeniq => swapInfoTokenToZeniq(
          zeniq: wrappedZeniqSmart,
          token: fromToken.value as EthBasedTokenEntity,
          fromAmount: fromAmount.value!,
          own: ownAddress,
        ),
      SwapType.ExactTokenToToken => swapInfoTokenToToken(
          token0: fromToken.value as EthBasedTokenEntity,
          token1: toToken.value as EthBasedTokenEntity,
          fromAmount: fromAmount.value!,
          own: ownAddress,
        ),
      _ => null,
    };

    swapState.value = switch (swapType) {
      SwapType.ExactTokenToToken => SwapState.NotApproved,
      SwapType.ExactTokenToZeniq => SwapState.NotApproved,
      SwapType.ExactZeniqToToken => SwapState.Approved,
      _ => null,
    };

    switch (swapInfo.value) {
      case FromSwapInfo swapInfo:
        toAmountString.value = swapInfo.amount.displayValue.format(5);
        break;
      default:
    }
  }
}

Future<SwapInfo> swapInfoZeniqToToken({
  required EthBasedTokenEntity zeniq,
  required EthBasedTokenEntity token,
  required Amount fromAmount,
}) async {
  final outputs = await zeniqSwapRouter.getAmountsOut(
    amountIn: fromAmount.value,
    path: [
      zeniq.contractAddress,
      token.contractAddress,
    ],
  );

  final outputValue = outputs.last;
  final minOutputValue = (outputValue * 995.toBigInt) ~/ 1000.toBigInt;

  return FromSwapInfo(
    minReceived: Amount(value: minOutputValue, decimals: token.decimals),
    amount: Amount(value: outputValue, decimals: token.decimals),
    fee: 0,
    priceImpact: 0,
    slippage: 0.5,
    fromToken: zeniq,
    toToken: token,
    fromAmount: fromAmount,
    needsApproval: false,
  );
}

Future<SwapInfo> swapInfoTokenToZeniq({
  required EthBasedTokenEntity zeniq,
  required EthBasedTokenEntity token,
  required Amount fromAmount,
  required String own,
}) async {
  final outputs = await zeniqSwapRouter.getAmountsOut(
    amountIn: fromAmount.value,
    path: [
      token.contractAddress,
      zeniq.contractAddress,
    ],
  );

  final outputValue = outputs.last;
  final minOutputValue = (outputValue * 995.toBigInt) ~/ 1000.toBigInt;

  /// Check if the token allowance is enough
  final tokenERC20 = ERC20Contract(
    client: rpc.client.asWeb3,
    address: EthereumAddress.fromHex(token.contractAddress),
  );
  final allowance = await tokenERC20.allowance(
    owner: own,
    spender: zeniqSwapRouter.self.address.hex,
  );
  final needsApproval = allowance < fromAmount.value;

  return FromSwapInfo(
    minReceived: Amount(value: minOutputValue, decimals: token.decimals),
    amount: Amount(value: outputValue, decimals: token.decimals),
    fee: 0,
    priceImpact: 0,
    slippage: 0.5,
    fromToken: token,
    toToken: zeniq,
    fromAmount: fromAmount,
    needsApproval: needsApproval,
  );
}

Future<SwapInfo> swapInfoTokenToToken({
  required EthBasedTokenEntity token0,
  required EthBasedTokenEntity token1,
  required Amount fromAmount,
  required String own,
}) async {
  final outputs = await zeniqSwapRouter.getAmountsOut(
    amountIn: fromAmount.value,
    path: [
      token0.contractAddress,
      wrappedZeniqSmart.contractAddress,
      token1.contractAddress,
    ],
  );

  final outputValue = outputs.last;
  final minOutputValue = (outputValue * 995.toBigInt) ~/ 1000.toBigInt;

  /// Check if the token allowance is enough
  final tokenERC20 = ERC20Contract(
    client: rpc.client.asWeb3,
    address: EthereumAddress.fromHex(token0.contractAddress),
  );
  final allowance = await tokenERC20.allowance(
    owner: own,
    spender: zeniqSwapRouter.self.address.hex,
  );
  final needsApproval = allowance < fromAmount.value;

  return FromSwapInfo(
    minReceived: Amount(value: minOutputValue, decimals: token1.decimals),
    amount: Amount(value: outputValue, decimals: token1.decimals),
    fee: 0,
    priceImpact: 0,
    slippage: 0.5,
    fromToken: token0,
    toToken: token1,
    fromAmount: fromAmount,
    needsApproval: needsApproval,
  );
}

sealed class SwapInfo {
  final double slippage;
  final double priceImpact;
  final double fee;
  final Amount amount;

  final TokenEntity fromToken;
  final TokenEntity toToken;
  final bool needsApproval;

  const SwapInfo({
    required this.slippage,
    required this.priceImpact,
    required this.fee,
    required this.amount,
    required this.fromToken,
    required this.toToken,
    required this.needsApproval,
  });
}

final class FromSwapInfo extends SwapInfo {
  final Amount minReceived;
  final Amount fromAmount;

  double get rate {
    return amount.value / fromAmount.value;
  }

  String getPrice(bool inFrom) {
    if (inFrom) {
      return "${rate.toString().format(3)} ${toToken.symbol} per ${fromToken.symbol}";
    }

    return "${(1 / rate).toString().format(3)} ${fromToken.symbol} per ${toToken.symbol}";
  }

  const FromSwapInfo({
    required this.minReceived,
    required this.fromAmount,
    required super.fee,
    required super.priceImpact,
    required super.slippage,
    required super.amount,
    required super.fromToken,
    required super.toToken,
    required super.needsApproval,
  });
}

final class ToSwapInfo extends SwapInfo {
  final Amount maxReceived;

  const ToSwapInfo({
    required this.maxReceived,
    required super.fee,
    required super.priceImpact,
    required super.slippage,
    required super.amount,
    required super.fromToken,
    required super.toToken,
    required super.needsApproval,
  });
}

extension on String {
  String format(int places) {
    final parts = split('.');
    if (parts.length == 1) {
      return this;
    }
    final decimal = parts[1];
    if (decimal.length <= places) {
      return this;
    }
    return '${parts[0]}.${decimal.substring(0, places)}';
  }
}
