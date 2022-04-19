import 'package:truyou/components/components.dart';

String? trustValidator(String? value) {
  if (value!.isEmpty) {
    return Constants.PLEASE_ENTER_A_TRUST_AMOUNT;
  } else if (value.contains('.') || value.contains('-')) {
    return Constants.PLEASE_ENTER_AMOUNT_WITH_NO_ABNORMAL_CHARS;
  } else if (int.parse(value) == 0) {
    return Constants.PLEASE_ENTER_AMOUNT_MORE_THAN_0;
  } else {
    return null;
  }
}
