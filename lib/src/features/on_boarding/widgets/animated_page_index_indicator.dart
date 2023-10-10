import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/styles/taal_styles.dart';

class AnimatedPageIndexIndicator extends StatelessWidget {
  const AnimatedPageIndexIndicator({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: index,
      count: 3,
      effect: const WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          spacing: 4,
          radius: 4,
          activeDotColor: AppColors.primary),
    );
  }
}
