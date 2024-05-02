import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/auth/forget/controller/cubit/forget_cubit.dart';
import 'package:mobile_app/auth/forget/controller/cubit/forget_cubit.dart';
import 'package:mobile_app/auth/forget/controller/cubit/forget_cubit.dart';
import 'package:mobile_app/auth/forget/view/confirm_body.dart';
import 'package:mobile_app/screens/Sign_up.dart';
import 'package:mobile_app/screens/reset_pass.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custome_text_field.dart';

//Login ...xc
class Confirm extends StatelessWidget {
  const Confirm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ConfirmBody(),
    );
  }
}
