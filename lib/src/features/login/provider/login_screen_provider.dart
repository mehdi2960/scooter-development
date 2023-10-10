import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:scooter/src/routes/routes_path.dart';
import '/src/constants/strings.dart';

class LoginScreenProvider extends SafeChangeNotifier {
  LoginScreenProvider(this.context);

  final BuildContext context;

  TextEditingController phoneNumberController = TextEditingController();

  bool _isRequestSent = false;
  bool get isRequestSent => _isRequestSent;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _error = false;
  bool get error => _error;

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  String _message = '';
  String get message => _message;

  String _messageResult = '';
  String get messageResult => _messageResult;

  void _changeLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  void _changeRequestSentState(bool state) {
    _isRequestSent = state;
    notifyListeners();
  }

  Future<bool> _validatePhoneNumber() async {
    _phoneNumber = phoneNumberController.text;
    _message = '';

    if (_phoneNumber.isEmpty) {
      _message = Strings.pleaseEnterCompletePhoneNumber;
      notifyListeners();
      return false;
    }

    if (!checkPhoneNumber(_phoneNumber)) {
      _message = Strings.pleaseEnterCorrectPhoneNumber;
      notifyListeners();
      return false;
    }

    notifyListeners();
    return _message == '';
  }

  Future<void> onLoginButtonTapped() async {
    // _error = false;
    // final bool isValid = await _validatePhoneNumber();
    // if (isValid) {
    //   if (!_isRequestSent) {
    //     _changeRequestSentState(true);
    //     _changeLoadingState(true);

    //     // String? appSignature = await AndroidSmsRetriever.getAppSignature();
    //     //log('app signature is $appSignature');

    //     final GeneralResponse? generalResponse =
    //         await VerificationAPIController().loginUser(
    //       phoneNumber: phoneNumber,
    //       role: 0,
    //       errorHandler: (dynamic error) {
    //         _message = error.toString();
    //         _error = true;
    //       },
    //     );

    //     if (generalResponse!.status.success! == true) {
    //       //! _openModalBottomSheet();

    //       final Map<String, dynamic> object =
    //           generalResponse.result as Map<String, dynamic>;
    //       final String otpId = object['otpId'].toString();
    //       final String userId = object['userId'].toString();

    //       customPrint(name: 'otp Id', data: otpId);
    //       customPrint(name: 'user Id', data: userId);

    //       //* set phoneNumber
    //       await Storage.instance.setphoneNumber(phoneNumber);
    //       await Storage.instance.setotpId(otpId);
    //       await Storage.instance.setuserId(userId);

    //       //* Navigate to OtpScreen
    //       _error = false;
    //       context.pushReplacement(RoutesPath.otp, extra: true);
    //     } else {
    //       _messageResult = generalResponse.status.message!;
    //       notifyListeners();
    //       CustomAlertDialog.showMessageDialog(
    //           context: context,
    //           title: Strings.resultLoginTitle,
    //           description: _messageResult,
    //           textColor: Colors.red,
    //           textButton: Strings.closeDialog,
    //           onPressed: () => Navigator.pop(context));
    //     }
    //     _changeRequestSentState(false);
    //     _changeLoadingState(false);
    //   }
    // }
    // _error = true;

    context.push(RoutesPath.otp);
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    _isRequestSent = false;
    super.dispose();
  }
}
