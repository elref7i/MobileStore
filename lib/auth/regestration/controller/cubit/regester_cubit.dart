import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit() : super(RegesterInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FormKey = GlobalKey<FormState>();
  void onPressedSignUp(BuildContext context) {
    if (FormKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'login');
    } else {
      log('invalid input');
    }
  }
}
