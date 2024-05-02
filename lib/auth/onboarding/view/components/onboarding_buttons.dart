import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/auth/onboarding/controller/cubit/onboarding_cubit.dart';

class OnBoardingButton extends StatelessWidget {
  OnBoardingButton({super.key, required this.controller});
  OnboardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>.value(
      value: controller,
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          OnboardingCubit controller = context.read<OnboardingCubit>();

          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.onSkip(context);
                    },
                    child: Text("Skip")),
                TextButton(onPressed: controller.onNext, child: Text("Next"))
              ],
            ),
          );
        },
      ),
    );
  }
}
