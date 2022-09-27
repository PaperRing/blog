import 'package:blog/model/post/post_repository.dart';
import 'package:get/get.dart';

import '../model/post/post.dart';

class PostController extends GetxController {
  PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }
}
