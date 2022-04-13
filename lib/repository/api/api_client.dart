

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
      required Object? body, required bool urldiffrent}) async {
    Map<String, String> headerParams = {};
    Response response;

    String url = urldiffrent ? pathuri + pathitem + '?api_key=$keyy': pathuri+'search/movie?api_key=55c72b3a0898da6b37311cf0603659e2&language=en-US&query=$pathitem&page=1&include_adult=false';
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
