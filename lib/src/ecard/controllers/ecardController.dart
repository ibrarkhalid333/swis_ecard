import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swisecard/src/auth/model/user_model.dart';
import 'package:swisecard/src/auth/services/user_prefrences.dart';
import 'package:swisecard/src/ecard/repositories/cardRepository.dart';

class Ecardcontroller extends GetxController {
  RxInt currentStep = 0.obs;

  final nameController = TextEditingController().obs;
  final companyController = TextEditingController().obs;
  final aboutController = TextEditingController().obs;
  Rx<File?> profileImage = Rx<File?>(null);
  Rx<File?> coverImage = Rx<File?>(null);

  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  final _api = CardRepository();
  UserPrefrences userPrefrences = UserPrefrences();
  UserModel? user;
  String? token;

  @override
  void onInit() async {
    super.onInit();

    user = await userPrefrences.getUser();
    print("token: ${user?.token}");
    token = user?.token;
  }

  void nextStep() {
    if (currentStep.value < 1) {
      if (formKey.currentState?.validate() ?? false) {
        currentStep.value++;
      }
    } else {
      createEcard();
    }
  }

 

  void backStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  Future<void> pickImage(String imageType) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final newImage = File(pickedFile.path);
      if (imageType == 'profile') {
        profileImage.value = newImage;
      } else if (imageType == 'cover') {
        coverImage.value = newImage;
      }
    }
  }

  Future<void> createEcard() async {
    Map<String, File> files = {
      'profile_image_url': profileImage.value!,
      'cover_image_url': coverImage.value!,
    };
    Map<String, String> data = {
      'business_name': nameController.value.text,
      'business_type': companyController.value.text,
      'about': aboutController.value.text,
    };

    try {
      print("In try block");
      dynamic response = await _api.createCardApi(data, files, token);
      print("Ecard Creation Response: ${response.toString()}");
    } catch (e) {
      print("Error creating ecard: $e");
    }
  }

  @override
  void onClose() {
    nameController.value.dispose();
    companyController.value.dispose();
    aboutController.value.dispose();
    super.onClose();
  }
}
