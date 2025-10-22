import 'package:flutter/material.dart';
import 'package:jejom/modules/onboarding/dietary_preference.dart';
import 'package:jejom/modules/onboarding/landing.dart';
import 'package:jejom/modules/onboarding/onboarding_success.dart';
import 'package:jejom/modules/onboarding/personal_interest.dart';
import 'package:jejom/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';
// import 'package:widget_circular_animator/widget_circular_animator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);

    return Scaffold(
      body: PageView(
        controller: onboardingProvider.mainPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Landing(),
          PersonalInterest(),
          DietaryPreferences(),
          OnboardingSuccess(),
        ],
      ),
    );
  }
}
