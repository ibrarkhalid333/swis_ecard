import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/routes/aapp_routes.dart';
import 'package:swisecard/core/res/routes/navigation_service.dart';
import 'package:swisecard/src/widgets/list_tile_widget.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.blackColor,
          padding: EdgeInsets.fromLTRB(20.sp, 15.sp, 5.sp, 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SwisAdmin",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 15.h),
              ListTileWidget(
                onTap: () {
                  NavigationService.push(context, AappRoutes.dashBoard);
                },
                icon: Icons.dashboard,
                title: 'Dashboard',
              ),
              SizedBox(height: 25.h),
              Text(
                "My Swis Card",
                style: TextStyle(color: AppColors.primaryTextColor),
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.createEcard,
                  );
                },
                icon: Icons.wallet,
                title: 'Create Swis eCard',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.manageEcard,
                  );
                },
                icon: Icons.add_business,
                title: 'Manage Swis eCard',
              ),
              Text(
                "Edit Ecard",
                style: TextStyle(color: AppColors.primaryTextColor),
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.editBasicInfo,
                  );
                },
                icon: Icons.info_outline,
                title: 'Basic Information',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.saveInContact,
                  );
                },
                icon: Icons.person,
                title: 'Save Contact',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.editMedia,
                  );
                },
                icon: Icons.dashboard,
                title: 'Media',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.editServices,
                  );
                },
                icon: Icons.dashboard,
                title: 'Services',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.editProfile,
                  );
                },
                icon: Icons.image,
                title: 'Cover & Profile',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.editTheme,
                  );
                },
                icon: Icons.format_paint,
                title: 'Theme',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.analytixs,
                  );
                },
                icon: Icons.analytics_sharp,
                title: 'Analytics & Info',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(context, AappRoutes.qrCode);
                },
                icon: Icons.qr_code,
                title: 'QR Code',
              ),
              ListTileWidget(
                onTap: () {
                  NavigationService.pushReplacement(
                    context,
                    AappRoutes.cardSettings,
                  );
                },
                icon: Icons.settings,
                title: 'Settings',
              ),
              SizedBox(height: 40.h),
              Center(
                child: RoundButton(
                  width: 200.w,
                  buttonColor: AppColors.greyColor,
                  onPress: () {},
                  title: 'Helo Center',
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
