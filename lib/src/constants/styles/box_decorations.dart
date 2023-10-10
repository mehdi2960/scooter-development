import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/colors.dart';
import 'package:scooter/src/constants/styles/sizes.dart';

final BoxDecoration otpDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  border: Border.all(
    color: AppColors.borderColor,
  ),
);
const BoxDecoration circularButtonDecoration = BoxDecoration(
  color: Colors.white,
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 8,
      offset: Offset(0, 4),
    )
  ],
);
BoxDecoration squareButtonDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(0, 4))
  ],
);
final BoxDecoration circularActionButtonDecoration = BoxDecoration(
  border: Border.all(color: AppColors.primary),
  borderRadius: BorderRadius.circular(28),
  color: Colors.white,
);
final BoxDecoration feeDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  color: AppColors.success.withOpacity(0.05),
);
final BoxDecoration paymentHistoryCart = BoxDecoration(
    borderRadius: BorderRadius.circular(Sizes.m),
    // color: AppColors.historyCartBGColor);
    color: Colors.grey[200]);
final BoxDecoration expandableBoxDecoration = BoxDecoration(
  border: Border.all(
    color: AppColors.border,
  ),
  borderRadius: BorderRadius.circular(16),
);

final BoxDecoration squareBoxDecoration = BoxDecoration(
  border: Border.all(
    color: AppColors.primaryDark,
  ),
  borderRadius: BorderRadius.circular(Sizes.ss),
);
