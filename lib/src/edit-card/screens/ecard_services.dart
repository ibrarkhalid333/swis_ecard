import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/src/edit-card/widgets/expand_content_card.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class EditServices extends StatelessWidget {
  const EditServices({super.key});

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
                height: 40.h,
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
              SizedBox(height: 15.h),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ExpandableContentCard(
                        title: 'XYZ',
                        content:
                            'K2 E-Commerce K2 E-Commerce is a multi-brand online shopping platform that provides customers with access to a wide variety of clothing and fashion products. The platform brings together different brands under one digital roof, making it easy for customers to browse, compare, and purchase the latest trends in apparel. Our service is designed to deliver a ',
                        onEdit: () {},
                        onDelete: () {},
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 10.h),
              Text(
                "You Can add More Services from",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
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
