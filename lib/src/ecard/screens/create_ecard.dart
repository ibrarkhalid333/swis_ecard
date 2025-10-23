import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swisecard/core/res/style/app_text_styles.dart';
import 'package:swisecard/src/ecard/controllers/ecardController.dart';
import 'package:swisecard/src/widgets/custom_appbar.dart';
import 'package:swisecard/src/widgets/navbar.dart';
import 'package:swisecard/src/widgets/round_button.dart';

class CreateEcard extends StatelessWidget {
  CreateEcard({super.key});
  final controller = Get.put(Ecardcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Create a new Swiss Ecard",
              textAlign: TextAlign.center,
              style: AppTextStyles.mainHeading,
            ),
            SizedBox(height: 40.h),
            Expanded(
              child: Form(
                key: controller.formKey,

                child: Obx(
                  () => Stepper(
                    currentStep: controller.currentStep.value,
                    onStepContinue: controller.nextStep,
                    onStepCancel: controller.backStep,
                    type: StepperType.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    controlsBuilder: (context, details) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundButton(
                          onPress: controller.nextStep,
                          title: controller.currentStep.value == 1
                              ? 'Create Ecard'
                              : 'Next',
                          width: 100.w,
                        ),
                        if (controller.currentStep.value > 0)
                          TextButton(
                            onPressed: controller.backStep,
                            child: const Text("Back"),
                          ),
                      ],
                    ),
                    steps: [
                      Step(
                        title: const Text('Basic Info'),
                        isActive: controller.currentStep.value == 0,
                        state: controller.currentStep.value > 0
                            ? StepState.complete
                            : StepState.indexed,
                        content: Column(
                          children: [
                            TextFormField(
                              controller: controller.nameController.value,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Full Name / Company Name / Business',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                            TextFormField(
                              controller: controller.companyController.value,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Tech Small Business...',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter company name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                            TextFormField(
                              controller: controller.aboutController.value,
                              maxLines: 6,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                    'Write here about yourself or about your company',
                              ),
                              validator: (text) {
                                if (text!.split(RegExp(r'\s+')).length > 50) {
                                  return 'Reached Maximum words';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                      Step(
                        title: const Text("Upload Images"),
                        isActive: controller.currentStep.value >= 1,
                        content: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.pickImage('cover');
                              },
                              child: Container(
                                height: 130.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                ),
                                child: controller.coverImage.value != null
                                    ? Image.file(controller.coverImage.value!)
                                    : Center(child: Text("Upload Cover Image")),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            InkWell(
                              onTap: () {
                                controller.pickImage('profile');
                              },
                              child: Container(
                                height: 130.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                ),
                                child: controller.profileImage.value != null
                                    ? Image.file(controller.profileImage.value!)
                                    : Center(
                                        child: Text("Upload Profile Image"),
                                      ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
