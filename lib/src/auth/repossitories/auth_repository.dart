import 'package:swisecard/core/appurl/app_url.dart';
import 'package:swisecard/data/Network/network_api_services.dart';

class AuthRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> LoginApi() async {
    dynamic responce = await _apiServices.getApi(AppUrl.User);
    return responce;
  }
}
