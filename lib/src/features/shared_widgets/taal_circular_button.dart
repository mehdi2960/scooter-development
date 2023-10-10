import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

import '../../constants/styles/taal_styles.dart';

class TaalCircularButton extends StatelessWidget {
  const TaalCircularButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isSquare,
  });
  final VoidCallback onTap;
  final String icon;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: isSquare ? squareButtonDecoration : circularButtonDecoration,
      child: IconButton(
        onPressed: onTap,
        icon: SvgBox(assetName: icon),
      ),
    );
  }
}
