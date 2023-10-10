import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class DebtBottomSheet extends StatelessWidget {
  const DebtBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        Strings.payDebtTitle,
        style: descriptionTextStyle.copyWith(color: AppColors.blackWithAlpha),
      ),
      Spaces.verticalSpaceSmall,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('۱۹,۵۰۰ تومان',
              style:
                  scootrInfoBlackTextStyle.copyWith(color: AppColors.darkRed)),
          Text('مجموع بدهی',
              style:
                  scootrInfoBlackTextStyle.copyWith(color: AppColors.darkRed)),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: Sizes.m, top: Sizes.ss),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              Strings.offerCodeText,
              style: descriptionTextStyle.copyWith(color: AppColors.primary),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_outline_sharp,
                  color: AppColors.primary,
                ))
          ],
        ),
      ),
      Spaces.verticalSpaceMedium,
      SizedBox(
        width: double.infinity,
        child: TaalFilledButtonNew(
          title: Strings.againPaymentmessage,
          onPressed: () {},
        ),
      ),
      Spaces.verticalSpaceMedium,
    ]);
  }
}
