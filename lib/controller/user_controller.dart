import 'package:blog/model/user/user_repository.dart';
import 'package:blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs;

  void logout() {
    isLogin.value = false;
    jwtToken = null;
  }

  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);

    if (token != "-1") {
      isLogin.value = true;
      jwtToken = token;
      print(token);
      print(isLogin.value);
    }

    return token;
  }
}
