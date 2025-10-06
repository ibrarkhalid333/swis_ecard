import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swisecard/data/Network/base_api_services.dart';
import 'package:swisecard/data/Network/network_api_services.dart';
import 'package:swisecard/src/auth/repossitories/auth_repository.dart';

class LoginController extends GetxController {
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final form_key = GlobalKey<FormState>();
  final _api = AuthRepository();
  var data = "No data yet".obs;

  // bool clearForm() {
  //   emailFocusNode.value.dispose();
  //   passwordFocusNode.value.dispose();
  //   return true;
  // }

  getData() async {
    dynamic response = await _api.LoginApi();
    //print("The response is: " + response.body);
    this.data.value = response.body;
  }
}
