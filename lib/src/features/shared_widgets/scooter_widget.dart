import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import '../../constants/assets.dart';
import '../../constants/styles/taal_styles.dart';

class ScooterWidget extends StatelessWidget {
  const ScooterWidget({
    super.key,
    required this.scooterNumber
  });

  final String scooterNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Sizes.s),
      height: MediaQuery.of(context).size.height * .16,
      width: MediaQuery.of(context).size.height * .16,
      child: Stack(
        children: [
          Positioned(
            top: Sizes.l,
            left: Sizes.s,
            child: Container(
              alignment: Alignment.center,
              height: Sizes.m,
              width: Sizes.l,
              decoration: BoxDecoration(
                  color: AppColors.decorationNumber,
                  borderRadius: BorderRadius.circular(Sizes.ss)),
              child: Text(
                englishNumberToPersian(scooterNumber),
                style: titleTextStyleBlue.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Image.asset(Assets.scooterImage),
        ],
      ),
    );
  }
}
