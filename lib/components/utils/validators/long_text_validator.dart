import 'package:truyou/components/components.dart';

String? longTextValidator(String? text, String type) {
  if (text!.isEmpty) {
    return Constants.PLEASE_ENTER_A_LONG_TEXT(type);
  } else if (text.length < 30) {
    return Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS;
  } else {
    return null;
  }
}
