import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class CudtomECad extends StatelessWidget {
  const CudtomECad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 110.h,
        padding: EdgeInsets.all(5.sp),
        // color: Appcolors.blackColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              width: 100.sp,
              height: 100.sp,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(child: Text('Upload image')),
            ),
            SizedBox(width: 30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ibrar Khalid Farooqi",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("K2 Ecommerce", style: TextStyle(fontSize: 15)),
                Spacer(),
                Row(
                  children: [
                    RoundButton(
                      width: 70.w,
                      height: 30.h,
                      title: 'Action',
                      onPress: () {},
                    ),
                    SizedBox(width: 10.w),
                    RoundButton(
                      width: 70.w,
                      height: 30.h,
                      title: 'Copy Url',
                      onPress: () {},
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
