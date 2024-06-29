import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core/utils/context_extention.dart';
import 'package:mobile_app/auth/forget/controller/cubit/forget_cubit.dart';
import 'package:mobile_app/utils/colors/custom_button.dart';
import 'package:mobile_app/auth/forget/controller/cubit/OTP_Controler.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OPTScreen extends StatelessWidget {
  OPTScreen({super.key});

  final OTPController otpController = OTPController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetCubit(),
        child: BlocBuilder<ForgetCubit, ForgetState>(
          builder: (context, state) {
            ForgetCubit controller = context.read<ForgetCubit>();
            return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'CODE',
                        style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "VERIFICATION".toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Enter the Verification code sent at Email",
                        textAlign: TextAlign.center,
                      ),
                      // Text(MediaQuery.of(context).size.width.toString()),
                      const SizedBox(
                        height: 40,
                      ),
                      PinCodeTextField(
                        mainAxisAlignment: MainAxisAlignment.center,
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        obscuringWidget: const Icon(
                          Icons.lock,
                          size: 24,
                          // You can customize the color if needed
                          color: Colors.grey,
                        ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "Type the sent code Here!";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: context.width / 8,
                          fieldWidth: context.width / 8,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Color.fromARGB(255, 141, 145, 148),
                          inactiveColor: Color.fromARGB(255, 1, 33, 79),
                          fieldOuterPadding:
                              EdgeInsets.only(right: context.width / 48),
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: pinCodecontroller,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },

                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      ),

                      const SizedBox(
                        height: 80,
                      ),
                      CustomButton(
                        namebutton: 'Next',
                        onTap: () {
                          controller.onPressedOTP(context);
                        },
                      ),

                      ///send a google meet
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
