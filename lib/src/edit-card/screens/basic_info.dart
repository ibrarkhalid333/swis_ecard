import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class EditBasicInfo extends StatelessWidget {
  const EditBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Ibrar Khalid Farooqi - K2 Ecommerce",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.h),
              Text(
                "Swiss eCard Url",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 30.h,
                child: Center(
                  child: Text(textAlign: TextAlign.center, 'Url To be copied'),
                ),
                decoration: BoxDecoration(
                  color: Appcolors.blackColor.withAlpha(20),
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
              SizedBox(height: 10.h),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Full Name / Company Name / Business',
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tech Small Business...',
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            'Write here anout ypurself or about your company',
                      ),
                    ),
                    SizedBox(height: 20.h),
                    RoundButton(
                      width: double.infinity,
                      title: 'Update Swiss eCard',
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
