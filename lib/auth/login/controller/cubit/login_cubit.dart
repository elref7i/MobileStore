import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final EmailController = TextEditingController();
  final PassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void onPressedLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, 'dashboard', (route) => false);
    } else {
      log("Invalid Input");
    }
  }
}
