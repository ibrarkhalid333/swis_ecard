import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/style/app_text_styles.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class CreateEcard extends StatelessWidget {
  const CreateEcard({super.key});

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
              SizedBox(height: 30.h),
              Text(
                "Create a new Swiss Ecard",
                textAlign: TextAlign.center,
                style: AppTextStyles.mainHeading
              ),
              SizedBox(height: 40.h),
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
                      title: 'Create eCard',
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
