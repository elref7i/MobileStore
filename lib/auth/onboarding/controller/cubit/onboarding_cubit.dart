import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/auth/onboarding/model/onboarding_model.dart';
import 'package:mobile_app/screens/Login_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  PageController pageController = PageController();

  void onNext() {
    pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  void onSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("onboarding", true);

    Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const Login()));
  }

  List Data = [
    OnboardingModel(
        image: "assets/images/mobilegif.gif",
        title: "Choose Your Product",
        subtitle:
            "Welcorne to a World ot Urnitiess Choices - \nPerfect Product Awaits'",
        color: Color.fromARGB(255, 34, 65, 90)),
    OnboardingModel(
      image: "assets/images/animation_shop.jpeg",
      title: "Select Payment Method",
      subtitle: "For Seamless Transactions",
      color: Color.fromARGB(255, 89, 22, 1),
    ),
    OnboardingModel(
      image: "assets/images/OppoReno.png",
      title: "OppoReno",
      subtitle: "",
      color: Color.fromARGB(255, 48, 20, 119),
    ),
    OnboardingModel(
      image: "assets/images/AirPods-Pro.png",
      title: "Powerbank",
      subtitle: "",
      color: Color.fromARGB(255, 48, 20, 119),
    ),
    OnboardingModel(
      image: "assets/images/Beats.png",
      title: "Beats",
      subtitle: "",
      color: Color.fromARGB(255, 48, 20, 119),
    ),
  ];
}
