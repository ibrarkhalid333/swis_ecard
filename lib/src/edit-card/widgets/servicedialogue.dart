import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDialog extends StatefulWidget {
  const ServiceDialog({Key? key}) : super(key: key);

  @override
  State<ServiceDialog> createState() => _ServiceDialogState();
}

class _ServiceDialogState extends State<ServiceDialog> {
  final List<String> buttonNames = [
    'Airbnb',
    'Facebook',
    'Instagram',
    'Twitter',
    'LinkedIn',
    'YouTube',
    'Website',
    'Phone',
    'Email',
    'WhatsApp',
  ];
  String? selectedButtonName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add Service - Swis eCard",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Name Section
            _buildLabel("Service Name *"),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your providing service name",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
            SizedBox(height: 16.h),

            // Service Description Section
            _buildLabel("Service Description *"),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Max 600 Characters",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
            SizedBox(height: 16.h),

            // URL Section
            _buildLabel(
              "URL (If you want add link with your service you can use URL) Optional",
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "https:// is required",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
            SizedBox(height: 16.h),

            // URL Button Name Section
            _buildLabel("URL Button Name"),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: DropdownButton<String>(
                value: selectedButtonName ?? buttonNames.first,
                isExpanded: true,
                underline: const SizedBox(), // Remove default underline
                icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedButtonName = newValue;
                  });
                },
                items: buttonNames.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "CANCEL",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Add your service logic here
            Navigator.of(context).pop();
          },
          child: Text(
            "Add Service",
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
    );
  }
}
