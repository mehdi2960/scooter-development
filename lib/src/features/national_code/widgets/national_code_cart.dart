import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/national_code/provider/national_code_screen_provider.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import 'package:scooter/src/features/shared_widgets/taal_text_field.dart';

class NationalCodeCart extends StatelessWidget {
  const NationalCodeCart({super.key});

  @override
  Widget build(BuildContext context) {
    final NationalCodeProvider watch = context.watch<NationalCodeProvider>();
    final NationalCodeProvider read = context.read<NationalCodeProvider>();

    return Container(
      height: MediaQuery.of(context).size.height / 2.1,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.s),
          topRight: Radius.circular(Sizes.s),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spaces.verticalSpaceSmall,
          ListTile(
            title: Text(
              Strings.enterNationalCode,
              style: headerTextStyle,
            ),
            subtitle: Text(Strings.nationalCodeDescription,
                style: onBoardingDescriptionTextStyle),
          ),
          Spaces.verticalSpaceSemiMedium,
          Padding(
            padding: const EdgeInsets.only(
              right: Sizes.s,
            ),
            child: Text(
              Strings.nationalCode,
              style: header2TextStyle,
            ),
          ),
          TaalTextField(
            maximumLength: 10,
            hintText: Strings.nationalCodeWithPhone,
            textInputType: TextInputType.number,
            controller: watch.nationalCodeController,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(Sizes.ss),
              child: SvgBox(
                assetName: Assets.nationalCodeIcon,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: Sizes.s),
            child: Text(
              watch.nationalCodeMessage,
              style: errorTextStyle.copyWith(color: AppColors.error),
            ),
          ),
          Spaces.verticalSpaceTiny,
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: 50,
                  width: 50,
                  child: Checkbox(
                      value: read.checkBox,
                      onChanged: (bool? newValue) =>
                          watch.changeCheckBoxState(newValue!))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Strings.nationalCodeStatus1,
                    style: header2TextStyle,
                  ),
                  Text(
                    Strings.nationalCodeStatus2,
                    style: header2TextStyle.copyWith(
                        decoration: TextDecoration.underline,
                        color: AppColors.primary),
                  ),
                  Text(Strings.nationalCodeStatus3, style: header2TextStyle),
                ],
              ),
            ],
          ),
          Spaces.verticalSpaceSmall,
          TaalFilledButtonNew(
            width: double.infinity,
            title: Strings.registerBtnTitle,
            onPressed: read.registerWithNationalCode,
            isLoading: watch.isLoading,
          ),
        ],
      ),
    );
  }
}
