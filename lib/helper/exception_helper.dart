import 'package:dio/dio.dart';

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}

catchException(DioError error) {
  if (error.response != null) {
    var errorMessage = error.response!.data['message'];
    switch (error.response!.statusCode) {
      case 400:
        throw HttpException(errorMessage);
      case 401:
        throw HttpException(errorMessage);
      case 403:
        throw HttpException(errorMessage);
      case 404:
        throw HttpException(errorMessage);
      case 500:
        throw HttpException("Server Error");
      default:
        throw HttpException(errorMessage);
    }
  } else {
    throw HttpException(error.toString());
  }
}
