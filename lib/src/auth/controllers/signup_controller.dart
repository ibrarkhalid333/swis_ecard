import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
 

  final nameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final mobileFocusNode = FocusNode().obs;
  final referalCodeFocusNode = FocusNode().obs;

  final form_key = GlobalKey<FormState>();
}
