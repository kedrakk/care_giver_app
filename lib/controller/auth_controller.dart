import 'package:care_giver/repo/auth_repo.dart';
import 'package:get/get.dart';

import '../data/user.dart';

class AuthController extends GetxController {
  final IAuthRepo _repo;
  AuthController(this._repo);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<User> login(
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
}
