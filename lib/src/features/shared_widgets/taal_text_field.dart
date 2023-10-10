import 'package:flutter/material.dart';

import '../../constants/styles/taal_styles.dart';

class TaalTextField extends StatelessWidget {
  const TaalTextField(
      {super.key,
      this.title,
      this.controller,
      this.padding,
      this.onChanged,
      this.autofocus,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.contentPadding,
      this.textInputType,
      this.maximumLength,
      this.fillColor = AppColors.primaryWhite,
      this.isEnterSixDigit = false});

  final String? title;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<String>? onChanged;
  final bool? autofocus;
  final String? hintText;
  final Widget? suffixIcon;
  final int? maximumLength;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? textInputType;
  final Color? fillColor;
  final bool? isEnterSixDigit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title!,
              style: descriptionTextStyle,
            ),
          ),
        Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
          child: TextField(
            maxLength: maximumLength,
            keyboardType: textInputType,
            controller: controller,
            onChanged: onChanged,
            autofocus: autofocus ?? false,
            style: textFieldTextStyle.copyWith(
              color: isEnterSixDigit == true
                  ? AppColors.primaryWhite
                  : AppColors.primaryDark,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: true,
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.errorLight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: hintText,
              alignLabelWithHint: false,
              hintStyle: textFieldHintTextStyle,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              contentPadding: contentPadding ?? const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}
