import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/features/scan_code/widgets/circular_action_button.dart';
import 'package:scooter/src/features/scan_code/widgets/qr_code_widget.dart';
import 'package:scooter/src/features/scan_code/widgets/square_action_button.dart';

import '../../../constants/assets.dart';
import '../../../constants/styles/taal_styles.dart';
import '../provider/scan_code_provider.dart';

class QrScanSection extends StatelessWidget {
  const QrScanSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ScanCodeProvider watch = context.watch<ScanCodeProvider>();
    final ScanCodeProvider read = context.watch<ScanCodeProvider>();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SquareActionButton(
              icon: Assets.qrCode,
              isActive: true,
              onPressed: read.changeScanScreenMode),
          Spaces.verticalSpaceSemiLarge,
          const QrWidget(),
          Spaces.verticalSpaceMedium,
          Text(
            Strings.setBarcodeText,
            style:
                descriptionTextStyle.copyWith(color: AppColors.backgroundColor),
          ),
          Spaces.verticalSpaceSemiMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularActionButton(
                icon:
                    !watch.isScanMode ? Assets.keyboardTypeIcon : Assets.qrCode,
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
    );
  }
}

class RideFeeChip extends StatelessWidget {
  const RideFeeChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        width: 328,
        decoration: feeDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.feePerMinute,
              style: feeTextStyle,
            ),
            Text(
              Strings.fee,
              style: feeTextStyle,
            ),
          ],
        ));
  }
}
