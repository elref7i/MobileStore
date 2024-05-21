import 'package:flutter/material.dart';
import 'package:mobile_app/auth/forget/controller/cubit/OTP.dart';

//Login ...xc
class OTP extends StatelessWidget {
  const OTP({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[300],
      body: OPTScreen(),
    );
  }
}
