import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/safe_points/widgets/guide_item_widget.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';

class SafePointScreen extends StatelessWidget {
  const SafePointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaalNewAppBar(
        title: Strings.howToUseScooter,
        iconWidgetLeft: Padding(
          padding: const EdgeInsets.only(top: Sizes.ss),
          child: Text(
            Strings.ignorText,
            textAlign: TextAlign.end,
            style: header2TextStyle,
          ),
        ),
        forwardOnPress: () => context.pop(),
      ),
      body: const Column(
        children: <Widget>[
          Spaces.verticalSpaceMedium,
          Center(child: Text(Strings.differentAreaOnMap)),
          Spaces.verticalSpaceSemiLarge,
          GuideItemWidget(
              title: Strings.forbidenArea,
              subTitle: Strings.forbidenAreaDes,
              imagePath: 'image'),
          GuideItemWidget(
              title: Strings.forbidenParkArea,
              subTitle: Strings.forbidenParkAreaDes,
              imagePath: 'image'),
          GuideItemWidget(
              title: Strings.giftForPark,
              subTitle: Strings.giftForParkDes,
              imagePath: 'image'),
          GuideItemWidget(
              title: Strings.slowRide,
              subTitle: Strings.slowRideDes,
              imagePath: 'image'),
        ],
      ),
    );
  }
}
