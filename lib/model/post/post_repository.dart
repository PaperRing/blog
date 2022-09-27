import 'package:blog/controller/dto/CMRespDto.dart';
import 'package:blog/model/post/post.dart';
import 'package:blog/model/post/post_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    print(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[];
    }
  }
}
