import 'package:truyou/components/components.dart';

String? phoneNumberValidator(String? value) {
  if (value!.isEmpty) {
    return Constants.PLEASE_ENTER_A_PHONE_NUMBER;
  } else if (value.length < 10) {
    return Constants.PLEASE_ENTER_PHONE_NUMBER_WITH_TEN_DIGITS;
  } else {
    return null;
  }
}
