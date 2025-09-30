import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class ExpandableContentCard extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ExpandableContentCard({
    Key? key,
    required this.title,
    required this.content,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<ExpandableContentCard> createState() => _ExpandableContentCardState();
}

class _ExpandableContentCardState extends State<ExpandableContentCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        trailing: _isExpanded
            ? const Icon(Icons.expand_less)
            : const Icon(Icons.expand_more),
        childrenPadding: EdgeInsets.all(16),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          // Content
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.content,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15.sp, height: 1.5),
            ),
          ),
          SizedBox(height: 16),

          // Edit and Delete Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RoundButton(
                width: 60.w,
                height: 30.h,
                title: 'Edit',
                onPress: () {},
              ),
              SizedBox(width: 12),
              RoundButton(
                width: 60.w,
                height: 30.h,
                title: 'Delete',
                onPress: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
