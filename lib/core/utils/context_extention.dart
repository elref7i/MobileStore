import 'package:flutter/material.dart';
import 'package:mobile_app/core/cubit/parent_cubit.dart';

extension MyContextExtention on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension MyTheme on BuildContext {
  ThemeData get getTheme => Theme.of(this);
}

extension MyLocalization on String {
  String get tr => ParentCubit.instance.local[this] ?? this.toUpperCase();
}
