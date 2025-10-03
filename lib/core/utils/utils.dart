import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currunt, FocusNode nextFocus) {
    currunt.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
