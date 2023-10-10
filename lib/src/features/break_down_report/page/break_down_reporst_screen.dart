import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';

import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/report_check_box.dart';
import '../../shared_widgets/taal_filled_button.dart';
import '../../shared_widgets/taal_flat_button.dart';

class BreakDownReportScreen extends StatelessWidget {
  const BreakDownReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: const TaalNewAppBar(
            title: Strings.BreakDownReport,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                Spaces.verticalSpaceTiny,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: expandableBoxDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Text(
                                Strings.scooterProblems,
                                style: titleTextStyle,
                              ),
                            ),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.scooterWontTurnOn),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.scooterBreak),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.scooterLight),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.scooterLock),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.scooterPartBreakDown),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.gasPedal),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.wheelBreakDown),
                            ReportCheckBox(
                                value: false,
                                onClick: (bool? newValue) {},
                                title: Strings.others),
                          ],
                        ),
                      ),
                      Spaces.verticalSpaceSmall,
                      Container(
                        decoration: expandableBoxDecoration,
                        child: TaalFlatButton(
                          text: Strings.uploadScooterPic,
                          color: AppColors.primaryWithOpacity,
                          icon: Assets.camera,
                          hasPadding: true,
                          titleColor: AppColors.primary,
                          onPressed: () {},
                        ),
                      ),
                      Spaces.verticalSpaceSmall,
                      Container(
                        decoration: expandableBoxDecoration,
                        child: TaalFlatButton(
                          text: Strings.enterQrCode,
                          color: AppColors.greenWithOpacity,
                          icon: Assets.qrCode,
                          hasPadding: true,
                          titleColor: AppColors.green,
                          onPressed: () {},
                        ),
                      ),
                      Spaces.verticalSpaceMedium,
                    ],
                  ),
                ),
                TaalFilledButton(
                  text: Strings.submitReport,
                  onPressed: () {},
                  hasPadding: false,
                ),
                Spaces.verticalSpaceTiny
              ],
            ),
          ),
        ));
  }
}
