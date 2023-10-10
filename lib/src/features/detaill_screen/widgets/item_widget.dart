import 'package:flutter/material.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/styles/spaces.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class DetailItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  const DetailItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subTitle,
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            Spaces.horizontalSpaceTiny,
            SvgBox(assetName: icon),
          ],
        ),
      ],
    );
  }
}
