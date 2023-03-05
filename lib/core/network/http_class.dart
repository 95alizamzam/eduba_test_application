import 'dart:convert';

import 'package:eduba_test_app/core/network/network_exceptions_class.dart';
import 'package:eduba_test_app/core/service_locator/sl.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HttpClass {
  final String baseUrl = 'https://karrarjasim.github.io/mock_videos_api';

  Future<dynamic> get({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    final bool isConnected =
        await sl<CheckInternetClass>().checkInternetStatus();

    if (isConnected) {
      try {
        final http.Response response = await http.get(
          Uri.parse(baseUrl + endPoint),
          headers: headers ?? {},
        );
        return _handleResponse(response);
      } on AppException {
        rethrow;
      }
    } else {
      throw NoInternetExcption();
    }
  }
}

dynamic _handleResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      final parsedData = json.decode(response.body);
      return parsedData;

    case 400:
      throw BadRequestException();

    case 401:
      throw UnAuthorizedException();

    case 404:
      throw NotFoundException();

    case 409:
      throw ConflictException();

    case 500:
      throw ServerException();

    default:
  }
}

class CheckInternetClass {
  Future<bool> checkInternetStatus() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
