import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/colors.dart';
import 'package:scooter/src/constants/styles/sizes.dart';

class TaalOutlinedButton extends StatelessWidget {
  const TaalOutlinedButton({
    super.key,
    required this.title,
    this.height = Sizes.xl,
    this.margin = Sizes.s,
    required this.onPressed,
  });
  final String title;
  final double height;
  final double margin;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: AppColors.buttonColorBlue1),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(title,
            style: const TextStyle(color: AppColors.buttonColorBlue1)),
      ),
    );
  }
}
