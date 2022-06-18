import 'package:care_giver/helper/exception_helper.dart';
import 'package:care_giver/network/rest_client.dart';
import 'package:dio/dio.dart';

import '../data/user.dart';

abstract class IAuthRepo {
  Future<User> login(
    String username,
    String password,
  );
  Future<User> register();
  Future<void> logout();
}

class AuthRepo implements IAuthRepo {
  final RestClient _client;
  AuthRepo(this._client);

  @override
  Future<User> login(String username, String password) async {
    try {
      final response = await _client.login(username, password);
      User user = User.fromJson(response.data);
      return user;
    } catch (e) {
      return catchException(e as DioError);
    }
  }

  @override
  Future<void> logout() async {
    try {
      final response = await _client.logout();
      return response;
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  @override
  Future<User> register() async {
    try {
      final response = await _client.register();
      return response;
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
