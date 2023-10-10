import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_text_field.dart';

import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/report_check_box.dart';

class ReportInjurySection extends StatelessWidget {
  const ReportInjurySection({
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
            Strings.physicalDamage,
            style: titleTextStyle,
          ),
          collapsed: const SizedBox(),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ReportCheckBox(
                  value: false,
                  onClick: (bool? newValue) {},
                  title: Strings.me),
              const Divider(),
              ReportCheckBox(
                value: false,
                onClick: (bool? newValue) {},
                title: Strings.anotherPerson,
              ),
              Text(
                Strings.numberOfTheInjured,
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
