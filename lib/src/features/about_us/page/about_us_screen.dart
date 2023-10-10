import 'package:flutter/material.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const TaalNewAppBar(title: Strings.aboutUs),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Spaces.verticalSpaceMedium,
                const SvgBox(assetName: Assets.taalIcon, height: 75),
                Spaces.verticalSpaceLarge,
                Text(
                  Strings.aboutUsText,
                  style: descriptionTextStyle,
                ),
                Spaces.verticalSpaceSmall,
                Image.asset(
                  Assets.AboutUsScooter,
                  height: 330,
                  width: 330,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
