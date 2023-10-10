import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/features/scan_code/provider/scan_code_provider.dart';
import '../../../constants/styles/taal_styles.dart';
import '../widgets/enter_code_section.dart';
import '../widgets/qr_code_section.dart';

class ScanCodeScreen extends StatelessWidget {
  const ScanCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScanCodeProvider>(
      create: (_) => ScanCodeProvider(context),
      child: const _ScanCodeScreen(),
    );
  }
}

class _ScanCodeScreen extends StatelessWidget {
  const _ScanCodeScreen();

  @override
  Widget build(BuildContext context) {
    final ScanCodeProvider watch = context.watch<ScanCodeProvider>();
    final ScanCodeProvider read = context.read<ScanCodeProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(Assets.scanScooterBgImage, fit: BoxFit.fill),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: Sizes.s, top: Sizes.s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        Strings.scanBarcodeText,
                        style: filledButtonTextStyle,
                      ),
                      Spaces.horizontalSpaceLarge,
                      Spaces.horizontalSpaceSmall,
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!watch.isScanMode)
                  const QrScanSection()
                else
                  EnterCodeSection(
                      controller: watch.enterSixDigitController,
                      onPressed: read.getCodeFromUser,
                      isLoading: watch.isLoading),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
