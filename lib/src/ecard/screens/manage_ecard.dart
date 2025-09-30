import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/custom_ecard.dart';
import 'package:swisecard/src/widgets/navbar.dart';

class ManageEcard extends StatelessWidget {
  const ManageEcard({super.key});

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
              SizedBox(height: 15.h),
              Text(
                "Manage Swiss eCards",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ecards',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Limit 1/1',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(thickness: 2, color: Appcolors.blackColor),
              SizedBox(height: 15.h),
              CudtomECad(),

              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}
