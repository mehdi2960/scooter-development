import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scooter/src/apis/vehicle_api.dart';
import 'package:scooter/src/models/ride_history_model.dart';

class RideHistoryProvider extends ChangeNotifier {
  RideHistoryProvider() {
    init();
  }

  HistoryModel? _listHistoryModel;
  HistoryModel get listHistoryModel => _listHistoryModel!;

  bool? _isLoading = false;
  bool? get isLoading => _isLoading;

//fetch Data with init
  Future<void> init() async {
    //call api
    //call api from logic
    try {
      _isLoading = true;
      notifyListeners();
      final HistoryModel? rideHistory =
          await VehicleAPIController().getRideHistory(
        errorHandler: (e) {
          log('Error Happened in response 2 : $e');
        },
      );

      _listHistoryModel = rideHistory;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      log('error ocured in catch ride History $e');
    }
  }
}
