import 'package:blog/controller/user_controller.dart';
import 'package:blog/util/validator.dart';
import 'package:blog/view/pages/post/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/custom_elevated_buttom.dart';
import '../../component/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController userController = UserController();

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              child: Text("로그인", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Form _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Username",
            funValidator: validateUsername(),
            controller: _username,
          ),
          CustomTextFormField(
            hint: "Password",
            funValidator: validatePassword(),
            controller: _password,
          ),
          CustomElevatedButton(
            text: 'Sign in',
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                String token = await userController.login(_username.text, _password.text);
                if (token != "-1") {
                  Get.to(() => HomePage());
                } else {
                  Get.snackbar("로그인실패", "아이디와 비밀번호가 맞지 않습니다.");
                }
              }
            },
          ),
          TextButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text("회원가입하기"))
        ],
      ),
    );
  }
}
