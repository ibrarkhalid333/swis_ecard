import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSection extends StatefulWidget {
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
  State<ColorSection> createState() => _ColorSectionState();
}

class _ColorSectionState extends State<ColorSection> {
  Color color = Colors.red;
  AlertDialog pickColor() {
    return AlertDialog(
      title: Text("Pick Your Color"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildColorPicker(),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Sellect"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) => pickColor());
              },
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              widget.colorCode,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorPicker() => ColorPicker(
    pickerColor: color,
    onColorChanged: (color) => setState(() => this.color = color),
  );
}
