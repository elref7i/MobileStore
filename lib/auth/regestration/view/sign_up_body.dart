import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core/utils/Validation.dart';
import 'package:mobile_app/auth/regestration/controller/cubit/regester_cubit.dart';
import 'package:mobile_app/screens/Login_Page.dart';
import 'package:mobile_app/utils/colors/custom_button.dart';
import 'package:mobile_app/utils/colors/custome_text_field.dart';
import 'package:mobile_app/utils/colors/my_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegesterCubit(),
      child: BlocBuilder<RegesterCubit, RegesterState>(
        builder: (context, state) {
          RegesterCubit controller = context.read<RegesterCubit>();
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.FormKey,
                child: Column(
                  children: [
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
                          'Sign up',
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
                          'Already have account?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        const Text('   '),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the next page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: const Text(
                            'Login',
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
                      height: 15,
                    ),
                    MyTextField(
                      controller: controller.nameController,
                      hintText: "Name",
                      prefixIcon: const Icon(CupertinoIcons.person,
                          color: Colors.grey, size: 25),
                      validatinMethod: Validation().validateName,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      controller: controller.emailController,
                      hintText: "Email",
                      prefixIcon: const Icon(CupertinoIcons.person,
                          color: Colors.grey, size: 25),
                      validatinMethod: Validation().validateEmail,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomPass(
                      hintText: 'Password:',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      namebutton: 'Sign Up',
                      onTap: () => controller.onPressedSignUp(context),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
