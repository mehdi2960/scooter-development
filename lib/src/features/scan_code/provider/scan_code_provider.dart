import 'dart:developer';

import 'package:custom_logger/custom_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:provider/provider.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/features/shared_providers/ride_provider.dart';
import 'package:scooter/src/models/failed_start_ride_model.dart';
import 'package:scooter/src/models/ride_model.dart';
import 'package:scooter/src/models/vehicle.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';

import '/src/apis/vehicle_api.dart';

class ScanCodeProvider extends SafeChangeNotifier {
  ScanCodeProvider(this.context) {
    init();
  }
  final BuildContext context;

  final TextEditingController enterSixDigitController = TextEditingController();
  final MobileScannerController cameraController = MobileScannerController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool _isRequestSent = false;
  bool get isRequestSent => _isRequestSent;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isScanMode = false;
  bool get isScanMode => _isScanMode;

  bool _error = false;
  bool get error => _error;

  bool _flashIsOn = false;
  bool get flashIsOn => _flashIsOn;

  String _errorMessage = "";
  String get errorText => _errorMessage;

  String _scooterCodeSixDigit = "";
  String get scooterCodeSixDigit => _scooterCodeSixDigit;

  // String? qrValue;
  String? scooterCode;

  Future<void> init() async {}

  void goBack() {
    context.pop();
  }

  void changeScanScreenMode() {
    _isScanMode = !_isScanMode;
    notifyListeners();
  }

  void stopCamera() {
    cameraController.stop();
    notifyListeners();
  }

  void toggleFlash() {
    cameraController.toggleTorch();
    _flashIsOn = !_flashIsOn;
    notifyListeners();
  }

// validate phone number
  Future<bool> _validateSixDigitCode() async {
    _scooterCodeSixDigit = enterSixDigitController.text;
    _errorMessage = '';

    //Empty Code
    if (_scooterCodeSixDigit.isEmpty) {
      _errorMessage = Strings.enterScooterCode;
      notifyListeners();
      return false;
    }

    // Six Digit Code
    if (_scooterCodeSixDigit.length < 6) {
      _errorMessage = Strings.lessThanSixDigit;
      notifyListeners();
      return false;
    }

    notifyListeners();
    return _errorMessage == '';
  }

  void getCodeFromUser() async {
    final bool isValid = await _validateSixDigitCode();
    //Check Six Digit Code

    if (isValid) {
      if (enterSixDigitController.text != null) {
        scooterCode = persianNumberToEnglish(enterSixDigitController.text);
        Storage.instance.setScooterShortKey(scooterCode!);
        customPrint(data: scooterCode, name: 'scooter code from user ');
        sendScooterCode();
      }
    }
  }

  void getCodeFromQrCode(BarcodeCapture capture) {
    cameraController.stop();
    final Barcode qrCode = capture.barcodes[0];
    customPrint(data: qrCode.rawValue, name: 'qr value *****');
    scooterCode = qrCode.rawValue;
    Storage.instance.setScooterShortKey(scooterCode!);
    sendScooterCode();
  }

  //Send Scooter Code
  Future<Vehicle?> sendScooterCode() async {
    if (!_isRequestSent && scooterCode != null) {
      // final String shortKey = persianNumberToEnglish(textController.text);
      // Storage.instance.setScooterShortKey(shortKey);
      _isLoading = true;
      _isRequestSent = true;
      notifyListeners();
      final Vehicle? scooter = await VehicleAPIController().getInfoByShortKey(
        shortKey: scooterCode!,
        errorHandler: (dynamic error) => _error = true,
      );
      if (scooter != null) {
        final dynamic scooterResponse =
            await VehicleAPIController().startRideScooter(
          id: scooter.scooter!.id!,
          // imei: scooter.imei!,
          // shouldStart: true,
          errorHandler: (dynamic error) => _error = true,
        );
        if (scooterResponse is Ride) {
          print(
              '******************************************************************');
          customPrint(data: scooterResponse, name: 'scooter response ********');
          _isLoading = false;
          _isRequestSent = false;
          notifyListeners();
          context.read<RideProvider>().startRide();
          context.push(RoutesPath.tripWillStart);
        } else if (scooterResponse is FailedStartRide) {
          log(' Filed Start Scooter By Code is : ${scooterResponse.message}');
          _errorMessage = scooterResponse.message;
          _error = true;
          notifyListeners();
        } else {
          // showCupertinoDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return CupertinoAlertDialog(
          //       actions: [
          //         CupertinoButton(
          //           onPressed: () {
          //             context.pop();
          //           },
          //           child: const Text('OK'),
          //         ),
          //       ],
          //       content: const Text(Strings.pleaseEnterValidCode),
          //     );
          //   },
          // );
          _error = true;
          _errorMessage = Strings.enteredwrongCode;
          notifyListeners();
        }
      }
      _isLoading = false;
      _isRequestSent = false;
      notifyListeners();
      // return null;
    }

    @override
    void dispose() {
      cameraController.dispose();
      enterSixDigitController.dispose();
      super.dispose();
    }

    return null;
  }
}
