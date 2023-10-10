import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/sizes.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class ItemTrip extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  const ItemTrip({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(Sizes.xxs, Sizes.xxs, Sizes.xxs, Sizes.s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            englishNumberToPersian(subTitle),
            style: header2TextStyle,
            textDirection: TextDirection.rtl,
          ),
          Row(
            children: [
              Text(title),
              const SizedBox(
                width: Sizes.xxs,
              ),
              SvgBox(
                assetName: icon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemHazineh extends StatelessWidget {
  final String title;
  final String price;
  const ItemHazineh({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          englishNumberToPersian(price),
          style: scootrInfoBlackTextStyle,
          textDirection: TextDirection.rtl,
        ),
        Text(
          title,
          style: scootrInfoBlackTextStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
