import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/otp/provider/verify_otp_provider.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class OtpCart extends StatelessWidget {
  const OtpCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OtpProvider watch = context.watch<OtpProvider>();
    final OtpProvider read = context.read<OtpProvider>();
    return Container(
      height: MediaQuery.of(context).size.height / 2.1,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
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
              Strings.verifyPhoneNumber,
              style: headerTextStyle,
            ),
            subtitle: Text(
              '${Strings.enterFourDigitCOde} \n${englishNumberToPersian(Storage.instance.phoneNumber ?? '09123456781')}  ${Strings.enterFourDigitCOde2} ',
              style: onBoardingDescriptionTextStyle,
            ),
          ),
          // Spaces.verticalSpaceSemiMedium,
          Padding(
            padding: const EdgeInsets.only(right: Sizes.s, top: Sizes.s),
            child: Text(
              Strings.sixDigitCOde,
              style: header2TextStyle,
            ),
          ),
          Spaces.verticalSpaceSemiMedium,
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: Sizes.ss),
            child: PinFieldAutoFill(
              codeLength: 6,
              controller: read.otpController,
              focusNode: read.otpFocusNode,
              decoration: BoxLooseDecoration(
                radius: const Radius.circular(Sizes.ss),
                strokeColorBuilder: PinListenColorBuilder(
                  read.errorMessage == true
                      ? AppColors.textFieldBorderColor
                      : AppColors.error,
                  read.errorMessage == false
                      ? AppColors.textFieldBorderColor
                      : AppColors.error,
                ),
                bgColorBuilder: PinListenColorBuilder(
                  AppColors.primaryWhite,
                  AppColors.primaryWhite,
                ),
              ),
              currentCode: read.code,
              onCodeChanged: (String? value) => read.codeChange(value!),
              onCodeSubmitted: (String p0) => read.codeChange(p0),
            ),
          ),
          // Spaces.verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.only(right: Sizes.s, top: Sizes.s),
            child: Text(
              read.errorResultMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          // Spaces.verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                child: Text(Strings.editPhoneNumber,
                    style: dialogTextStyle.copyWith(
                        color: AppColors.blackWithAlpha)),
                onPressed: () => context.pushReplacement(RoutesPath.register),
              ),
              if (watch.timerValue > 0)
                Text(
                    '(${englishNumberToPersian(watch.timerValue.toString())})${Strings.timeLeft}')
              else
                TextButton(
                  onPressed: read.onResendOtpButtonPressed,
                  child: Text(Strings.resendCode,
                      style: scootrInfoBlackTextStyle.copyWith(
                          color: AppColors.primary)),
                ),
            ],
          ),

          Spaces.verticalSpaceSmall,
          TaalFilledButtonNew(
            width: double.infinity,
            isLoading: watch.isLoading,
            title: Strings.submitVerificationCode,
            onPressed: watch.onValidateOtpButtonPressed,
          ),
        ],
      ),
    );
  }
}
