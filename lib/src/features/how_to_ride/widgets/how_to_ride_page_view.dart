import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/how_to_ride/provider/how_to_ride_screen_provider.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/src/constants/assets.dart';
import '/src/constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/onboarding_item.dart';

class HowtoRideScreenPageView extends StatelessWidget {
  const HowtoRideScreenPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final HowToRideScreenProvider watch =
        context.watch<HowToRideScreenProvider>();
    final HowToRideScreenProvider read =
        context.read<HowToRideScreenProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: TaalNewAppBar(
          title: Strings.securePointsTitle,
          iconWidgetLeft: Padding(
            padding: const EdgeInsets.only(top: Sizes.ss),
            child: Text(
              Strings.ignorText,
              textAlign: TextAlign.end,
              style: header2TextStyle,
            ),
          ),
          arrowOnPress: () => context.pop(),
          forwardOnPress: () => read.goToPreviousPage(),
        ),
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 15,
                child: PageView(
                  controller: watch.pageController,
                  onPageChanged: read.onPageChanged,
                  children: const <Widget>[
                    OnboardingItem(
                      isSvg: false,
                      image: Assets.howToRide1,
                      title: Strings.howTorideTitle1,
                      description: Strings.howToridesubTitle1,
                    ),
                    OnboardingItem(
                      isSvg: false,
                      image: Assets.howToRide2,
                      title: Strings.howTorideTitle2,
                      description: Strings.howToridesubTitle2,
                    ),
                    OnboardingItem(
                      isSvg: false,
                      image: Assets.howToRide3,
                      title: Strings.howTorideTitle3,
                      description: Strings.howToridesubTitle3,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.s),
                  child: IconButton(
                    onPressed: read.goToNextPage,
                    icon: const SvgBox(
                      assetName: Assets.nextButton,
                    ),
                  ),
                ),
              ),
              Spaces.verticalSpaceTiny
            ],
          ),
          Positioned(
            bottom: 35,
            left: MediaQuery.of(context).size.width / 9.4,
            child: AnimatedSmoothIndicator(
              activeIndex: watch.currentIndex,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 4,
                radius: 4,
                activeDotColor: AppColors.primary,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
