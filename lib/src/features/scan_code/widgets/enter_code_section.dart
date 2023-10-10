import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/scan_code/widgets/circular_action_button.dart';
import 'package:scooter/src/features/scan_code/widgets/square_action_button.dart';
import 'package:scooter/src/features/shared_widgets/taal_text_field.dart';
import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../provider/scan_code_provider.dart';

class EnterCodeSection extends StatelessWidget {
  const EnterCodeSection({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.isLoading,
  });
  final TextEditingController controller;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final ScanCodeProvider watch = context.watch<ScanCodeProvider>();
    final ScanCodeProvider read = context.watch<ScanCodeProvider>();

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryDark1,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Sizes.m),
                topRight: Radius.circular(Sizes.m))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spaces.verticalSpaceLarge,
            SquareActionButton(
              icon: Assets.qrCode,
              isActive: true,
              onPressed: () {},
            ),
            Spaces.verticalSpaceLarge,
            Text(
              Strings.enterSixDigitCode,
              style: sixDigitTextStyle,
            ),
            Spaces.verticalSpaceTiny,
            Text(
              Strings.sixDigitCode,
              style: sixDigitTextStyle.copyWith(
                  fontWeight: FontWeight.w400, fontSize: 14),
            ),
            Spaces.verticalSpaceLarge,
            TaalTextField(
                maximumLength: 6,
                controller: controller,
                fillColor: AppColors.primaryDark,
                isEnterSixDigit: true,
                onChanged: (value) => read.getCodeFromUser()),
            Padding(
              padding: const EdgeInsets.only(right: Sizes.s, top: Sizes.ss),
              child: Align(
                alignment: Alignment.topRight,
                child: Visibility(
                    visible: read.error == true ? true : false,
                    child: Text(
                      read.errorText,
                      style: const TextStyle(color: Colors.red),
                      textDirection: TextDirection.rtl,
                    )),
              ),
            ),
            Spaces.verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularActionButton(
                  icon: !watch.isScanMode
                      ? Assets.keyboardTypeIcon
                      : Assets.qrCode,
                  isActive: !watch.isScanMode,
                  onPressed: read.changeScanScreenMode,
                ),
                Spaces.horizontalSpaceMedium,
                CircularActionButton(
                  icon: Assets.lampIcon,
                  isActive: watch.isScanMode,
                  onPressed: read.toggleFlash,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
