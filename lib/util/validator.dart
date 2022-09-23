import 'package:validators/validators.dart';

Function username_validate() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "유저네임에 한글이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "유저네임의 길이를 초과하였습니다.";
    }
  };
}

Function password_validate() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "패스워드의 한글이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4글자 입니다.";
    } else {
      return null;
    }
  };
}

Function email_validate() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}
