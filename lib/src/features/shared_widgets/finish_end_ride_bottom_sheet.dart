import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import '../../constants/strings.dart';
import '../../constants/styles/taal_styles.dart';

class FinishEndRideBottomSheet extends StatelessWidget {
  const FinishEndRideBottomSheet({
    super.key,
    required this.continueOnPressed,
    required this.finishEndRideOnPressed,
  });

  final VoidCallback continueOnPressed;
  final VoidCallback finishEndRideOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.m),
              topLeft: Radius.circular(Sizes.m))),
      height: MediaQuery.of(context).size.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                Strings.finishEndRideQuestionTitle,
                style: endRideBottomSheetTitleTextStyle.copyWith(fontSize: 20),
                textDirection: TextDirection.rtl,
              ),
              Spaces.verticalSpaceSmall,
              Text(
                Strings.finishEndRidesubTitle,
                style: payDebtTextStyle.copyWith(
                    color: AppColors.blackWithAlpha, fontSize: 14),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // custom text with battery icon
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: TaalFilledButtonNew(
                      title: Strings.continueBtnRunningTitle,
                      isPrimary: false,
                      onPressed: continueOnPressed,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: TaalFilledButtonNew(
                      title: Strings.finishBtnRunningTitle,
                      onPressed: finishEndRideOnPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
