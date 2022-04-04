import 'package:truyou/components/components.dart';

String? otpValidator(String? otp) {
  if (otp!.isEmpty) {
    return Constants.PLEASE_ENTER_AN_OTP_VERIFICATION_CODE;
  } else if (otp.length < 4) {
    return Constants.PLEASE_ENTER_A_FOUR_DIGIT_OTP_CODE;
  } else {
    return null;
  }
}
