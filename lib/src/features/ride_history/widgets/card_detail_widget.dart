import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class CardDetailWidget extends StatelessWidget {
  const CardDetailWidget(
      {super.key, required this.title, required this.iconAsset});

  final String title;
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          englishNumberToPersian(title),
        ),
        Spaces.horizontalSpaceTiny,
        SvgBox(assetName: iconAsset),
      ],
    );
  }
}
