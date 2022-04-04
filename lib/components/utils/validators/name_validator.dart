import 'package:truyou/components/utils/utils.dart';

String? nameValidator(String? value, String nameOrLastName) {
  if (value!.isEmpty) {
    return Constants.PLEASE_ENTER_A_NAME(nameOrLastName);
  }
  if (value.length <= 1) {
    return Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
        nameOrLastName);
  }
  if (value.length > 30) {
    return Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
        nameOrLastName);
  }
  RegExp regExp = RegExp(r"^[a-zA-Z ,.'-]+$");
  if (!regExp.hasMatch(SpaceRemover.removeSpaces(value))) {
    return Constants.PLEASE_ENTER_A_VALID_NAME(nameOrLastName);
  } else {
    return null;
  }
}
