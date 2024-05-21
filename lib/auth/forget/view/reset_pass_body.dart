import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/auth/forget/controller/cubit/forget_cubit.dart';
import 'package:mobile_app/utils/colors/custom_button.dart';
import 'package:mobile_app/utils/colors/custome_text_field.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          ForgetCubit controller = context.read<ForgetCubit>();
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
                        'Reset',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 61, 53, 53),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomPass(
                    hintText: 'New Password',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    namebutton: 'Reset',
                    onTap: () => controller.onPressedConfirm(context),
                  ),
                  const Spacer(
                    flex: 2,
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
