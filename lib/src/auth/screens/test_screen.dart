import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:swisecard/src/auth/controllers/login_controller.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Obx(() => Text(loginController.data.value)),
            // Text("kdsf"),
          ),
        ],
      ),
    );
  }
}
