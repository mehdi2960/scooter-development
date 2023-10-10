import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';

import '/src/constants/assets.dart';
import '/src/constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/onboarding_item.dart';
import '../provider/on_boarding_screen_provider.dart';
import 'animated_page_index_indicator.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingScreenProvider>(
      builder: (BuildContext context, OnboardingScreenProvider value,
          Widget? child) {
        return Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const Spacer(),
                Flexible(
                  flex: 15,
                  child: PageView(
                    controller: value.pageController,
                    onPageChanged: value.onPageChanged,
                    children: const <Widget>[
                      OnboardingItem(
                        isSvg: false,
                        image: Assets.onboardingScooter1,
                        title: Strings.onboardingTilte1,
                        description: Strings.onboardingSubTilte1,
                      ),
                      OnboardingItem(
                        isSvg: false,
                        image: Assets.onBoardingHand,
                        title: Strings.onboardingTilte2,
                        description: Strings.onboardingSubTilte2,
                      ),
                      OnboardingItem(
                        isSvg: false,
                        image: Assets.onboardingScooter2,
                        title: Strings.onboardingTilte3,
                        description: Strings.onboardingSubTilte3,
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.s),
                    child: TaalFilledButtonNew(
                      title: Strings.loginOrSignUp,
                      width: double.infinity,
                      onPressed: value.goToLoginScreen,
                      isPrimary: false,
                    )),
                Spaces.verticalSpaceSemiMedium
              ],
            ),
            Positioned(
              bottom: 100,
              right: 28,
              child: AnimatedPageIndexIndicator(
                index: value.currentIndex,
              ),
            )
          ],
        );
      },
    );
  }
}
