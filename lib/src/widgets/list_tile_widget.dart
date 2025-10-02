import 'package:flutter/material.dart';
import 'package:swisecard/core/res/colors/appColors.dart';

class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primaryTextColor,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColors.primaryTextColor),
      ),
      onTap: onTap,
    );
  }
}