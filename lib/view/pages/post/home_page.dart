import 'package:blog/pages/post/detail_page.dart';
import 'package:blog/pages/post/write_page.dart';
import 'package:blog/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index), arguments: "arguments 속성 테스");
            },
            title: Text("제목 1 "),
            leading: Text("1"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
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
              TextButton(onPressed: () {}, child: Text('로그아웃', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18))),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
