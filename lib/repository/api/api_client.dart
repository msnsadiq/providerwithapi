// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:http/http.dart';
// import 'package:providersapi/repository/api/TrendingModel.dart';
//
// import 'api_exceptionhandling.dart';
//
// class MainHall {
//   static final String pathuri = 'https://api.themoviedb.org/3/';
//   final String keyy = '8417e5718758d632f59c399f948b60ea';
//   Future<Response> FetchFunc(
//       {required String pathitem,
//       required String method,
//       required Object? body}) async {
//     Map<String, String> headerparams = {};
//     Response response;
//     String urii = pathuri + pathitem + "?api_key=$keyy";
//     print(urii);
//     final nullableheaderparams = (headerparams.isEmpty) ? null : headerparams;
//     switch (method) {
//       case "POST":
//         response = await post(Uri.parse(urii),
//             headers: {
//               'content-Type': 'application/json',
//             },
//             body: body);
//         break;
//       case "PUT":
//         response = await put(Uri.parse(urii),
//             headers: {
//               'content-Type': 'application/json',
//             },
//             body: body);
//         break;
//       case "DELETE":
//         response = await delete(Uri.parse(urii), headers: nullableheaderparams);
//         break;
//       case "GET":
//         response = await post(
//           Uri.parse(urii),
//           headers: {},
//           body: body,
//         );
//         break;
//       default:
//         response = await get(Uri.parse(urii), headers: {
//           'Accept': 'application/json',
//           'Content-Type': 'application/json'
//         });
//     }
//
//     print('status of $pathitem =>' + (response.statusCode).toString());
//     print(response.body);
//     if (response.statusCode >= 400) {
//       log(pathitem +
//           ' : ' +
//           response.statusCode.toString() +
//           ' : ' +
//           response.body);
//
//       throw ApiException(
//           message: _decodeBodyBytes(response), statusCode: response.statusCode);
//     }
//     return response;
//   }
//
//   String _decodeBodyBytes(Response response) {
//     var contentType = response.headers['content-type'];
//     if (contentType != null && contentType.contains("application/json")) {
//       return json.decode(response.body)['message'];
//     } else {
//       return response.body;
//     }
//   }
// }
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
//import 'package:provider_ex/repository/api/api_exception.dart';

//import 'api_exception.dart';
import 'api_exceptionhandling.dart';

class MainHall {
  static final String pathuri = 'https://api.themoviedb.org/3/';
  String keyy = "55c72b3a0898da6b37311cf0603659e2";

  Future<Response> FetchFunc(
      {required String pathitem,
      required String method,
      required Object? body}) async {
    Map<String, String> headerParams = {};
    Response response;

    String url = pathuri + pathitem + '?api_key=$keyy';
    print(url);

    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: nullableHeaderParams);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    }

    print('status of $pathitem =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(pathitem +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
