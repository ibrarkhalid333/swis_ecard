import 'package:swisecard/core/appurl/app_url.dart';
import 'package:swisecard/data/Network/network_api_services.dart';

class AuthRepository {
  final _apiServices = NetworkApiServices();
  // Future<dynamic> LoginApi() async {
  //   dynamic responce = await _apiServices.getApi(AppUrl.User);
  //   return responce;
  // }
  Future<dynamic> LoginApi(var data) async {
    print(AppUrl.login);
    dynamic responce = await _apiServices.postApi(data, AppUrl.login);
    print(responce);
    return responce;
  }

  Future<dynamic> registerApi(var data) async {
    print(AppUrl.register);
    dynamic responce = await _apiServices.postApi(data, AppUrl.register);
    print(responce);
    return responce;
  }
}
