import 'package:flutter/material.dart';
import 'package:mobile_app/auth/forget/view/reset_pass_body.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[300],
      body: const ResetPass(),
    );
  }
}
