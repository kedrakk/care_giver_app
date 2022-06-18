import 'package:care_giver/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../pages/auth/login.dart';

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
        Get.offAll(() => LoginPage());
        throw HttpException("Unaunthenticated");
      case 403:
        Get.offAll(() => LoginPage());
        throw HttpException("Unaunthenticated");
      case 404:
        throw HttpException("Resource Not Found");
      case 500:
        throw HttpException("Server Error");
      default:
        throw HttpException(errorMessage);
    }
  } else {
    throw HttpException(error.toString());
  }
}

catchUnauthenticated() async {
  await Get.find<AuthRepo>().storeData("", "");
  Get.offAll(() => LoginPage());
  throw HttpException("Unaunthenticated");
}
