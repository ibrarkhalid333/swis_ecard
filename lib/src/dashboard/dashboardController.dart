import 'package:get/get.dart';
import 'package:swisecard/src/auth/model/user_model.dart';
import 'package:swisecard/src/auth/services/auth_services.dart';
import 'package:swisecard/src/auth/services/user_prefrences.dart';

class DashboardController extends GetxController {
  final authServices = AuthServices();

  UserModel? user;
  RxString fullName = "".obs;

  UserPrefrences userPreferences = UserPrefrences();

  Future<void> getUserData() async {
    user = await userPreferences.getUser();
    print(user!.data);
  }

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    print("DashboardController initialized properly");
    print("Stored user: $user");
    print("Stored fullName: ${user?.data?.fullName}");
    // user = authServices.getCurrentUser();
    //   print("Current User in Dashboard: $user");
    print("Full Name: ${user?.data?.fullName}");
    if (user != null) {
      fullName.value = user!.data!.fullName ?? "";
    }
  }
}
