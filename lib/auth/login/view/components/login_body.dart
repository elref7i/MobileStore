import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core/utils/Validation.dart';
import 'package:mobile_app/auth/login/controller/cubit/login_cubit.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custome_text_field.dart';
import 'package:mobile_app/widgets/my_text_field.dart';
//test
  
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          LoginCubit controller = context.read<LoginCubit>();
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Column(children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 70,
                    width: 70,
                  ),
                  const Text(
                    'Mobile Store',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 61, 53, 53),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 61, 53, 53),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Don\'t  have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const Text('   '),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 98, 170, 241),
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    controller: controller.EmailController,
                    hintText: "Email",
                    prefixIcon: const Icon(CupertinoIcons.person,
                        color: Colors.grey, size: 25),
                    validatinMethod: Validation().validateEmail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPass(
                    hintText: 'Password',
                    showConfirmation: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('confirm');
                        },
                        child: const Text(
                          'Forget PassWord ?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    namebutton: 'Login',
                    onTap: () => controller.onPressedLogin(context),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
