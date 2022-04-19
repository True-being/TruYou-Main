import 'package:flutter/services.dart';

List<TextInputFormatter> searchFormatter() {
  return [LengthLimitingTextInputFormatter(99)];
}
