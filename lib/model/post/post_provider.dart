import 'package:blog/util/jwt.dart';
import 'package:get/get.dart';

//캐치
// const host = 'http://172.30.1.60:8080';
//집
// const host = 'http://192.168.0.219:8080';
//설대입구 스벅
const host = 'http://172.30.32.35:8080';

class PostProvider extends GetConnect {
  Future<Response> findAll() => get("$host/post", headers: {"Authorization": jwtToken ?? ""});
}
