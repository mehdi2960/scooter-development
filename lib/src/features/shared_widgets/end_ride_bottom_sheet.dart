import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/battery_widget.dart';
import 'package:scooter/src/features/shared_widgets/cutom_text_bottom_sheet.dart';
import 'package:scooter/src/features/shared_widgets/scooter_widget.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import '../../constants/strings.dart';
import '../../constants/styles/taal_styles.dart';

class EndRideBottomSheet extends StatelessWidget {
  const EndRideBottomSheet(
      {super.key, required this.onPressed, required this.batteryPersentage});

  final VoidCallback onPressed;
  final String batteryPersentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const ScooterWidget(scooterNumber: '#182'),
            Padding(
              padding: const EdgeInsets.only(right: Sizes.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Spaces.verticalSpaceSmall,
                  BatteryWidget(
                    batteryPersentage: batteryPersentage,
                  ),
                  //Image.asset(Assets.batteryImage),
                  Spaces.verticalSpaceSmall,
                  const CustomBottomSheetText(
                      title: Strings.distanceRunningTitle,
                      subTitle: '12 کیلومتر'),
                  Spaces.verticalSpaceTiny,
                  const CustomBottomSheetText(
                      title: Strings.existChargeTitle, subTitle: '12'),
                  Spaces.verticalSpaceTiny,
                  const CustomBottomSheetText(
                      title: Strings.statusRunningTitle,
                      subTitle: 'در حال سواری'),
                ],
              ),
            ),
          ],
        ),
        Spaces.verticalSpaceSmall,
        SizedBox(
          width: double.infinity,
          child: TaalFilledButtonNew(
            title: Strings.finishEndRide,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
