import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:scooter/src/apis/verification_api.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';
import '../../../constants/strings.dart';

class SignUpScreenProvider extends SafeChangeNotifier {
  SignUpScreenProvider(this.context);

  BuildContext context;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nationalCodeController = TextEditingController();

  bool _isRequestSent = false;
  bool get isRequestSent => _isRequestSent;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final bool _error = false;
  bool get error => _error;

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  String _nationalCode = '';
  String get nationalCode => _nationalCode;

  String _phoneNumberMessage = '';
  String get phoneNumberMessage => _phoneNumberMessage;

  String _nationalCodeMessage = '';
  String get nationalCodeMessage => _nationalCodeMessage;

  String _resultMessage = '';
  String get resultMessage => _resultMessage;
  // int _phoneNumberLength = 0;
  // int get phoneNumberLength => _phoneNumberLength;

  bool _checkBox = false;
  bool get checkBox => _checkBox;
  bool checkBoxMessage = false;

  void _changeLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  bool checkPhoneNumberLength() {
    if (phoneNumberController.text.length < 11) {
      return false;
    }
    return true;
  }

  void _changeRequestSentState(bool state) {
    _isRequestSent = state;
    notifyListeners();
  }

  // void onPhoneNumberTextFieldValueChanged() {
  //   arnaLogger(
  //       data: phoneNumberController.text.length,
  //       title: "phoneNumber input changed");
  //   _phoneNumberLength = phoneNumberController.text.length;
  // }

  // change checkbox state
  void changeCheckBoxState(bool state) {
    _checkBox = state;
    notifyListeners();
  }

  // validate phone number
  Future<bool> _validatePhoneNumber() async {
    _phoneNumber = phoneNumberController.text;
    _phoneNumberMessage = '';

    if (_phoneNumber.isEmpty) {
      _phoneNumberMessage = Strings.pleaseEnterCompletePhoneNumber;
      notifyListeners();
      return false;
    }

    if (!checkPhoneNumber(_phoneNumber)) {
      _phoneNumberMessage = Strings.pleaseEnterCorrectPhoneNumber;
      notifyListeners();
      return false;
    }

    notifyListeners();
    return _phoneNumberMessage == '';
  }

  // validate nationalcode
  Future<bool> _validateNationalCode() async {
    _nationalCode = nationalCodeController.text;
    _nationalCodeMessage = '';

    if (_nationalCode.isEmpty) {
      _nationalCodeMessage = Strings.pleaseEnterCompleteNationalCode;
      notifyListeners();
      return false;
    }

    if (!checkNationalCode(_nationalCode)) {
      _nationalCodeMessage = Strings.pleaseEnterCompleteNationalCode;
      notifyListeners();
      return false;
    }

    notifyListeners();
    return _nationalCodeMessage == '';
  }

  // validate checkbox
  Future<bool> _checkedCheckBox() async {
    _checkBox = checkBox;
    checkBoxMessage = false;

    // initial check box
    if (_checkBox == false) {
      checkBoxMessage = true;
      notifyListeners();
      return false;
    }

    // after check box
    else if (_checkBox == true) {
      checkBoxMessage = true;
      notifyListeners();
      return true;
    }

    // unchecked check box
    else {
      checkBoxMessage = false;
      notifyListeners();
      return false;
    }
  }

  // sign_up button
  Future<void> onSignUpButtonTapped() async {
    final bool isValid = await _validatePhoneNumber();
    // final bool isValidNationalCode = await _validateNationalCode();
    // final bool isChecked = await _checkedCheckBox();
    // if (isValid && isValidNationalCode && isChecked) {
    //   if (!_isRequestSent) {
    //     _changeRequestSentState(true);
    //     _changeLoadingState(true);

    if (isValid) {
      // final GeneralResponse? generalResponse =
      await VerificationAPIController().signUpUser(
        phone: phoneNumberController.text,
        errorHandler: (dynamic error) {
          _phoneNumberMessage = e.toString();
        },
      );

      //save phone number for verify otp
      Storage.instance.setphoneNumber(phoneNumberController.text);

      // if (generalResponse!.status != 1) {
      //   _phoneNumberMessage = generalResponse.errorMessage;
      //   notifyListeners();
      //   CustomAlertDialog.showMessageDialog(
      //     context: context,
      //     title: Strings.resultTitle,
      //     description: generalResponse.errorMessage!,
      //     textButton: Strings.closeDialog,
      //     onPressed: () => Navigator.pop(context),
      //     textColor: AppColors.error,
      //   );
      // } else {
      // naviate to otp screen
      context.push(RoutesPath.otp, extra: false);
      // }
    }
    // else{
    //    _phoneNumberMessage =

    //   }

    // await Storage.instance.setAccessToken(token!);

    //     final GeneralResponse? generalResponse =
    //         await VerificationAPIController().signUpUser(
    //       nationalCode: nationalCode,
    //       phoneNumber: phoneNumber,
    //       errorHandler: (dynamic error) {
    //         _resultMessage = error.toString();
    //       },
    //     );

    //     if (generalResponse!.status.success! == true) {
    //       //! call verify otp api
    //       final Map<String, dynamic> object =
    //           generalResponse.result as Map<String, dynamic>;
    //       final String otpId = object['otpId'].toString();
    //       final String userId = object['userId'].toString();

    //       // Save mobile & userId & otpId
    //       await Storage.instance.setphoneNumber(_phoneNumber);
    //       await Storage.instance.setuserId(userId);
    //       await Storage.instance.setotpId(otpId);
  }
  //   else {
  //     _resultMessage = generalResponse.status.message!;

  //     CustomAlertDialog.showMessageDialog(
  //       context: context,
  //       title: Strings.resultTitle,
  //       description: generalResponse.status.message!,
  //       textButton: Strings.closeDialog,
  //       onPressed: () => Navigator.pop(context),
  //       textColor: AppColors.error,
  //     );
  //   }
  //   _changeRequestSentState(false);
  //   _changeLoadingState(false);
  // }
  // }
  // }
}
