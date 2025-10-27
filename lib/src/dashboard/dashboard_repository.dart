import 'package:swisecard/core/appurl/app_url.dart';
import 'package:swisecard/data/Network/network_api_services.dart';

class DashboardRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> getEcards(String? token) async {
    dynamic response = await _apiServices.getApi(
      AppUrl.getEcards,
      token: token,
    );
    return response;
  }
}
