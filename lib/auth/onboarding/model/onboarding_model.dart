import 'package:flutter/material.dart';

class OnboardingModel {
  late String image, title, subtitle;
  late Color color;
  OnboardingModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      this.color = Colors.black});
}
