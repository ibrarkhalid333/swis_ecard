import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/assets/image_assets.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/routes/aapp_routes.dart';
import 'package:swisecard/core/res/routes/navigation_service.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(25.sp, 20.sp, 25.sp, 10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo, width: 250.sp),
              SizedBox(height: 50.h),
              Text(
                "Customer Login",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                "Do you have Swismax Services? Do you want any service or control please log in.",
              ),
              SizedBox(height: 60.h),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email or Mobile number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                onPress: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.dashBoard,
                  );
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
                    AappRoutes.signUp,
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
            ],
          ),
        ),
      ),
    );
  }
}
