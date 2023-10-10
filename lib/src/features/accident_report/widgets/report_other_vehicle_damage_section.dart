import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_text_field.dart';

import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class ReportOtherVehicleDamageSection extends StatelessWidget {
  const ReportOtherVehicleDamageSection({
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
            Strings.damageToOtherVehicles,
            style: titleTextStyle,
          ),
          collapsed: const SizedBox(),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Strings.typeOfTheVehicle,
                style: descriptionTextStyle,
              ),
              const TaalTextField(),
              Text(
                Strings.vehicleOwnerName,
                style: descriptionTextStyle,
              ),
              const TaalTextField(),
              Text(
                Strings.vehicleOwnerNumber,
                style: descriptionTextStyle,
              ),
              const TaalTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
