import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        PopupMenuButton<String>(
          offset: const Offset(0, kToolbarHeight),
          child: IconButton(
            onPressed: null,
            icon: Icon(Icons.settings),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.access_time),
                title: Text("Change Password"),
              ),
            ),
            const PopupMenuDivider(thickness: 1.2),
            PopupMenuItem(
              child: ListTile(
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}