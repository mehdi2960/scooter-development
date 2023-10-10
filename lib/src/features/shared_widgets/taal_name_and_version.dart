import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';

import '../../constants/assets.dart';
import '../../constants/strings.dart';
import 'svg_box.dart';

class TaalNameAndVersion extends StatelessWidget {
  const TaalNameAndVersion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SvgBox(assetName: Assets.taalLogo),
      Spaces.verticalSpaceTiny,
      Text(
        Strings.appVersion,
        style: TextStyle(color: AppColors.primaryDark),
      )
    ]);
  }
}
