import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/src/edit-card/widgets/stat_card..dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class Analytics extends StatelessWidget {
  Analytics({super.key});
  final info = {
    'BECID': '38',
    'eCar ID': '8244',
    'Expiry Date': 'No Expiry Date Set Yet',
    'Creation date': '25 Sep, 2025',
    'Last Update': '10:00 AM / 30 Sep, 2025',
    'Last Login IP': 'No IP Found',
    'Swis eCard-URL': 'https://swisecard.com/view/8244',
    'Swis eCard Old URL': 'https://swisecard.com/view/8244',
  };

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
              Text(
                "Analytics",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),

              Card(
                elevation: 2,
                child: Container(
                  height: 200.h,
                  padding: EdgeInsets.all(10.sp),
                  //decoration: BoxDecoration(border: Border.all(width: 1.0)),
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150.w,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 2.h,
                      childAspectRatio: 1.5,
                    ),

                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return StatCard(
                        icon: Icons.remove_red_eye_outlined,
                        value: 6,
                        label: 'Views',
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Information",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5.h),
              Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.sp, 5.sp, 15.sp, 5.sp),
                  child: Column(
                    children: info.entries.map((entry) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(entry.key, style: TextStyle(fontSize: 11.sp)),
                          Text(entry.value, style: TextStyle(fontSize: 11.sp)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
