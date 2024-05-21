import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/auth/onboarding/controller/cubit/onboarding_cubit.dart';

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({super.key, required this.controller});
  OnboardingCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocProvider<OnboardingCubit>.value(
            value: controller,
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                OnboardingCubit controller = context.read<OnboardingCubit>();
                return PageView(
                    controller: controller.pageController,
                    children: List.generate(controller.Data.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(controller.Data[index].image),
                          Text(
                            textAlign: TextAlign.center,
                            controller.Data[index].title,
                            style: TextStyle(
                              color: controller.Data[index].color,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            controller.Data[index].subtitle,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    }));
              },
            ),
          ),
        )
      ],
    );
  }
}
