import 'package:custom_logger/custom_logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:uuid/uuid.dart';

import '/src/routes/routes_path.dart';
import '/src/services/storage.dart';

class SplashScreenProvider extends ChangeNotifier {
  SplashScreenProvider(this.context) {
    init();
  }

  final BuildContext context;

  Future<void> init() async {
    final String deviceId = const Uuid().v4();
    await Storage.instance.setdeviceId(deviceId);
    customPrint(name: ' device Id', data: Storage.instance.deviceId);
    Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) {
        if (Storage.instance.isLoggedIn) {
          context.pushReplacement(RoutesPath.home);
        } else {
          context.pushReplacement(
            Storage.instance.firstTime
                ? RoutesPath.onboarding
                //change this later
                // : RoutesPath.onboarding,
                // : RoutesPath.home,
                // : RoutesPath.login,
                // : RoutesPath.rideHistory,
                // : RoutesPath.otp,
                // : RoutesPath.tripWillStart,
                : RoutesPath.userInfo,
          );
        }
      },
    );
  }
}
