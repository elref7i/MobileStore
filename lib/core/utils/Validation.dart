import 'package:flutter/services.dart';

class Validation {
  String? validateEmail(String? email) {
    TextInputFormatter emailInputFormatter = FilteringTextInputFormatter.allow(
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'),
    );

    bool emailValidator =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(email!);
    if (email.isEmpty) {
      return "Enter your email";
    } else if (!emailValidator) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validateName(String? name) {
    TextInputFormatter nameInputFormatter = FilteringTextInputFormatter.allow(
      RegExp(r'^[a-zA-Z\s]*$'),
    );

    bool nameValidator =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9A-Z0-9]").hasMatch(name!) &&
            ((name.length) > 8);
    if (name.isEmpty) {
      return "Enter your name";
    } else if (!nameValidator) {
      return "Name must be more than 8 characters";
    }
    return null;
  }

  String? validatePass(String? pass) {
    if (pass!.isEmpty) {
      return "Enter your password";
    } else if (pass.length < 8) {
      return "Your password must be at least 8 characters long";
    }
    return null;
  }
}
