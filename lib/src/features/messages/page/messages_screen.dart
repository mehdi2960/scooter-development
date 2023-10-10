import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';

import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/taal_new_app_bar.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const TaalNewAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SvgBox(
              assetName: Assets.bigMessage,
            ),
            Spaces.verticalSpaceSmall,
            Text(
              Strings.noMessage,
              style: scootrInfoBlackTextStyle,
            ),
            Spaces.verticalSpaceMedium,
            TaalFilledButton(
                text: Strings.decline,
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
