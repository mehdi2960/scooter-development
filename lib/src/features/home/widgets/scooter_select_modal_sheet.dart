import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/features/shared_widgets/return_back_dialog.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';

import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class ScooterSelectModalSheet extends StatelessWidget {
  const ScooterSelectModalSheet({super.key, required this.batteryLevel});
  final int batteryLevel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(

            // bottom: MediaQuery.of(context).viewInsets.bottom,
            // right: 10,
            right: 14),
        child: Wrap(children: <Widget>[
          SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                //Spaces.verticalSpaceMedium,
                Text(
                  'اسکوتر ۱۵۸',
                  style: titleTextStyleBlue,
                ),
                Spaces.verticalSpaceTiny,
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              Strings.tripCost,
                              style: scootrInfoBlackTextStyle,
                            ),
                            const Text(' دقیقه‌ای ${Strings.fee} تومان'),
                          ],
                        ),
                        Spaces.verticalSpaceSmall,
                        Row(
                          children: <Widget>[
                            Text(
                              Strings.scooterCharge,
                              style: scootrInfoBlackTextStyle,
                            ),
                            Text(
                                '${englishNumberToPersian(batteryLevel.toString())}%')
                          ],
                        ),
                        Spaces.verticalSpaceSmall,
                        Row(
                          children: <Widget>[
                            Text(
                              Strings.timeToUse,
                              style: scootrInfoBlackTextStyle,
                            ),
                            const Text(' 4 ساعت')
                          ],
                        ),
                        Spaces.verticalSpaceSmall,
                        Row(
                          children: <Widget>[
                            Text(
                              'مسافت:',
                              style: scootrInfoBlackTextStyle,
                            ),
                            const Text(' 3 کیلو‌متر')
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const SvgBox(
                      assetName: Assets.bigScooter,
                    ),
                  ],
                ),
                Spaces.verticalSpaceSemiMedium,
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TaalFilledButton(
                        hasPadding: false,
                        text: Strings.scanBarCode,
                        onPressed: () {
                          context.push(RoutesPath.scanCode);
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.4,
                      child: TaalFilledButton(
                        hasPadding: false,
                        isPrimary: false,
                        text: Strings.reserve,
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const ReturnBackDialog();
                            },
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(12),
                        child: const SvgBox(
                            width: 20, height: 20, assetName: Assets.ring),
                      ),
                    ),
                  ],
                ),
                Spaces.verticalSpaceMedium
              ]))
        ]),
      ),
    );
  }
}
