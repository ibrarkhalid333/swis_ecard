import 'package:http/http.dart' as http;
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  // Map<String, dynamic> tokenMap = {"token": "some_token_value"};
  // dynamic responseJson;
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
      final response = await http.post(Uri.parse(url), body: data);
      print("response is $response");
      return response;
    } catch (err) {
      return err;
    }
  }
}

//   Future<dynamic> postApi(var data, String url, {String? token}) async {
//     try {
//       if (token == null && tokenMap.containsKey('token')) {
//         token = tokenMap['token'];
//       }
//       final response = await http
//           .post(
//             Uri.parse(url),
//             body: jsonEncode(data),
//             headers: {
//               'Content-Type': 'application/json',
//               if (token != null) 'Authorization': 'Bearer $token',
//             },
//           )
//           .timeout(Duration(seconds: 20));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw InternetExceptions('');
//     } on RequestTimeout {
//       throw RequestTimeout('this is request timeout');
//     }
//     return responseJson;
//   }

//   dynamic returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         responseJson = jsonDecode(response.body);
//         return responseJson;

//       case 400:
//         responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 401:
//         responseJson = jsonDecode(response.body);
//         return responseJson;

//       default:
//         throw FetchDataException(
//           'Error' +
//               response.statusCode.toString() +
//               'occured while communicating with server',
//         );
//     }
//   }
// }
