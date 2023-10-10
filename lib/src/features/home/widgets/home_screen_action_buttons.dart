import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/assets.dart';
import '../../shared_widgets/taal_circular_button.dart';
import '../provider/home_screen_provider.dart';

class HomeScreenActionButtons extends StatelessWidget {
  const HomeScreenActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeScreenProvider read = context.read<HomeScreenProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TaalCircularButton(
              isSquare: true,
              onTap: read.gotoUserLocation,
              icon: Assets.centerLocation),
          TaalCircularButton(isSquare: true, onTap: () {}, icon: Assets.search),
        ],
      ),
    );
  }
}
