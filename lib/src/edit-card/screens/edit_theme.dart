import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/style/app_text_styles.dart';
import 'package:swisecard/src/edit-card/widgets/color_tile.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class EditTheme extends StatelessWidget {
  const EditTheme({super.key});

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
                style: AppTextStyles.mainHeading,
              ),
              SizedBox(height: 15.h),
              Text(
                "Swiss eCard Url",
                style: AppTextStyles.subHeading
              ),
              Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Center(
                  child: Text(textAlign: TextAlign.center, 'Url To be copied'),
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

              ColorTile(
                label: 'Background Color',
                color: Color(0xffbdcb4d),
                onTap: () {},
              ),
              ColorTile(
                label: 'All Headings Color',
                color: Color(0xff000000),
                onTap: () {},
              ),
              ColorTile(
                label: 'All Text Color',
                color: Color(0xff000000),
                onTap: () {},
              ),
              ColorTile(
                label: 'All Botton Color',
                color: Color(0xffb04a4a),
                onTap: () {},
              ),
              ColorTile(
                label: 'Buttons Text Color',
                color: Color(0xff19a363),
                onTap: () {},
              ),
              Divider(),
              SizedBox(height: 10.h),
              Center(
                child: RoundButton(
                  width: 150.w,
                  height: 40.h,
                  title: 'Add More Services',
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
