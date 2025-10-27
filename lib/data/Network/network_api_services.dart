import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:swisecard/data/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  
  dynamic responseJson;
  @override
  Future<dynamic> getApi(String url, {String? token}) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {
        //   'Content-Type': 'application/json',
        //   if (token != null) 'Authorization': 'Bearer $token',
        // },
        // ).timeout(Duration(seconds: 20));
        // responseJson = returnResponse(response);
      );
      // } on SocketException {
      //   throw InternetExceptions('');
      // } on RequestTimeout {
      //   throw RequestTimeout('');
      // }

      // return responseJson;
      return response;
    } catch (err) {
      return err;
      //  print(err);
    }
  }

  Future<dynamic> postApi(var data, String url) async {
    try {
      print("$data $url");
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 20));
      print("response is $response");
      print("All response headers: ${response.headers}");

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    } on RequestTimeout {
      throw RequestTimeout('this is request timeout');
    }
    return responseJson;
  }

  Future<dynamic> postApiMultipart(
    String url, {
    var fields,
    var files,
    String? token,
  }) async {
    try {
      print(" data sent to api: $fields $files $url $token");
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add fields to the request
      if (fields != null) {
        request.fields.addAll(fields);
      }

      // Add files to the request
      if (files != null) {
        files.forEach((key, file) async {
          request.files.add(await http.MultipartFile.fromPath(key, file.path));
        });
      }

      // Add headers if token is provided
      if (token != null) {
        request.headers['auth-token'] = '$token';
      }

      var streamedResponse = await request.send().timeout(
        Duration(seconds: 20),
      );
      var response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    } on RequestTimeout {
      throw RequestTimeout('this is request timeout');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final decodedBody = jsonDecode(response.body);
        responseJson = {"body": decodedBody, "headers": response.headers};
        return responseJson;

      case 201:
        final decodedBody = jsonDecode(response.body);
        responseJson = {"body": decodedBody, "headers": response.headers};
        return responseJson;
      case 400:
        responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
          'Error' +
              response.statusCode.toString() +
              'occured while communicating with server',
        );
    }
  }
}

// Future<dynamic> postApi(var data, String url, {String? token}) async {
//   try {
//     if (token == null && tokenMap.containsKey('token')) {
//       token = tokenMap['token'];
//     }
//     final response = await http
//         .post(
//           Uri.parse(url),
//           body: jsonEncode(data),
//           headers: {
//             'Content-Type': 'application/json',
//             if (token != null) 'Authorization': 'Bearer $token',
//           },
//         )
//         .timeout(Duration(seconds: 20));
//     responseJson = returnResponse(response);
//   } on SocketException {
//     throw InternetExceptions('');
//   } on RequestTimeout {
//     throw RequestTimeout('this is request timeout');
//   }
//   return responseJson;
// }
