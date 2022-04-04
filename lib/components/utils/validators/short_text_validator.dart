import 'package:truyou/components/components.dart';

String? shortTextValidator(String? value, String type) {
  if (value!.isEmpty) {
    return Constants.PLEASE_ENTER_A_SHORT_TEXT(type);
  } else if (value.length > 40) {
    return Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(type);
  } else {
    return null;
  }
}
