import 'package:blog/controller/dto/LoginReqDto.dart';
import 'package:blog/model/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    final LoginReqDto loginReqDto = LoginReqDto(username, password);
    Response response = await _userProvider.login(loginReqDto.toJson());

    dynamic headers = response.headers;

    if (headers["authorization"] == null) {
      return "-1";
    } else {
      String token = headers["authorization"];
      return token;
    }
  }
}
