import 'dart:io';

import 'package:swisecard/core/appurl/app_url.dart';
import 'package:swisecard/data/Network/network_api_services.dart';

class CardRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> createCardApi(
    Map<String, String> fields,
    Map<String, File> files,
    String? token,
  ) async {
    print(AppUrl.createEcard);
    dynamic responce = await _apiServices.postApiMultipart(
      AppUrl.createEcard,
      fields: fields,
      files: files,
      token: token,
    );
    return responce;
  }
}
