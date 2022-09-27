import 'package:blog/util/validator.dart';
import 'package:blog/view/pages/user/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/custom_elevated_buttom.dart';
import '../../component/custom_text_form_field.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
              child: Text("회원가입", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Form _joinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(hint: "Username", funValidator: validateUsername()),
          CustomTextFormField(hint: "Password", funValidator: validatePassword()),
          CustomTextFormField(hint: "Email", funValidator: validateEmail()),
          CustomElevatedButton(
            text: 'Join Us',
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(LoginPage());
              }
            },
          ),
          TextButton(
              onPressed: () {
                Get.to(JoinPage());
              },
              child: Text("로그인"))
        ],
      ),
    );
  }
}
