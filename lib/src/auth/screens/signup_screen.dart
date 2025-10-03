import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swisecard/core/res/assets/icon_Assets.dart';
import 'package:swisecard/core/res/assets/image_assets.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/routes/aapp_routes.dart';
import 'package:swisecard/core/res/routes/navigation_service.dart';
import 'package:swisecard/core/utils/utils.dart';
import 'package:swisecard/src/auth/controllers/signup_controller.dart';
import 'package:swisecard/src/auth/services/auth_services.dart';
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
                        () => TextFormField(
                          controller: nameController,
                          focusNode: signUpController.nameFocusNode.value,
                          decoration: InputDecoration(
                            labelText: 'Your Full Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Full Name';
                            }
                          },
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                              context,
                              signUpController.nameFocusNode.value,
                              signUpController.emailFocusNode.value,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Obx(
                        () => TextFormField(
                          controller: emailController,
                          focusNode: signUpController.emailFocusNode.value,
                          decoration: InputDecoration(
                            labelText: 'Email Addressr',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
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
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                              context,
                              signUpController.emailFocusNode.value,
                              signUpController.mobileFocusNode.value,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Obx(
                        () => TextFormField(
                          controller: mobileController,
                          focusNode: signUpController.mobileFocusNode.value,
                          decoration: InputDecoration(
                            labelText: 'Your Mobile Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Mobile Number';
                            }
                          },
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                              context,
                              signUpController.mobileFocusNode.value,
                              signUpController.passwordFocusNode.value,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Obx(
                        () => TextFormField(
                          controller: passwordController,
                          focusNode: signUpController.passwordFocusNode.value,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Enter Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
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
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                              context,
                              signUpController.passwordFocusNode.value,
                              signUpController.confirmPasswordFocusNode.value,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Obx(
                        () => TextFormField(
                          controller: confirmPasswordController,
                          focusNode:
                              signUpController.confirmPasswordFocusNode.value,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Confirmed Password';
                            }
                          },
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                              context,
                              signUpController.confirmPasswordFocusNode.value,
                              signUpController.referalCodeFocusNode.value,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Obx(
                        () => TextFormField(
                          controller: referalCodeController,
                          focusNode:
                              signUpController.referalCodeFocusNode.value,
                          decoration: InputDecoration(
                            labelText: 'Referral Code (Optional)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                AssetImage(IconAssets.link2),
                                size: 25.sp,
                              ),
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
                        AappRoutes.login,
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
                          AappRoutes.login,
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
