import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final Alignment alignment;
  final double height;
  final Color background;
  final FontWeight fontWeight;

  CustomText({
    this.text = '',
    this.fontSize = 20,
    this.color,
    this.alignment = Alignment.topLeft,
    this.height = 1.0,
    this.background = Colors.transparent,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      color: background,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
          height: height,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
