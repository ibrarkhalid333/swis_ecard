import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSection extends StatelessWidget {
  final String title;
  final String colorCode;
  final Color color;

  const ColorSection({
    Key? key,
    required this.title,
    required this.colorCode,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              colorCode,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}