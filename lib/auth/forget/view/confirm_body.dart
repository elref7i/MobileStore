import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/auth/forget/controller/cubit/forget_cubit.dart';
import 'package:mobile_app/utils/colors/custom_button.dart';
import 'package:mobile_app/utils/colors/custome_text_field.dart';

class ConfirmBody extends StatelessWidget {
  const ConfirmBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          ForgetCubit controller = context.read<ForgetCubit>();
          return Container(
            decoration: const BoxDecoration(),
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
                  Custom_textfield(
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    namebutton: 'Confirm',
                    onTap: () => controller.onPressedConfirm(context),
                  ),
                  const SizedBox(
                    height: 30,
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
                  const Spacer(
                    flex: 1,
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
