import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class UnSuccessPaymentBottomSheet extends StatelessWidget {
  const UnSuccessPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        height: Sizes.l,
        width: Sizes.l,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.xl) , color: AppColors.lightRed),
        child: const Icon(Icons.info_outline , color: AppColors.darkRed,),
      ),
      Spaces.verticalSpaceSmall,
      Text(
        Strings.unsuccessPaymentTitle,
        style: scootrInfoBlackTextStyle.copyWith(color: AppColors.darkRed),
      ),
      Spaces.verticalSpaceSmall,
      Container(
        padding: const EdgeInsets.all(Sizes.ss),
        decoration: BoxDecoration(
            color: AppColors.beigeWithOpacity,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          textDirection: TextDirection.rtl,
          Strings.unsuccessPaymentSubTitle,
          style: cartInfoTextStyle.copyWith(color: AppColors.darkRed),
        ),
      ),
      Spaces.verticalSpaceSmall,
      Text(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        Strings.unsuccessPaymentmessage,
        style: descriptionTextStyle.copyWith(color: AppColors.blackWithAlpha),
      ),
      Spaces.verticalSpaceMedium,
      SizedBox(
        width: double.infinity,
        child: TaalFilledButtonNew(
          title : Strings.againPaymentmessage,
          onPressed: () {},
        ),
      ),
      Spaces.verticalSpaceMedium,
    ]);
  }
}
