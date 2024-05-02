import 'dart:developer';

import 'package:flutter/material.dart';

TextEditingController pinCodecontroller = TextEditingController();

class OTPController {
  final String validHardCodedOTP = '111111';

  String? verifyOTP() {
    log(pinCodecontroller.text);
    if (pinCodecontroller.text.compareTo(validHardCodedOTP) == 0) {
      return null;
    } else if (pinCodecontroller.text.isEmpty) {
      return "Please enter the received code!";
    } else {
      return "Invalid code: ${pinCodecontroller.text}";
    }
  }
}
