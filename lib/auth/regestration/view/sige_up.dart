import 'package:flutter/material.dart';
import 'package:mobile_app/screens/Login_Page.dart';
import 'package:mobile_app/utils/colors/custome_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Spacer(
            flex: 1,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 100,
            width: 100,
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
                    MaterialPageRoute(builder: (context) => const Login()),
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
          const Spacer(
            flex: 1,
          ),
          CustomNameValidation(
            hintText: "Name:",
          ),
          const SizedBox(
            height: 15,
          ),
          Custom_textfield(
            hintText: "Email:",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomPass(
            hintText: 'Password:',
          ),
          const Spacer(
            flex: 1,
          ),
          // const CustomButton(
          //   namebutton: 'Sign up',
          //   pageName: "login",
          // ),
          const Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
