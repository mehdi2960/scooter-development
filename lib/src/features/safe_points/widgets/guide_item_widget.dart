import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';

class GuideItemWidget extends StatelessWidget {
  const GuideItemWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imagePath});

  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: Sizes.s, bottom: Sizes.m),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                title,
                style: titleCardHistoryTextStyle,
              ),
              Text(
                subTitle,
                style:
                    cartInfoTextStyle.copyWith(color: AppColors.blackWithAlpha),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          Spaces.horizontalSpaceSmall,
          Text(
            'Image',
            style: TextStyle(fontSize: 35),
          ),
        ],
      ),
    );
  }
}
