import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:scooter/src/apis/vehicle_api.dart';
import 'package:scooter/src/models/user_model.dart';
import 'package:scooter/src/services/storage.dart';

class PrfileInfoProvider extends ChangeNotifier {
  PrfileInfoProvider() {
    init();
  }

  // call api when com to the application
  Future<void> init() async {
    //create url and endpoints

    final User? user = await VehicleAPIController().getcurrentUser(
      errorHandler: (dynamic e) {
        log('Error Happened in fetching Response2 $e');
      },
    );

    log('user phone is ${user!.phone}');

    Storage.instance.setuserId(user.id);
    Storage.instance.setprofileImage(user.profile);
    Storage.instance.setProfileName(user.name);
    Storage.instance.setphoneNumber(user.phone);
  }
}
