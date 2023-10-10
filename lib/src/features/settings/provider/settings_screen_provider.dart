import 'package:flutter/material.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class SettingsScreenProvider extends SafeChangeNotifier {
  SettingsScreenProvider(this.context);

  final BuildContext context;

  bool _recieveEmail = false;
  bool get recieveEmail => _recieveEmail;

  bool _recieveTripInfoSms = true;
  bool get recieveTripInfoSms => _recieveTripInfoSms;

  bool _recieveTripTransactionSms = false;
  bool get recieveTripTransactionSms => _recieveTripTransactionSms;

  bool _showTraffic = false;
  bool get showTraffic => _showTraffic;

  bool _showPublicTransport = false;
  bool get showPublicTransport => _showPublicTransport;

  void toggleRecieveEmail(bool newValue) {
    _recieveEmail = newValue;
    notifyListeners();
  }

  void toggleRecieveTripInfoSms(bool newValue) {
    _recieveTripInfoSms = newValue;
    notifyListeners();
  }

  void toggleRecieveTripTransactionSms(bool newValue) {
    _recieveTripTransactionSms = newValue;
    notifyListeners();
  }

  void toggleShowTraffic(bool newValue) {
    _showTraffic = newValue;
    notifyListeners();
  }

  void toggleShowPublicTransport(bool newValue) {
    _showPublicTransport = newValue;
    notifyListeners();
  }
}
