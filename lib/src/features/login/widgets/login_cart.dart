import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';

import '/src/constants/assets.dart';
import '/src/constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../../routes/routes_path.dart';
import '../../shared_widgets/svg_box.dart';
import '../../shared_widgets/taal_text_field.dart';
import '../provider/login_screen_provider.dart';

class LoginCart extends StatelessWidget {
  const LoginCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginScreenProvider watch = context.watch<LoginScreenProvider>();
    final LoginScreenProvider read = context.read<LoginScreenProvider>();
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spaces.verticalSpaceSmall,
          ListTile(
            title: Text(
              Strings.loginToTaal,
              style: headerTextStyle,
            ),
            subtitle: Text(
              Strings.enterPhoneNumberToLogin,
              style: onBoardingDescriptionTextStyle,
            ),
          ),
          Spaces.verticalSpaceSemiMedium,
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: Text(
              Strings.phoneNumber,
              style: header2TextStyle,
            ),
          ),
          TaalTextField(
            maximumLength: 11,
            hintText: Strings.enterPhoneNumber,
            textInputType: TextInputType.number,
            controller: watch.phoneNumberController,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10),
              child: SvgBox(
                assetName: Assets.phone_call,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              watch.message,
              style: errorTextStyle,
            ),
          ),
          Spaces.verticalSpaceTooTiny,
          TaalFilledButtonNew(
            height: 40,
            width: double.infinity,
            title: Strings.getVerificationCode,
            onPressed: read.onLoginButtonTapped,
            isLoading: watch.isLoading,
          ),
          Spaces.verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Strings.dontHaveAnAccount,
                style: header2TextStyle,
              ),
              InkWell(
                onTap: () => context.pushReplacement(RoutesPath.register),
                child: Text(
                  Strings.registerInTaal,
                  style: header2TextStyle.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
