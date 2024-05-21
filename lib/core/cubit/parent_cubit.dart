import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  static final ParentCubit instance = ParentCubit();
  ThemeMode themeMode = ThemeMode.light;
  String lang = "en";
  ParentCubit() : super(ParentInitial()) {
    loadLanguage();
  }
  Map<String, dynamic> local = {};

  Future<void> loadLanguage() async {
    String s = await rootBundle.loadString("assets/lang/$lang.json");
    local = json.decode(s);
    emit(ParentInitial());
  }

  void chageMode() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    emit(ParentInitial());
  }

  void changeLang() {
    if (lang == 'ar') {
      lang = "en";
    } else {
      lang = "ar";
    }
    loadLanguage();
    emit(ParentInitial());
  }
}
