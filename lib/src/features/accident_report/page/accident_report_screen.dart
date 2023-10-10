import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../widgets/report_injury_section.dart';
import '../../shared_widgets/taal_new_app_bar.dart';
import '../../shared_widgets/taal_filled_button.dart';
import '../../shared_widgets/taal_flat_button.dart';
import '../widgets/report_other_vehicle_damage_section.dart';
import '../widgets/report_scooter_damage_section.dart';

class AccidentReportScreen extends StatelessWidget {
  const AccidentReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: const TaalNewAppBar(
            title: Strings.accidentReport,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 8.0,
            ),
            child: Column(children: <Widget>[
              Spaces.verticalSpaceMedium,
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const ReportInjurySection(),
                    Spaces.verticalSpaceSmall,
                    const ReportScooterDamageSection(),
                    Spaces.verticalSpaceSmall,
                    const ReportOtherVehicleDamageSection(),
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
                  ],
                ),
              ),
              TaalFilledButton(
                text: Strings.submitReport,
                onPressed: () {},
                hasPadding: false,
              ),
              Spaces.verticalSpaceTiny
            ]),
          )),
    );
  }
}
