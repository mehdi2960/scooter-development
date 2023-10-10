import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../../constants/strings.dart';

class NationalCodeProvider extends SafeChangeNotifier {
  NationalCodeProvider(this.context);

  final BuildContext context;

  TextEditingController nationalCodeController = TextEditingController();

  bool _isRequestSent = false;
  bool get isRequestSent => _isRequestSent;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _error = false;
  bool get error => _error;

  String _nationalCode = '';
  String get nationalCode => _nationalCode;

  String _nationalCodeMessage = '';
  String get nationalCodeMessage => _nationalCodeMessage;

  String _message = '';
  String get message => _message;

  String _messageResult = '';
  String get messageResult => _messageResult;

  bool _checkBox = true;
  bool get checkBox => _checkBox;
  bool checkBoxMessage = false;

  void changeCheckBoxState(bool state) {
    _checkBox = state;
    notifyListeners();
  }

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

  Future<bool> _checkedCheckBox() async {
    _checkBox = checkBox;
    checkBoxMessage = false;

    if (_checkBox == false) {
      checkBoxMessage = true;
      notifyListeners();
      return false;
    } else if (_checkBox == true) {
      checkBoxMessage = true;
      notifyListeners();
      return true;
    } else {
      checkBoxMessage = false;
      notifyListeners();
      return false;
    }
  }

  void _changeLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  void _changeRequestSentState(bool state) {
    _isRequestSent = state;
    notifyListeners();
  }

  Future<void> registerWithNationalCode() async {
    // Check CheckBox
    final bool validateNationalCode = await _validateNationalCode();
    final bool checkedCheckBox = await _checkedCheckBox();

    if (validateNationalCode && checkedCheckBox) {
      // call register api
    }
  }
}
