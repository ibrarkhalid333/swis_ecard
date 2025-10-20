import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:swisecard/core/res/routes/app_routes.dart';
import 'package:swisecard/core/res/routes/navigation_service.dart';
import 'package:swisecard/src/auth/model/user_model.dart';

class AuthServices {
  static final AuthServices _instance = AuthServices._internal();
  factory AuthServices() => _instance;
  AuthServices._internal();
  static UserModel? _currentUser;
  var data;
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

  void isLoggedIn(BuildContext context) {
    const user = null;
    if (user != null) {
      Timer(
        const Duration(seconds: 3),
        () => NavigationService.pushReplacement(context, AppRoutes.dashBoard),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => NavigationService.pushReplacement(context, AppRoutes.login),
      );
    }
  }

  void setCurrentUser(UserModel user) {
    print("✅ setCurrentUser called with: ${user.toJson()}");
    print(user);
    _currentUser = user;
    data = user.data!;
  }

  UserModel? getCurrentUser() {
    return _currentUser;
  }

  void clearUser() {
    _currentUser = null;
  }
}
