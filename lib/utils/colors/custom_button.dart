import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.namebutton, required this.onTap});
  final String namebutton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 5, 66, 106),
            borderRadius: BorderRadius.circular(7)),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            namebutton,
            style: TextStyle(backgroundColor: Color.fromARGB(66, 68, 67, 67)),
          ),
        ),
      ),
    );
  }
}
