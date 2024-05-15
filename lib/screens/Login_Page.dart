import 'package:flutter/material.dart';
import 'package:mobile_app/auth/login/view/components/login_body.dart';

//Login ...cvvv
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: LoginBody(),
    );
  }
}
