import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/assets/icon_Assets.dart';
import 'package:swisecard/core/res/assets/image_assets.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/src/auth/screens/login_screen.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(25.sp, 20.sp, 25.sp, 10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(ImageAssets.logo, width: 250.sp),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                "Unlock the full spectrum of our dynamic services by signing up.",
              ),
              SizedBox(height: 70.h),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Addressr',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Mobile Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
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
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Referral Code (Optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: ImageIcon(AssetImage(IconAssets.link2), size: 25.sp),
                  ),
                ),
              ),

              SizedBox(height: 10.h),
              RoundButton(
                width: double.infinity,
                onPress: () {},
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "login",
                      style: TextStyle(
                        color: Appcolors.secondaryTextColor,
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
