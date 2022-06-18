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

  Future<String> register(
    String username,
    String password,
    String contact,
  ) async {
    _isLoading = true;
    try {
      final response = await _repo.register(
        username,
        password,
        contact,
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
