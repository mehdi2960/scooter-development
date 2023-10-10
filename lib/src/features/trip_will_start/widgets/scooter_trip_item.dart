import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class ScooterTripDataItem extends StatelessWidget {
  const ScooterTripDataItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.ss),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SvgBox(assetName: icon),
              Spaces.horizontalSpaceTiny,
              Text(
                title,
                style: header2TextStyle,
              ),
            ],
          ),
          Text(subTitle)
        ],
      ),
    );
  }
}
