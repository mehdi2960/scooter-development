import 'package:flutter/material.dart';

import '../../constants/styles/taal_styles.dart';

class TaalFilledButton extends StatelessWidget {
  const TaalFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isPrimary = true,
    this.hasPadding = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isPrimary;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: hasPadding ? 24 : 4),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          side: isPrimary ? const BorderSide(color: AppColors.primary) : null,
          backgroundColor: isPrimary ? AppColors.primary : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (isLoading)
                const SizedBox.square(
                  dimension: 23,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              else
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: isPrimary
                      ? filledButtonTextStyle
                      : filledButtonTextStyleSecondary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
