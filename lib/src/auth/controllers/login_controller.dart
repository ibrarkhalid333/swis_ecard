import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:swisecard/core/res/routes/app_routes.dart';
import 'package:swisecard/core/res/routes/navigation_service.dart';
import 'package:swisecard/core/utils/utils.dart';
import 'package:swisecard/data/app_exceptions.dart';
import 'package:swisecard/src/auth/model/user_model.dart';
import 'package:swisecard/src/auth/repossitories/auth_repository.dart';
import 'package:swisecard/src/auth/services/auth_services.dart';
import 'package:swisecard/src/auth/services/user_prefrences.dart';
import 'package:swisecard/src/dashboard/dashboardController.dart';

class LoginController extends GetxController {
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  String email = "";
  String password = "";
  String userError = "";
  final userPreferences = UserPrefrences();
  void setUserError(String err) {
    userError = err;
  }

  final form_key = GlobalKey<FormState>();
  final _api = AuthRepository();
  final authServices = AuthServices();
  var data = "No data yet".obs;

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String pass) {
    password = pass;
  }

  Future<void> login(BuildContext context) async {
    print("get data is called");
    Map<String, String> data = {'email': email, 'password': password};
    try {
      print("try ");
      dynamic response = await _api.LoginApi(data);
      print("API Response: ${response.toString()}");
      final body = response["body"];
      // Access headers
      final headers = response["headers"];
      final token = headers["auth-token"];
      print(token.runtimeType);
      print("Body: $body");
      print(body.runtimeType);
      body["token"] = token;
      print("Body: $body");
      print("Token from header: $token");
      final jsonResponse = UserModel.fromJson(body);
      print("jsonResponse: ${jsonResponse}");
      if (jsonResponse.sucess == true) {
        print("Saving UserModel: ${jsonResponse.toJson()}");
        print("User data inside: ${jsonResponse.data?.fullName}");

        // authServices.setCurrentUser(jsonResponse);
        await userPreferences.saveUser(jsonResponse);
        if (Get.isRegistered<DashboardController>()) {
          Get.delete<DashboardController>();
        }
        Get.put(DashboardController());
        Utils.ShowSnackBar(context, 'Login', 'Login Successful');
        NavigationService.pushReplacement(context, AppRoutes.dashBoard);
        // Get.off(() => AppRoutes.dashBoard);
      } else if (jsonResponse.sucess == false) {
        Utils.ErrrorSnackBar(
          context,
          'Login Error',
          "Incorrect Email or Password",
        );
      }
    } catch (error) {
      String errorMessage;
      this.data.value = "Error$error";
      if (error.runtimeType == HttpException) {
        errorMessage = 'Network error occurred. Please try again.';
      } else if (error.runtimeType == SocketException) {
        errorMessage = 'No Internet Connection';
      } else if (error.runtimeType == ServerExceptions) {
        errorMessage = 'Server Not Found ';
      } else if (error.runtimeType == TimeoutException) {
        errorMessage = 'Request Timeout ';
      } else if (error.runtimeType == ClientException) {
        errorMessage =
            'Failed to connect, Please check your Internet Connection ';
      } else {
        errorMessage = 'Unexpected Error ${error.toString()}';
      }
      setUserError(errorMessage);
      userError = errorMessage;
      Utils.ErrrorSnackBar(context, 'Error Signing Up', userError);
    }
  }
}
