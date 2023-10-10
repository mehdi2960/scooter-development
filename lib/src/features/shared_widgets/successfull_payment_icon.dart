import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/colors.dart';
import 'package:scooter/src/constants/styles/sizes.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import '../../constants/assets.dart';

class SuccessfullPaymentIcon extends StatelessWidget {
  const SuccessfullPaymentIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.ss),
      height: Sizes.xl,
      width: Sizes.xl,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.xl),
          color: AppColors.lightGreen),
      child: const SvgBox(assetName: Assets.success),
    );
  }
}
