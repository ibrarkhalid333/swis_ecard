import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/src/edit-card/widgets/media_dialogue.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class EditMedia extends StatelessWidget {
  const EditMedia({super.key});

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
              GridView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.w,
                  crossAxisSpacing: 5.w,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Center(
                      child: Column(
                        //  mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70.sp,
                            height: 70.sp,
                            child: Center(child: Icon(Icons.phone)),
                            decoration: BoxDecoration(
                              color: Appcolors.greenColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Text(
                            "WhatsApp",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButton(
                                width: 70.w,
                                height: 30.h,
                                title: "Edit",
                                onPress: () {},
                              ),

                              RoundButton(
                                width: 70.w,
                                height: 30.h,
                                title: "Delete",
                                onPress: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Divider(),
              SizedBox(height: 5.h),
              Text(
                "You Can add More Media from",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Center(
                child: RoundButton(
                  width: 150.w,
                  height: 40.h,
                  title: 'Add More Media',
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MediaDialogue();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
