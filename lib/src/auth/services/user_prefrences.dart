import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swisecard/src/auth/model/user_model.dart';

class UserPrefrences {
  String? Token;
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String userJson = jsonEncode(responseModel.toJson());
    sp.setString('user', userJson);
    return true;
  }

  Future<dynamic> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userString = sp.getString('user');
    print("Retrieved user string: $userString");
    if (userString != null) {
      Map<String, dynamic> userMap = jsonDecode(userString);
      return UserModel.fromJson(userMap);
    } else {
      // throw Exception("No user found in preferences");
      return null;
    }
  }

  Future<bool> RemoveUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
