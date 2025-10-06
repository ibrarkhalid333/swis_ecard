import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swisecard/core/res/assets/icon_Assets.dart';
import 'package:swisecard/core/res/assets/image_assets.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/routes/app_routes.dart';
import 'package:swisecard/core/res/routes/navigation_service.dart';
import 'package:swisecard/src/auth/controllers/signup_controller.dart';
import 'package:swisecard/src/auth/services/auth_services.dart';
import 'package:swisecard/src/auth/widgets/text_form_field_widget.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final referalCodeController = TextEditingController();
  final mobileController = TextEditingController();
  final signUpController = Get.put(SignUpController());
  final signupServices = AuthServices();
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
                SizedBox(height: 10.h),
                Text(
                  textAlign: TextAlign.center,
                  "Unlock the full spectrum of our dynamic services by signing up.",
                ),
                SizedBox(height: 70.h),
                Form(
                  key: signUpController.form_key,
                  child: Column(
                    children: [
                      Obx(
                        () => TextFormFieldWidget(
                          controller: nameController,
                          currentFocusNode:
                              signUpController.nameFocusNode.value,
                          labelText: "Your Full Name",
                          nextFocusNode: signUpController.emailFocusNode.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Full Name';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Obx(
                        () => TextFormFieldWidget(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          currentFocusNode:
                              signUpController.emailFocusNode.value,
                          nextFocusNode: signUpController.mobileFocusNode.value,
                          labelText: 'Email Addressr',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email';
                            } else {
                              bool isValid = signupServices.validateEmail(
                                emailController.text,
                              );
                              if (!isValid) {
                                return 'Enter a Valid Email';
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Obx(
                        () => TextFormFieldWidget(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          currentFocusNode:
                              signUpController.mobileFocusNode.value,
                          nextFocusNode:
                              signUpController.passwordFocusNode.value,
                          labelText: 'Your Mobile Number',

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Mobile Number';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Obx(
                        () => TextFormFieldWidget(
                          controller: passwordController,
                          currentFocusNode:
                              signUpController.passwordFocusNode.value,
                          nextFocusNode:
                              signUpController.confirmPasswordFocusNode.value,
                          obscureText: true,
                          labelText: 'Please Enter Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            } else {
                              bool isValid = signupServices.validatePassword(
                                passwordController.text,
                              );
                              if (!isValid) {
                                return 'Invalid Password';
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Obx(
                        () => TextFormFieldWidget(
                          controller: confirmPasswordController,
                          currentFocusNode:
                              signUpController.confirmPasswordFocusNode.value,
                          nextFocusNode:
                              signUpController.referalCodeFocusNode.value,
                          obscureText: true,
                          labelText: 'Confirm Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Confirmed Password';
                            } else {
                              bool isValid = signupServices.validatePassword(
                                confirmPasswordController.text,
                              );
                              if (!isValid) {
                                return 'Invalid Password';
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Obx(
                        () => TextFormFieldWidget(
                          controller: referalCodeController,
                          currentFocusNode:
                              signUpController.referalCodeFocusNode.value,
                          labelText: 'Referal Text (Optional)',
                          isLastField: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            } else {
                              bool isValid = signupServices.validatePassword(
                                passwordController.text,
                              );
                              if (!isValid) {
                                return 'Invalid Password';
                              }
                            }
                          },

                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(IconAssets.link2),
                              size: 25.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),
                RoundButton(
                  width: double.infinity,
                  onPress: () {
                    if (signUpController.form_key.currentState!.validate()) {
                      NavigationService.pushReplacement(
                        context,
                        AppRoutes.login,
                      );
                    }
                  },
                  title: "SIGNUP",
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        NavigationService.pushReplacement(
                          context,
                          AppRoutes.login,
                        );
                      },
                      child: Text(
                        "login",
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
