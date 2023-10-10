import 'package:flutter/material.dart';
import '../../constants/styles/taal_styles.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, this.title, this.isSlected = false});

  final String? title;
  final bool? isSlected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        title!,
        style: cartInfoTextStyle.copyWith(
          color:
              isSlected! ? AppColors.darkGreen : AppColors.unSelctedChipColor,
        ),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color:
              isSlected! ? AppColors.darkGreen : AppColors.unSelctedChipColor,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    );
  }
}
