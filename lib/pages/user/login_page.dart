import 'package:blog/pages/post/home_page.dart';
import 'package:blog/util/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/custom_elevated_buttom.dart';
import '../../component/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
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
          CustomTextFormField(hint: "Username", funValidator: username_validate()),
          CustomTextFormField(hint: "Password", funValidator: password_validate()),
          CustomElevatedButton(
            text: 'Sign in',
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(HomePage());
              }
            },
          ),
        ],
      ),
    );
  }
}
