import 'package:flutter/services.dart';

List<TextInputFormatter> stakeTrustFormatter() {
  return [LengthLimitingTextInputFormatter(6)];
}
