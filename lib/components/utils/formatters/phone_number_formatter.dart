import 'package:flutter/services.dart';

String formatPhoneNumber(String number) {
  return number.replaceAllMapped(
      RegExp(r'(\d{3})(\d{3})(\d+)'), (Match m) => "${m[1]}-${m[2]}-${m[3]}");
}

List<TextInputFormatter> phoneNumberFormatter() {
  return [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  ];
}
