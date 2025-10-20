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
import 'package:swisecard/src/dashboard/dashboardController.dart';

class SignUpController extends GetxController {
  final nameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final mobileFocusNode = FocusNode().obs;
  final referalCodeFocusNode = FocusNode().obs;

  String email = "";
  String password = "";
  String fulName = "";
  String mobileNumber = "";
  String confirm = "";
  String userError = '';
  var data = "No data yet".obs;
  RxBool loading = false.obs;

  final form_key = GlobalKey<FormState>();

  final _api = AuthRepository();
  final AuthServices authServices = AuthServices();

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setFullName(String fullName) {
    fulName = fullName;
  }

  void setMobileNumber(String mobileNumber) {
    this.mobileNumber = mobileNumber;
  }

  void setConfirm(String confirm) {
    this.confirm = confirm;
  }

  void setUserError(String err) {
    userError = err;
  }

  Future<void> signUp(BuildContext context) async {
    loading = true.obs;
    print("Signuo Function is called");
    if (password != confirm) {
      print("password donot match");
      return;
    }
    Map<String, String> data = {
      'email': email,
      'password': password,
      "fullName": fulName,
      "mobileNumber": mobileNumber,
    };
    try {
      print("try ");
      dynamic response = await _api.registerApi(data);
      final responseData = jsonDecode(response.body);
      final jsonResponse = UserModel.fromJson(responseData);
      print("The response is: " + response.body);
      print(jsonResponse);
      print(jsonResponse.sucess);
      if (jsonResponse.sucess == true) {
        print("Saving UserModel: ${jsonResponse.toJson()}");
        print("User data inside: ${jsonResponse.data?.fullName}");
        authServices.setCurrentUser(jsonResponse);
         if (Get.isRegistered<DashboardController>()) {
          Get.delete<DashboardController>();
        }
        Get.put(DashboardController());
        Utils.ShowSnackBar(context, 'SignUp', "SignedUp Successfully");
        NavigationService.pushReplacement(context, AppRoutes.dashBoard);
      } else if (jsonResponse.sucess == false) {
        Utils.ErrrorSnackBar(
          context,
          'SignUpError',
          "Incorrect Email or Password",
        );
      }
      this.data.value = response.body;
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
    } finally {
      loading = false.obs;
    }
  }
}
