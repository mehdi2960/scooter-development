import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_circular_button.dart';
import 'package:scooter/src/routes/routes_path.dart';

import '../../constants/styles/taal_styles.dart';

class TaalAppBar extends StatelessWidget {
  const TaalAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 8, offset: Offset(0, 4))
              ]),
          child: ClipOval(
            child: Image.network(
              //change this later to the profle pic CDN url
              'https://picsum.photos/200',
              height: 45,
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: const SvgBox(assetName: Assets.taalLogo),
        ),
        Column(
          children: [
            Builder(builder: (BuildContext context) {
              return TaalCircularButton(
                isSquare: false,
                onTap: () {
                  context.push(RoutesPath.drawer);
                },
                icon: Assets.drawer,
              );
            }),
            Spaces.verticalSpaceSmall,
            TaalCircularButton(
                isSquare: false,
                onTap: () {
                  //implement alarm later
                },
                icon: Assets.alarm)
          ],
        ),
      ],
    );
  }
}
