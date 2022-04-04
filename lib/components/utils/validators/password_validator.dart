import 'package:truyou/components/components.dart';

String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return Constants.PLEASE_ENTER_A_PASSWORD;
  } else if (value.length < 8) {
    return Constants.PLEASE_ENTER_A_LONGER_PASSWORD;
  } else {
    return null;
  }
}
