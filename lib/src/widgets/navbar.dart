import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/src/dashboard/dashboard.dart';
import 'package:swisecard/src/ecard/screens/create_ecard.dart';
import 'package:swisecard/src/ecard/screens/manage_ecard.dart';
import 'package:swisecard/src/edit-card/screens/analytics.dart';
import 'package:swisecard/src/edit-card/screens/basic_info.dart';
import 'package:swisecard/src/edit-card/screens/ecard_services.dart';
import 'package:swisecard/src/edit-card/screens/edit_profile.dart';
import 'package:swisecard/src/edit-card/screens/card_settings.dart';
import 'package:swisecard/src/edit-card/screens/edit_theme.dart';
import 'package:swisecard/src/edit-card/screens/media.dart';
import 'package:swisecard/src/edit-card/screens/qr_code.dart';
import 'package:swisecard/src/edit-card/screens/save_in_contact.dart';
import 'package:swisecard/src/widgets/list_tile_widget.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: Appcolors.blackColor,
          padding: EdgeInsets.fromLTRB(20.sp, 15.sp, 5.sp, 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SwisAdmin",
                style: TextStyle(
                  color: Appcolors.primaryTextColor,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 15.h),
              ListTileWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                icon: Icons.dashboard,
                title: 'Dashboard',
              ),
              SizedBox(height: 25.h),
              Text(
                "My Swis Card",
                style: TextStyle(color: Appcolors.primaryTextColor),
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CreateEcard()),
                  );
                },
                icon: Icons.wallet,
                title: 'Create Swis eCard',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ManageEcard()),
                  );
                },
                icon: Icons.add_business,
                title: 'Manage Swis eCard',
              ),
              Text(
                "Edit Ecard",
                style: TextStyle(color: Appcolors.primaryTextColor),
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditBasicInfo()),
                  );
                },
                icon: Icons.info_outline,
                title: 'Basic Information',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SaveInContact()),
                  );
                },
                icon: Icons.person,
                title: 'Save Contact',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditMedia()),
                  );
                },
                icon: Icons.dashboard,
                title: 'Media',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditServices()),
                  );
                },
                icon: Icons.dashboard,
                title: 'Services',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                icon: Icons.image,
                title: 'Cover & Profile',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditTheme()),
                  );
                },
                icon: Icons.format_paint,
                title: 'Theme',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Analytics()),
                  );
                },
                icon: Icons.analytics_sharp,
                title: 'Analytics & Info',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => QrCode()),
                  );
                },
                icon: Icons.qr_code,
                title: 'QR Code',
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CardSettings()),
                  );
                },
                icon: Icons.settings,
                title: 'Settings',
              ),
              SizedBox(height: 40.h),
              Center(
                child: RoundButton(
                  width: 200.w,
                  buttonColor: Appcolors.greyColor,
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
