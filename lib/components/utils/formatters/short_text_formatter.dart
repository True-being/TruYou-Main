import 'package:flutter/services.dart';

List<TextInputFormatter> shortTextFormatter() {
  return [LengthLimitingTextInputFormatter(60)];
}
