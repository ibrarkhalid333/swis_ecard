import 'package:get/get.dart';
import 'package:swisecard/src/auth/model/user_model.dart';
import 'package:swisecard/src/auth/services/auth_services.dart';

class DashboardController extends GetxController {
  final authServices = AuthServices();

  UserModel? user;
  RxString fullName = "".obs;
  @override
  void onInit() {
    super.onInit();
    print("DashboardController initialized properly");
    print("Stored user: ${authServices.getCurrentUser()?.toJson()}");
    print("Stored fullName: ${authServices.getCurrentUser()?.data?.fullName}");
    user = authServices.getCurrentUser();
    print("Current User in Dashboard: $user");
    print("Full Name: ${user?.data?.fullName}");
    if (user != null) {
      fullName.value = user!.data!.fullName ?? "";
    }
  }
}
