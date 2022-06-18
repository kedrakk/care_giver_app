import 'package:care_giver/helper/exception_helper.dart';
import 'package:care_giver/network/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/user.dart';

abstract class IAuthRepo {
  Future<String> login(
    String username,
    String password,
  );
  Future<User> register();
  Future<void> logout();
  Future<String> getData();
  Future<void> storeData(String username, String token);
}

class AuthRepo implements IAuthRepo {
  final RestClient _client;
  AuthRepo(this._client);

  @override
  Future<String> login(String username, String password) async {
    try {
      final response = await _client.login(username, password);
      User user = User.fromJson(response.data);
      await storeData(user.username, user.token);
      return user.username;
    } catch (e) {
      return catchException(e as DioError);
    }
  }

  @override
  Future<void> logout() async {
    try {
      final token = await getToken();
      await _client.logout(token);
      await storeData("", "");
    } catch (e) {
      throw catchException(e as DioError);
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

  @override
  Future<void> storeData(String username, String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('username', username);
  }

  @override
  Future<String> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final username = prefs.getString('username') ?? "";
    return token!.isEmpty || username.isEmpty ? "" : username;
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? "";
    return "Bearer $token";
  }
}
