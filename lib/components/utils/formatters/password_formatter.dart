import 'package:flutter/services.dart';

List<TextInputFormatter> passwordFormatter() {
  return [LengthLimitingTextInputFormatter(20)];
}
