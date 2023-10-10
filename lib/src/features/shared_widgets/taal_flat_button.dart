import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

import '../../constants/styles/taal_styles.dart';

class TaalFlatButton extends StatelessWidget {
  const TaalFlatButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.icon,
    required this.hasPadding,
    required this.titleColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color titleColor;
  final String icon;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 8, vertical: hasPadding ? 12 : 4),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgBox(
                assetName: icon,
                color: titleColor,
              ),
              Spaces.horizontalSpaceTiny,
              Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: titleColor))
            ],
          ),
        ),
      ),
    );
  }
}
