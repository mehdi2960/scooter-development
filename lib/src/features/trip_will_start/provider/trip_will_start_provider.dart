import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/apis/vehicle_api.dart';
import 'package:scooter/src/features/shared_providers/ride_provider.dart';
import 'package:scooter/src/models/failed_start_ride_model.dart';
import 'package:scooter/src/models/ride_model.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';

class TripWillStartProvider extends ChangeNotifier {
  TripWillStartProvider(this.context);

  final BuildContext context;

  // call start ride method
  Future<void> startRideButton() async {
    //call api from logic
    try {
      final ride = await VehicleAPIController().startRideScooter(
        id: Storage.instance.scooterId!,
        errorHandler: (e) {},
      );

      if (ride is Ride) {
        log('start Time is : ${ride.startTime}');

        context.read<RideProvider>().startRide();

        context.push(RoutesPath.home);
      } else if (ride is FailedStartRide) {
      } else {
        log('unknow ride type');
      }
    } catch (e) {
      log('error ocured in catch $e');
    }
  }

  // call End ride method
  Future<void> endtRideButton() async {
    //call api from logic
    try {
      final dynamic response = await VehicleAPIController().endRideScooter(
        errorHandler: (e) {},
      );

      log('start Time is : ${response}');

      // context.push(RoutesPath.home);
    } catch (e) {
      log('error ocured in catch $e');
    }
  }
}
