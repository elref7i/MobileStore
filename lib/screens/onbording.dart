import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/auth/onboarding/controller/cubit/onboarding_cubit.dart';
import 'package:mobile_app/auth/onboarding/view/components/onboarding_buttons.dart';
import 'package:mobile_app/auth/onboarding/view/components/onboarding_component.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingCubit>(
        create: (context) => OnboardingCubit(),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            OnboardingCubit controller = context.read<OnboardingCubit>();
            return Scaffold(
              body: OnBoardingBody(
                controller: controller,
              ),
              bottomNavigationBar: OnBoardingButton(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
