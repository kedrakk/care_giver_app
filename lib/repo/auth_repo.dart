import 'package:care_giver/helper/exception_helper.dart';
import 'package:care_giver/network/rest_client.dart';
import 'package:dio/dio.dart';

import '../data/user.dart';

abstract class IAuthRepo {
  Future<String> login(
    String username,
    String password,
  );
  Future<String> register(
    String username,
    String password,
    String contact,
  );
}

class AuthRepo implements IAuthRepo {
  final RestClient _client;
  AuthRepo(this._client);

  @override
  Future<String> login(String username, String password) async {
    try {
      final response = await _client.login(username, password);
      User user = User.fromJson(response.data);
      return user.username;
    } catch (e) {
      return catchException(e as DioError);
    }
  }

  @override
  Future<String> register(
    String username,
    String password,
    String contact,
  ) async {
    try {
      final response = await _client.register(username, password, contact);
      User user = User.fromJson(response.data);
      return user.username;
    } catch (e) {
      return catchException(e as DioError);
    }
  }
}
