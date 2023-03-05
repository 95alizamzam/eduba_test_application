import 'package:eduba_test_app/core/strings/strings.dart';

class AppException implements Exception {
  final String errorMsg;
  AppException({required this.errorMsg});
}

class NoInternetExcption extends AppException {
  NoInternetExcption() : super(errorMsg: noInternet);
}

class BadRequestException extends AppException {
  BadRequestException() : super(errorMsg: badRequest);
}

class ConflictException extends AppException {
  ConflictException() : super(errorMsg: conflict);
}

class ServerException extends AppException {
  ServerException() : super(errorMsg: serverError);
}

class NotFoundException extends AppException {
  NotFoundException() : super(errorMsg: notFound);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException() : super(errorMsg: unAuthorized);
}
