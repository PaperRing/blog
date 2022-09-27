import 'package:blog/controller/post_controller.dart';
import 'package:blog/controller/user_controller.dart';
import 'package:blog/size.dart';
import 'package:blog/view/pages/post/write_page.dart';
import 'package:blog/view/pages/user/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  UserController userController = Get.put(UserController());
  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    postController.findAll();
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${userController.isLogin}"),
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: postController.posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(DetailPage(index), arguments: "arguments 속성 테스");
              },
              title: Text("${postController.posts[index].title}"),
              leading: Text("${postController.posts[index].id}"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(WritePage());
                  },
                  child: Text('글쓰기', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18))),
              Divider(),
              TextButton(onPressed: () {}, child: Text("회원정보 보기", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18))),
              Divider(),
              TextButton(
                  onPressed: () {
                    // userController.logout();
                    Get.to(LoginPage());
                  },
                  child: Text('로그아웃', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18))),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
