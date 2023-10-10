import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import 'package:scooter/src/features/sign_up/provider/sign_up_screen_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/api_path.dart';
import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../../routes/routes_path.dart';
import '../../shared_widgets/svg_box.dart';
import '../../shared_widgets/taal_text_field.dart';

class SignUpCart extends StatelessWidget {
  const SignUpCart({super.key});
  Future<void> _launchRulesAndConditions() async {
    const String url = Endpoints.RUELS_CONDITIONS;

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final SignUpScreenProvider watch = context.watch<SignUpScreenProvider>();
    final SignUpScreenProvider read = context.read<SignUpScreenProvider>();
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
              Strings.signupinTaal,
              style: headerTextStyle,
            ),
            subtitle: Text(Strings.enterPhoneNumberToSignup,
                style: onBoardingDescriptionTextStyle),
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
            padding: const EdgeInsets.only(right: Sizes.s),
            child: Text(
              watch.phoneNumberMessage,
              style: errorMessageTitleTextStyle,
            ),
          ),
          Spaces.verticalSpaceSmall,
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Text(
          //     watch.nationalCodeMessage,
          //     style: errorTextStyle,
          //     textAlign: TextAlign.right,
          //   ),
          // ),
          // Container(
          //   margin: const EdgeInsets.only(right: 10),
          //   child: Row(
          //     children: <Widget>[
          //       Theme(
          //         data: ThemeData(
          //           unselectedWidgetColor: watch.checkBoxMessage == false
          //               ? AppColors.primary
          //               : AppColors.error, // Your color
          //         ),
          //         child: Checkbox(
          //           activeColor: AppColors.primary,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(4)),
          //           value: watch.checkBox,
          //           onChanged: (bool? value) =>
          //               watch.changeCheckBoxState(value!),
          //         ),
          //       ),
          //       Row(
          //         children: <Widget>[
          //           Text(Strings.rulesTitle, style: descriptionTextStyle),
          //           InkWell(
          //             onTap: _launchRulesAndConditions,
          //             child: Text(Strings.rulesSubTitle,
          //                 style: descriptionTextStyle.copyWith(
          //                     color: AppColors.primary)),
          //           ),
          //           Text(Strings.rulesDescription, style: descriptionTextStyle),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          TaalFilledButtonNew(
            // isDeactivated: watch.phoneNumberController.text.length < 11,
            width: double.infinity,
            title: Strings.getVerificationCode,
            onPressed: read.onSignUpButtonTapped,
            isLoading: watch.isLoading,
          ),
          Spaces.verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Strings.alreadyAuser,
                style: header2TextStyle,
              ),
              InkWell(
                onTap: () => context.pushReplacement(RoutesPath.login),
                child: Text(
                  Strings.loginToTaal,
                  style: header2TextStyle.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
