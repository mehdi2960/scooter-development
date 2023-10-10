import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/features/shared_widgets/return_back_dialog.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';

import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../../constants/styles/taal_styles.dart';

class RunningEndRideBottomSheet extends StatelessWidget {
  const RunningEndRideBottomSheet({super.key, required this.batteryLevel});
  final int batteryLevel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Wrap(children: <Widget>[
          SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      Strings.runningEndRideTitle,
                      style: titleTextStyleBlue,
                    ),
                    Column(
                      children: <Widget>[
                        const SvgBox(
                          width: 24,
                          height: 24,
                          assetName: Assets.battery,
                        ),
                        Text(
                          '$batteryLevel%',
                          style: cartInfoTextStyle.copyWith(
                              color: AppColors.blackWithAlpha),
                        )
                      ],
                    )
                  ],
                ),
                Spaces.verticalSpaceSmall,
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              Strings.scooterNumber,
                              style: scootrInfoBlackTextStyle,
                            ),
                            Text(englishNumberToPersian('184')),
                          ],
                        ),
                        Spaces.verticalSpaceSmall,
                        Row(
                          children: <Widget>[
                            Text(
                              Strings.distanceRunning,
                              style: scootrInfoBlackTextStyle,
                            ),
                            Text('${englishNumberToPersian('1.3')} کیلومتر')
                          ],
                        ),
                        Spaces.verticalSpaceSmall,
                        Row(
                          children: <Widget>[
                            Text(
                              Strings.distanceRunningBaseBattery,
                              style: scootrInfoBlackTextStyle,
                            ),
                            Text('${englishNumberToPersian('3')}کیلومتر')
                          ],
                        ),
                        Spaces.verticalSpaceSemiMedium
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TaalFilledButton(
                      hasPadding: false,
                      text: Strings.runningEndRideButton1,
                      onPressed: () {
                        context.push(RoutesPath.scanCode);
                      },
                    ),
                    TaalFilledButton(
                      hasPadding: false,
                      isPrimary: false,
                      text: Strings.runningEndRideButton2,
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const ReturnBackDialog();
                          },
                        );
                      },
                    ),
                  ],
                ),
                Spaces.verticalSpaceTiny
              ]))
        ]),
      ),
    );
  }
}
