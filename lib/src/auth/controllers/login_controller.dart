import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final form_key = GlobalKey<FormState>();

  // bool clearForm() {
  //   emailFocusNode.value.dispose();
  //   passwordFocusNode.value.dispose();
  //   return true;
  // }
}
