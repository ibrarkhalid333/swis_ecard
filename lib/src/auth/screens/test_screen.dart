import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swisecard/src/auth/controllers/login_controller.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 200,
              child: Obx(() => Text(loginController.data.value)),
              // Text("kdsf"),
            ),
          ],
        ),
      ),
    );
  }
}
