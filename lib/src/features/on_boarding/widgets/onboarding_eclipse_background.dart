import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/styles/colors.dart';

import 'eclipse_widget.dart';

class OnboardingEclipseBackground extends StatelessWidget {
  const OnboardingEclipseBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Spacer(),
        EclipseWidget(
          width: 350,
          borderColor: AppColors.eclipseColor,
          isRightCircular: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Transform.scale(
                scale: 1 / 3, child: SvgPicture.asset(Assets.taalLogo)),
          ),
        ),
        const Spacer(flex: 2),
        const Row(
          children: [
            EclipseWidget(
                isRightCircular: true,
                borderColor: AppColors.eclipseColor,
                width: 40),
            Spacer(),
            EclipseWidget(
              width: 250,
              borderColor: AppColors.eclipseColor,
              isRightCircular: false,
            ),
          ],
        ),
        const Spacer(),
        const Row(
          children: <Widget>[
            EclipseWidget(
                isRightCircular: true,
                borderColor: AppColors.eclipseColorLight,
                width: 80),
            Spacer(),
            EclipseWidget(
              width: 150,
              borderColor: AppColors.eclipseColorLight,
              isRightCircular: false,
            ),
          ],
        ),
      ],
    );
  }
}
