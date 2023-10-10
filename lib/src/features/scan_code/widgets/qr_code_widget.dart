import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../provider/scan_code_provider.dart';

class QrWidget extends StatelessWidget {
  const QrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanCodeProvider watch = context.watch<ScanCodeProvider>();
    final ScanCodeProvider read = context.read<ScanCodeProvider>();
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.6,
          width: MediaQuery.of(context).size.width / 1.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: MobileScanner(
                controller: watch.cameraController,
                onDetect: read.getCodeFromQrCode),
          ),
        ),
      ],
    );
  }
}
