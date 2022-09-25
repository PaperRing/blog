import 'package:blog/component/custom_elevated_buttom.dart';
import 'package:blog/component/custom_text_area.dart';
import 'package:blog/component/custom_text_form_field.dart';
import 'package:blog/util/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
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
              CustomTextFormField(hint: "title", funValidator: validateTitle(), value: "title" * 3),
              CustomTextArea(hint: "content", funValidator: validateContent(), value: "content~" * 20),
              CustomElevatedButton(
                text: "수정",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back();
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
