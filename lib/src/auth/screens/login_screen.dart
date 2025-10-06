import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swisecard/core/res/assets/image_assets.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/routes/app_routes.dart';
import 'package:swisecard/core/res/routes/navigation_service.dart';
import 'package:swisecard/src/auth/controllers/login_controller.dart';
import 'package:swisecard/src/auth/services/auth_services.dart';
import 'package:swisecard/src/auth/widgets/text_form_field_widget.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final bool _rememberMe = false;
  final loginController = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(25.sp, 20.sp, 25.sp, 10.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.logo, width: 250.sp),
                SizedBox(height: 40.h),
                Text(
                  "Customer Login",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  textAlign: TextAlign.center,
                  "Do you have Swismax Services? Do you want any service or control please log in.",
                ),
                SizedBox(height: 50.h),

                Form(
                  key: loginController.form_key,
                  child: Column(
                    children: [
                      Obx(
                        () => TextFormFieldWidget(
                          controller: emailController,
                          currentFocusNode:
                              loginController.emailFocusNode.value,
                          nextFocusNode:
                              loginController.passwordFocusNode.value,
                          keyboardType: TextInputType.emailAddress,

                          labelText: 'Email or Mobile number',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email or Mobile';
                            } else if (emailController.text.contains(
                              RegExp(r'[a-zA-Z]'),
                            )) {
                              bool isValid = loginServices.validateEmail(
                                emailController.text,
                              );
                              if (!isValid) {
                                return 'Enter a Valid Email';
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Obx(
                        () => TextFormFieldWidget(
                          controller: passwordController,
                          currentFocusNode:
                              loginController.passwordFocusNode.value,
                          obscureText: true,
                          labelText: 'Enter Password',
                          isLastField: true,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            } else {
                              bool isValid = loginServices.validatePassword(
                                passwordController.text,
                              );
                              if (!isValid) {
                                return 'Invalid Password';
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        // setState(() {
                        //   _rememberMe = value!;
                        // });
                      },
                    ),
                    const Text('Remember'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Add forgot password functionality
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),
                RoundButton(
                  width: double.infinity,
                  onPress: () async {
                    if (loginController.form_key.currentState!.validate()) {
                      await loginController.getData();
                      NavigationService.pushReplacement(
                        context,
                        //AppRoutes.dashBoard,
                        AppRoutes.testScreen,
                      );
                    }
                  },
                  title: "LOGIN",
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        NavigationService.pushReplacement(
                          context,
                          AppRoutes.signUp,
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() => Container(child: Text(loginController.data.value))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
