import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class TaalFilledButtonNew extends StatelessWidget {
  const TaalFilledButtonNew({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.isDeactivated = false,
    this.isPrimary = true,
    this.height = Sizes.xl,
    this.width = 200,
    this.margin = Sizes.s,
  });
  final String title;
  final String? icon;
  final bool isLoading;
  final bool isDeactivated;
  final bool isPrimary;
  final double height;
  final double width;
  final double margin;
  final VoidCallback onPressed;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        border: Border.all(color: !isPrimary ? AppColors.primary : AppColors.backgroundColor),
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: !isDeactivated
              ? isPrimary
                  ? <Color>[const Color(0xFF004FFE), const Color(0xFF0047E2)]
                  : <Color>[Colors.white, Colors.white]
              : [
                  Colors.grey,
                  Colors.grey,
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: isDeactivated ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: isLoading
            ? const SizedBox.square(
                dimension: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgBox(assetName: icon ?? ''),
                      Spaces.horizontalSpaceTiny,
                      Text(
                        title,
                        style: isPrimary
                            ? filledButtonTextStyle
                            : filledButtonTextStyleSecondary,
                      ),
                    ],
                  )
                : Text(
                    title,
                    style: isPrimary
                        ? filledButtonTextStyle
                        : filledButtonTextStyleSecondary,
                  ),
      ),
    );
  }
}
