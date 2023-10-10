import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import '../../constants/styles/taal_styles.dart';

class CustomBottomSheetText extends StatelessWidget {
  const CustomBottomSheetText(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        Text(
          title,
          style: bottomSheetTitleTextStyle,
          textDirection: TextDirection.rtl,
        ),
        Spaces.horizontalSpaceTiny,
        Text(
          englishNumberToPersian(subTitle),
          style: bottomSheetSubTitleTextStyle,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
