import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

import '../../../constants/styles/taal_styles.dart';

class CircularActionButton extends StatelessWidget {
  const CircularActionButton({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onPressed,
  });
  final String icon;
  final bool isActive;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration:
          // isActive
          //     ?
          circularActionButtonDecoration.copyWith(
        color: AppColors.primaryDark,
      ),

      // :
      //  circularActionButtonDecoration.copyWith(color: AppColors.primaryWhite),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgBox(
            assetName: icon,
            color:
                // isActive ?
                AppColors.primaryWhite
            // : AppColors.primary,
            ),
      ),
    );
  }
}
