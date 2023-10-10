import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/styles/colors.dart';
import 'package:scooter/src/constants/styles/text_styles.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class BatteryWidget extends StatelessWidget {
  const BatteryWidget({super.key, required this.batteryPersentage});

  final String batteryPersentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const SvgBox(assetName: Assets.battery),
          Text(
            englishNumberToPersian('$batteryPersentage%'),
            style: endRideBottomSheetTitleTextStyle.copyWith(
                color: AppColors.blueLight),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
