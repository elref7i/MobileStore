import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/auth/forget/controller/cubit/OTP_Controler.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final OTPController otpController = OTPController();

  void onPressedConfirm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'otp');
    } else {
      debugPrint('invalid input');
    }
  }

  void onPressedReset(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'login');
    } else {
      debugPrint('invalid input');
    }
  }

  void onPressedOTP(BuildContext context) {
    if (formKey.currentState!.validate()) {
      String? validationResult = otpController.verifyOTP();
      log(validationResult ?? "success");
      if (validationResult == null) {
        Navigator.pushNamed(context, 'forgetpassword');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(validationResult),
          ),
        );
      }
    } else {
      debugPrint('Invalid input');
    }
  }
}
