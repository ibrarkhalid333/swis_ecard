import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/src/edit-card/widgets/color_section.dart';

class MediaDialogue extends StatefulWidget {
  const MediaDialogue({super.key});

  @override
  State<MediaDialogue> createState() => _MediaDialogueState();
}

class _MediaDialogueState extends State<MediaDialogue> {
  final List<String> mediaOptions = [
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
  final List<String> buttonStyleOptions = [
    'Solid With Round Edge',
    'Solid With Square Edge',
    'Outline With Round Edge',
    'Outline With Square Edge',
    'Gradient Fill',
    'Text Only',
  ];
  // final List<Color> pickedColors = [

  // ];
  Map<String, Color> pickedColors = {"red": Colors.red};
  String? selectedMedia;
  String? selectedButtonStyle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add Media - Swis eCard",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select Media Section
            Text(
              "Select Media",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: DropdownButton<String>(
                value: selectedMedia ?? mediaOptions.first,
                isExpanded: true,
                underline: const SizedBox(), // Remove default underline
                icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMedia = newValue;
                  });
                },
                items: mediaOptions.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.h),

            // Media Uri Section
            Text(
              "Media Uri / No. / Email",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "https://www.facebook.com/YouiPq",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
            SizedBox(height: 16.h),

            // Media Name Section
            Text(
              "Media Name",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write here Media Name Exp: Facebc",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
            SizedBox(height: 16.h),

            // Color Selection Sections
            ColorSection(
              title: "Media Name Color",
              colorCode: "#000000",
              color: Color(0xFF000000),
            ),
            SizedBox(height: 12.h),

            ColorSection(
              title: "Media Icon Color",
              colorCode: "#ffffff",
              color: Color(0xFFFFFFFF),
            ),
            SizedBox(height: 12.h),

            ColorSection(
              title: "Media Icon Background",
              colorCode: "#be0e0e",
              color: Color(0xFFBE0E0E),
            ),
            SizedBox(height: 12.h),
            ColorSection(
              title: "Icon Border Color",
              colorCode: "#be0e0e",
              color: Color(0xFFBE0E0E),
            ),
            SizedBox(height: 12.h),
            Text(
              "Media Icon Shape",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: DropdownButton<String>(
                value: selectedButtonStyle ?? buttonStyleOptions.first,
                isExpanded: true,
                underline: const SizedBox(), // Remove default underline
                icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedButtonStyle = newValue;
                  });
                },
                items: buttonStyleOptions.map<DropdownMenuItem<String>>((
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
        TextButton(
          onPressed: () {
            // Add your save logic here
            Navigator.of(context).pop();
          },
          child: Text(
            "SAVE",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
