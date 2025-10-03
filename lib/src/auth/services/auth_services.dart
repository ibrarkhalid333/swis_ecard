import 'package:email_validator/email_validator.dart';

class AuthServices {
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validatePassword(String password) {
    if (password.length >= 8) {
      return true;
    } else {
      return false;
    }
  }
}
