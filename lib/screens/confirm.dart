import 'package:flutter/material.dart';
import 'package:mobile_app/auth/forget/view/confirm_body.dart';

//Login ...xc
class Confirm extends StatelessWidget {
  const Confirm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.grey[300],
      body: ConfirmBody(),
    );
  }
}
