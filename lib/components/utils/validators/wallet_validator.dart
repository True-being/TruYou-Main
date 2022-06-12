import 'package:truyou/components/components.dart';

String? walletValidator(String? wallet) {
  if (wallet!.isEmpty) {
    return Constants.PLEASE_ENTER_A_WALLET_ADDRESS;
  } else if (wallet.length != 58) {
    return Constants.PLEASE_ENTER_ADDRESS_EQUAL_TO_SIXTY_FOUR_CHARS;
  } else {
    return null;
  }
}
