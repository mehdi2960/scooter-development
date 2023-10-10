import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/constants/styles/colors.dart';

import '../provider/on_boarding_screen_provider.dart';
import '../widgets/onboarding_eclipse_background.dart';
import '../widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardingScreenProvider>(
      create: (_) => OnboardingScreenProvider(context),
      child: const _OnboardingScreen(),
    );
  }
}

class _OnboardingScreen extends StatelessWidget {
  const _OnboardingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.gradientBlue1,
                AppColors.gradientBlue2,
                AppColors.gradientBlue3,
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3 * 2,
                  child: const OnboardingEclipseBackground(),
                ),
              ),
              const OnboardingPageView(),
            ],
          )),
    );
  }
}
