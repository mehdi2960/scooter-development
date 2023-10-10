import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';

mixin CustomBottomSheet {
  static Future<void> showCustomBottomSheetWidgets(
      {required BuildContext context,
      required Widget widget,
      bool? havePadding = true}) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(Sizes.s)),
            padding: const EdgeInsets.only(top: Sizes.m),
            child: widget);
      },
    );
  }
}
