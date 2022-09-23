import 'package:blog/pages/user/login_page.dart';
import 'package:blog/util/validator.dart';
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
          CustomTextFormField(hint: "Username", funValidator: username_validate()),
          CustomTextFormField(hint: "Password", funValidator: password_validate()),
          CustomTextFormField(hint: "Email", funValidator: email_validate()),
          CustomElevatedButton(
            text: 'Join Us',
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(LoginPage());
              }
            },
          ),
        ],
      ),
    );
  }
}
