import 'package:flutter/material.dart';
import 'sizes.dart';

class Spaces {
  static const Widget verticalSpaceTooTiny = SizedBox(height: Sizes.s / 6);
  static const Widget verticalSpaceTiny = SizedBox(height: Sizes.s / 2);
  static const Widget verticalSpaceSmall = SizedBox(height: Sizes.s);
  static const Widget verticalSpaceSemiMedium = SizedBox(height: Sizes.s * 1.5);
  static const Widget verticalSpaceMedium = SizedBox(height: Sizes.m);
  static const Widget verticalSpaceSemiLarge = SizedBox(height: Sizes.m * 1.5);
  static const Widget verticalSpaceLarge = SizedBox(height: Sizes.m);
  static const Widget verticalSpaceTooLarge =
      SizedBox(height: Sizes.l + Sizes.m + Sizes.xs);

  static const Widget horizontalSpaceSmall = SizedBox(width: Sizes.s);
  static const Widget horizontalSpaceTiny = SizedBox(width: Sizes.s / 2);
  static const Widget horizontalSpaceSemiMedium =
      SizedBox(width: Sizes.s * 1.5);
  static const Widget horizontalSpaceMedium = SizedBox(width: Sizes.m);
  static const Widget horizontalSpaceSemiLarge = SizedBox(width: Sizes.m * 1.5);
  static const Widget horizontalSpaceLarge = SizedBox(width: Sizes.l);
}
