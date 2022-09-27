import 'package:blog/util/validator.dart';
import 'package:blog/view/component/custom_text_form_field.dart';
import 'package:blog/view/pages/post/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/custom_elevated_buttom.dart';
import '../../component/custom_text_area.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(hint: "title", funValidator: validateTitle()),
              CustomTextArea(hint: "content", funValidator: validateContent()),
              CustomElevatedButton(
                text: "등록",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(HomePage());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
