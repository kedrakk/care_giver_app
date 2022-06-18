import 'package:care_giver/helper/exception_helper.dart';
import 'package:care_giver/repo/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final IAuthRepo _repo;
  AuthController(this._repo);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<String> login(
    String username,
    String password,
  ) async {
    _isLoading = true;
    try {
      final response = await _repo.login(
        username,
        password,
      );
      return response;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<String> getUser() async {
    try {
      var username = await _repo.getData();
      if (username.isNotEmpty) {
        return username;
      }
      throw HttpException("User has not logged in");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _repo.logout();
    } catch (e) {
      rethrow;
    }
  }
}
