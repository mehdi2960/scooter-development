import 'package:flutter/material.dart';

import '../../../constants/styles/taal_styles.dart';
import '../../on_boarding/widgets/eclipse_widget.dart';

class SplashScreenEclipseBackground extends StatelessWidget {
  const SplashScreenEclipseBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.backgroundColor),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              EclipseWidget(
                  isRightCircular: true,
                  borderColor: AppColors.eclipseBlue,
                  width: 180),
              Spacer(),
              EclipseWidget(
                  isRightCircular: false,
                  borderColor: AppColors.eclipseBlue,
                  width: 90),
            ],
          ),
          Row(
            children: [
              EclipseWidget(
                  isRightCircular: true,
                  borderColor: AppColors.eclipseBlueLight,
                  width: 200),
              Spacer(),
              EclipseWidget(
                  isRightCircular: false,
                  borderColor: AppColors.eclipseBlueLight,
                  width: 70),
            ],
          ),
          EclipseWidget(
              isRightCircular: true,
              borderColor: AppColors.eclipseBlue,
              width: 300),
          EclipseWidget(
              isRightCircular: false,
              borderColor: AppColors.eclipseBlueLight,
              width: double.infinity),
          Row(
            children: [
              EclipseWidget(
                  isRightCircular: true,
                  borderColor: AppColors.eclipseBlue,
                  width: 110),
              Spacer(),
              EclipseWidget(
                  isRightCircular: false,
                  borderColor: AppColors.eclipseBlue,
                  width: 180),
            ],
          ),
        ],
      ),
    );
  }
}
