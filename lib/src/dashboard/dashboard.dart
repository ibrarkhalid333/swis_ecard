import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/style/app_text_styles.dart';
import 'package:swisecard/src/dashboard/dashboardController.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/custom_ecard.dart';
import 'package:swisecard/src/widgets/navbar.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    print("dashboard controller initialized");
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Account Balance: \$ 0",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.h),
              Obx(
                () => Text(
                  "Welcome ${controller.fullName.value}",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mainHeading,
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ecards', style: AppTextStyles.subHeading),
                  Text(
                    'Limit 1/1',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(thickness: 2, color: AppColors.blackColor),
              SizedBox(height: 15.h),
              CudtomECad(),

              SizedBox(height: 25.h),
              Text('Tickets', style: AppTextStyles.subHeading),
              Divider(thickness: 2, color: AppColors.blackColor),
              SizedBox(height: 15.h),

              DataTable(
                columns: [
                  DataColumn(label: Text("#")),
                  DataColumn(label: Text("Ticket No")),
                  DataColumn(label: Text("Project Name")),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Container()),
                      DataCell(Container(child: Text('No Tickets'))),
                      DataCell(Container()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
