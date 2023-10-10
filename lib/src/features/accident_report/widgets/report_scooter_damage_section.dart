import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_text_field.dart';

import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/report_check_box.dart';

class ReportScooterDamageSection extends StatelessWidget {
  const ReportScooterDamageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: expandableBoxDecoration,
      child: Center(
        child: ExpandablePanel(
          header: Text(
            Strings.scooterDamage,
            style: titleTextStyle,
          ),
          collapsed: const SizedBox(),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ReportCheckBox(
                  value: false,
                  onClick: (bool? newValue) {},
                  title: Strings.wheels),
              ReportCheckBox(
                value: false,
                onClick: (bool? newValue) {},
                title: Strings.body,
              ),
              ReportCheckBox(
                value: false,
                onClick: (bool? newValue) {},
                title: Strings.handle,
              ),
              ReportCheckBox(
                value: false,
                onClick: (bool? newValue) {},
                title: Strings.others,
              ),
              Text(
                Strings.nameOfTheDamagedPart,
                style: descriptionTextStyle,
              ),
              const TaalTextField()
            ],
          ),
        ),
      ),
    );
  }
}
