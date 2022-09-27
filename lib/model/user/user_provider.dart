import 'package:get/get.dart';

//캐치
// const host = 'http://172.30.1.60:8080';
//집
// const host = 'http://192.168.0.219:8080';
//설대입구 스벅
const host = 'http://172.30.32.35:8080';

class UserProvider extends GetConnect {
  Future<Response> login(Map data) => post("$host/login", data);
}
