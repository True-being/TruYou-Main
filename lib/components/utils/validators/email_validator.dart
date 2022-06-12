import 'package:truyou/components/components.dart';

String? emailValidator(String? email) {
  //Checks if email is empty
  if (email!.isEmpty) return Constants.PLEASE_ENTER_AN_EMAIL;
  //Email Regex pattern
  RegExp regExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  //Checks if the email(without spaces) is valid
  if (!regExp.hasMatch(SpaceRemover.removeSpaces(email))) {
    return Constants.PLEASE_ENTER_A_VALID_EMAIL;
  } else {
    return null;
  }
}
