import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

import '../../../constants/styles/taal_styles.dart';

class ScooterInfoBox extends StatelessWidget {
  const ScooterInfoBox({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgBox(assetName: icon),
          Spaces.horizontalSpaceTiny,
          Text(title, style: filledButtonTextStyleSecondary)
        ],
      ),
    );
  }
}
