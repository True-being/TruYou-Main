import 'package:flutter/services.dart';

List<TextInputFormatter> matchPledgingFormatter() {
  return [LengthLimitingTextInputFormatter(6)];
}
