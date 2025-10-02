import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/core/res/colors/appColors.dart';
import 'package:swisecard/core/res/style/app_text_styles.dart';
import 'package:swisecard/src/edit-card/widgets/security_radio_tile.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class CardSettings extends StatefulWidget {
  @override
  _CardSettingState createState() => _CardSettingState();
}

class _CardSettingState extends State<CardSettings> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  TimeOfDay? _selectedTime;
  String _selectedOption = '';
  final TextEditingController _editTimeController = TextEditingController();
  Timer? _timer;

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  void _formatTime(String value) {
    // Remove everything except digits and letters (for AM/PM)
    String digits = value.replaceAll(RegExp(r'[^0-9APMapm]'), '');

    String hr = '';
    String min = '';
    String ampm = '';

    if (digits.length >= 1) {
      hr = digits.substring(0, digits.length >= 2 ? 2 : 1);
      if (hr.length == 1) hr = '0$hr'; // Add leading zero
    }

    if (digits.length >= 3) {
      min = digits.substring(2, digits.length >= 4 ? 4 : 3);
      if (min.length == 1) min = '0$min';
    }

    if (digits.length >= 4) {
      if (digits.toLowerCase().contains('a')) {
        ampm = 'AM';
      } else if (digits.toLowerCase().contains('p')) {
        ampm = 'PM';
      }
    }
    String formatted = hr;
    if (min.isNotEmpty) formatted += ':$min';
    if (ampm.isNotEmpty) formatted += ' $ampm';

    _editTimeController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  void _onChanged(String value) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: 1), () {
      _formatTime(value);
    });
  }

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
                style: AppTextStyles.mainHeading,
              ),
              SizedBox(height: 15.h),
              Text("Swiss eCard Url", style: AppTextStyles.subHeading),
              Container(
                height: 40.h,
                child: Center(
                  child: Text(textAlign: TextAlign.center, 'Url To be copied'),
                ),
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withAlpha(20),
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
              Divider(),
              SizedBox(height: 10.h),
              Text("Username", style: AppTextStyles.subHeading),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        "https://www.swiscard.com/view/",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          hintText: "Enter ID",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              RoundButton(title: 'Update Username', onPress: () {}),
              Divider(),
              SizedBox(height: 30.h),
              Text("Security Type", style: AppTextStyles.subHeading),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //////// ////    enable Password              /////////////
                  SecurityRadioTile(
                    value: "password",
                    title: "Enable Password",
                    selectedValue: _selectedOption,
                    onChanged: (val) => setState(() => _selectedOption = val),
                    trailing: Icon(Icons.lock, color: Colors.green),
                    child: Column(
                      children: [
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.h),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Confirm Password",
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),

                  SecurityRadioTile(
                    value: "otp",
                    title: "Enable OTP",
                    selectedValue: _selectedOption,
                    onChanged: (val) => setState(() => _selectedOption = val),
                    trailing: Icon(Icons.security, color: Colors.blue),
                    child: TextField(
                      controller: _otpController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter OTP",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SecurityRadioTile(
                    value: "time",
                    title: "Enable Time URL",
                    selectedValue: _selectedOption,
                    onChanged: (val) => setState(() => _selectedOption = val),
                    trailing: Icon(Icons.access_time, color: Colors.orange),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _editTimeController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: '--:-- --',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: _onChanged,
                          ),
                        ),

                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: _pickTime,
                        ),
                      ],
                    ),
                  ),
                  SecurityRadioTile(
                    value: "none",
                    title: "None",
                    selectedValue: _selectedOption,
                    onChanged: (val) => setState(() => _selectedOption = val),
                    trailing: Icon(Icons.close, color: Colors.red),
                    child: null,
                  ),
                  SizedBox(height: 20),
                  RoundButton(
                    height: 30.h,
                    width: double.infinity,
                    title: 'Update',
                    onPress: () {},
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 30.h),
              Text("Contact Form", style: AppTextStyles.subHeading),
              SizedBox(height: 5.h),
              Container(
                padding: EdgeInsets.all(10.sp),
                // decoration: BoxDecoration(border: Border.all(width: 1.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Send To Email",

                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Sent to Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Reply from Email",

                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email For Reply',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Subject of Email",

                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Subject of Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    RoundButton(
                      width: double.infinity,
                      height: 30.h,
                      title: 'Update',
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
