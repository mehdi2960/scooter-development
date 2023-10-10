import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:custom_logger/custom_logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/models/general_response.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../apis/verification_api.dart';

class OtpProvider extends SafeChangeNotifier {
  OtpProvider(this.context, this.isLoginScreen) {
    init();
  }

  final BuildContext context;
  bool? isLoginScreen;

  int _timerValue = 60;
  int get timerValue => _timerValue;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _errorMessage = false;
  bool get errorMessage => _errorMessage;

  String _errorResultMessage = '';
  String get errorResultMessage => _errorResultMessage;

  final String? _phoneNumber = Storage.instance.phoneNumber;
  String? get phoneNumber => _phoneNumber;

  final String? _userId = Storage.instance.userId;
  String? get userId => _userId;

  String? otp;

  String? code = '';

  final TextEditingController otpController = TextEditingController();
  final FocusNode otpFocusNode = FocusNode();

  // Timer
  void timer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        _timerValue--;
        if (timerValue == 0) {
          timer.cancel();
        }
        notifyListeners();
      },
    );
  }

  //init state method
  Future<void> init() async {
    timer();
    //await getDeviceId();
    await _fetchSignature(); // fetch signature
    await _listenSmsCode(); //listen sms code
    notifyListeners();
  }

  //* Fetch DeviceId
  // Future<String> getDeviceId() async {
  //   if (Platform.isAndroid) {
  //     final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     deviceId = androidInfo.id;

  //     notifyListeners();
  //   } else if (Platform.isIOS) {
  //     final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     deviceId = iosInfo.identifierForVendor!;
  //     notifyListeners();
  //   }
  //   return deviceId;
  // }

  // validate otp
  Future<bool> validateOtp() async {
    final String otpCode = otpController.text.trim();

    _errorMessage = false;

    if (otpCode.isEmpty || otpCode == null) {
      _errorMessage = true;
      _errorResultMessage = Strings.otpEmptyMessage;
      notifyListeners();
      return false;
    } else if (otpCode.length < 6) {
      _errorMessage = true;
      _errorResultMessage = Strings.otpWrongMessage;
      notifyListeners();
      return false;
    }
    _errorMessage = false;
    notifyListeners();
    return true;
  }

  // Otp
  Future<void> onValidateOtpButtonPressed() async {
    final bool isValid = await validateOtp();

    if (isValid) {
      //Check Otp Length
      final GeneralResponse? generalResponse =
          await VerificationAPIController().verifyOTP(
        smsCode: otpController.text,
        errorHandler: (dynamic e) {
          // _errorResultMessage = (jsonDecode(e.toString())
          //     as Map<String, dynamic>)['Message'] as String;
          final Map<String, dynamic> data =
              jsonDecode(e.toString()) as Map<String, dynamic>;
          _errorResultMessage = data['Message'] as String;
          // final String message = data['Message'] as String;
          // e['Message'] as String;
          _errorMessage = true;
          notifyListeners();
        },
      );

      if (generalResponse!.status == 1) {
        // Save Token

        final Map<String, dynamic> map =
            generalResponse.result as Map<String, dynamic>;
        final String token = map['authenticationToken'].toString();

        Storage.instance.setAccessToken(token);

        log('Token is not Empty');

        // Navigate to home screen or nation code screen
        //! context.push(RoutesPath.nationalCode);

        context.push(RoutesPath.home);
      } else {
        final Map<String, dynamic> data =
            jsonDecode(generalResponse.message) as Map<String, dynamic>;
        final String message = data['Message'] as String;

        log('message verify otp is $message');

        _errorMessage = true;
        _errorResultMessage = message;
        notifyListeners();
      }
    }

    // if (otpController.text.isNotEmpty) {
    //   _isLoading = true;
    //   notifyListeners();
    // }

    // final bool isValid = await validateOtp();

    // //fetch otpId and deviceId (fetch updated values)
    // final String? otpId = Storage.instance.otpId;
    // final String? deviceId = Storage.instance.deviceId;

    // //! check otp validate
    // if (isValid == true) {
    //   //! send otp
    //   final GeneralResponse? generalResponse = await VerificationAPIController()
    //       .verifyOTP(
    //           userId: userId!,
    //           otpId: otpId!,
    //           otpCode: otpController.text,
    //           deviceId: deviceId!,
    //           mode: isLoginScreen! == false ? 0 : 1,
    //           errorHandler: (dynamic error) =>
    //               _errorResultMessage = error.toString());

    //   if (generalResponse!.status.success! == true) {
    //     _isLoading = false;
    //     notifyListeners();
    //     //* pass to new model
    //     final TokenModel tokenModel =
    //         TokenModel.fromJson(generalResponse.result as Map<String, dynamic>);

    //     //* save token
    //     Storage.instance.setAccessToken(tokenModel.token!);

    //     //* Navigate to HomeScreen
    //     Storage.instance.setLoggedIn(true);
    //     customPrint(
    //         name: 'login status of user ', data: Storage.instance.isLoggedIn);
    //     context.pushReplacement(RoutesPath.home);
    //     // }
    //   } else {
    //     _isLoading = false;
    //     _errorResultMessage = generalResponse.status.message!;
    //     notifyListeners();

    //     CustomAlertDialog.showMessageDialog(
    //       context: context,
    //       title: Strings.resultOTPTitle,
    //       description: _errorResultMessage,
    //       textButton: Strings.closeDialog,
    //       onPressed: () => Navigator.pop(context),
    //       textColor: AppColors.errorLight,
    //     );
    //   }
    // } else {
    //   _errorMessage = true;
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: CustomSnackBar(
    //         context: context, snackBarContent: Strings.snackBarContent),
    //     backgroundColor: Colors.white,
    //     behavior: SnackBarBehavior.floating,
    //     margin: EdgeInsets.only(
    //       bottom: MediaQuery.of(context).size.height - 120,
    //       left: 10,
    //       right: 10,
    //     ),
    //   ));
    // }
  }

  //* ReSend Code Method
  Future<void> onResendOtpButtonPressed() async {
    otpController.clear();

    if (phoneNumber != null) {
      await VerificationAPIController().resendOtp(
        phoneNumber: phoneNumber!,
        // role: 0,
        errorHandler: (dynamic error) => _errorResultMessage = error.toString(),
      );

      _timerValue = 60;
      timer();
      _errorResultMessage = '';
      notifyListeners();

      // if (generalResponse!.status.success! == true) {
      //   final Map<String, dynamic> object =
      //       generalResponse.result as Map<String, dynamic>;

      //   final String newOtpId = object['otpId'].toString();

      //   //* set otpId
      //   await Storage.instance.setotpId(newOtpId);
      //   log('new otp set again ');
      // } else {
      //   CustomAlertDialog.showMessageDialog(
      //       context: context,
      //       title: Strings.resultLoginTitle,
      //       description: generalResponse.status.message!,
      //       textColor: Colors.red,
      //       textButton: Strings.closeDialog,
      //       onPressed: () => Navigator.pop(context));
      // }
    }
  }

  //* fetch AppSignature
  Future<String> _fetchSignature() async {
    final String signature = await SmsAutoFill().getAppSignature;
    customPrint(name: 'phone signature', data: signature);
    return signature;
  }

  //* Listen for comming Code
  Future<void> _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  codeChange(String value) {
    code = value;
    if (value.length == 6) {
      onValidateOtpButtonPressed();
    }
    notifyListeners();
  }

  // displose method
  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }
}
