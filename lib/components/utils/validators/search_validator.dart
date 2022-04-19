import 'package:truyou/components/components.dart';

String? searchValidator(String? value) {
  if (value!.isEmpty) {
    return Constants.PLEASE_SEARCH_FOR_SOMETHING;
  } else {
    return null;
  }
}
