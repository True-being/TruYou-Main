import 'package:flutter/services.dart';

List<TextInputFormatter> walletFormatters() {
  return [LengthLimitingTextInputFormatter(58)];
}
