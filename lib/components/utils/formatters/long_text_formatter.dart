import 'package:flutter/services.dart';

List<TextInputFormatter> longTextFormatter() {
  return [LengthLimitingTextInputFormatter(400)];
}
