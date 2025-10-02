import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/assets/image_assets.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/style/app_text_styles.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Ibrar Khalid Farooqi - K2 Ecommerce",
                textAlign: TextAlign.center,
                style: AppTextStyles.mainHeading,
              ),
              SizedBox(height: 15.h),
              Text("Swiss eCard Url", style: AppTextStyles.subHeading),
              Container(
                height: 40.h,
                child: Center(
                  child: Text(textAlign: TextAlign.center, 'Url To be copied'),
                ),
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundButton(
                    height: 30.h,
                    width: 60.w,
                    title: 'Copy',
                    onPress: () {},
                  ),
                  SizedBox(width: 10.w),
                  RoundButton(
                    height: 30.h,
                    width: 60.w,
                    title: "view",
                    onPress: () {},
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text("Cover Image", style: AppTextStyles.subHeading),
              SizedBox(height: 10.h),
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(width: 1.0)),
                child: Image.asset(ImageAssets.logo, fit: BoxFit.cover),
              ),
              SizedBox(height: 15.h),
              Text(
                "Upload Cover Image",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              RoundButton(
                width: 120.w,
                height: 40.h,
                title: "Choose Image",
                onPress: () {},
              ),
              Divider(),
              SizedBox(height: 15.h),
              Text("Profile Image", style: AppTextStyles.subHeading),
              SizedBox(height: 10.h),
              Center(
                child: Container(
                  width: 170.r,
                  height: 170.r,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),
              Text(
                "Upload Profile Image",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              RoundButton(
                width: 120.w,
                height: 40.h,
                title: "Choose Image",
                onPress: () {},
              ),
              Divider(),
              SizedBox(height: 30.h),
              Center(
                child: RoundButton(
                  width: 120.w,
                  title: "Update",
                  onPress: () {},
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
