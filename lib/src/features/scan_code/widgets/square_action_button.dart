import 'package:flutter/material.dart';

import '../../../constants/styles/box_decorations.dart';
import '../../../constants/styles/colors.dart';
import '../../shared_widgets/svg_box.dart';

class SquareActionButton extends StatelessWidget {
  const SquareActionButton(
      {super.key,
      required this.icon,
      required this.isActive,
      required this.onPressed});

  final String icon;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: isActive
          ? squareBoxDecoration.copyWith(
              color: AppColors.primaryDark,
            )
          : circularActionButtonDecoration.copyWith(color: Colors.white),
      child: IconButton(
        onPressed: () {},
        icon: SvgBox(
          assetName: icon,
          color: isActive ? Colors.white : AppColors.primary,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
