import 'dart:async';
import 'dart:developer';
import 'package:custom_logger/custom_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:provider/provider.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:scooter/src/features/home/widgets/success_payment_bottom_sheet.dart';
import 'package:scooter/src/features/home/widgets/unsuccess_payment_bottom_sheet.dart';
import 'package:scooter/src/features/shared_providers/vehicle_provider.dart';
import 'package:scooter/src/features/shared_widgets/custom_bottom_sheet.dart';
import 'package:scooter/src/models/end_ride_model.dart';
import 'package:uni_links/uni_links.dart';
import '/src/apis/vehicle_api.dart';
import '/src/routes/routes_path.dart';
import '../../../models/scooter.dart';
import '../../shared_providers/ride_provider.dart';

class HomeScreenProvider extends SafeChangeNotifier {
  HomeScreenProvider(this.context) {
    init();
  }

  final BuildContext context;

  MapController mapController = MapController(
    location: const LatLng(35.68, 51.41),
  );

  LatLng? currentUserLocation;

  Offset? _dragStart;
  Offset? get dragStart => _dragStart;

  double _scaleStart = 1.0;
  double get scaleStart => _scaleStart;

  Timer? timer;

  bool _error = false;
  bool get error => _error;

  bool isRiding = false;

  int? debtAmount;

  late StreamSubscription<dynamic> _sub;

  Future<void> init() async {
    isRiding = context.watch<RideProvider>().isRiding;

    try {
      // timer = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
      await getUserLocation();
      // });
    } catch (e) {
      customPrint(data: e);
    }

    //check link to open app
    _initUniLinks();

    getScooters();

    // timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
    //   getScooters();
    // });
  }

  Future<void> _initUniLinks() async {
    // Get the initial link
    // String? initialLink = await getInitialLink();
    //_handleLink(initialLink!);

    _sub = linkStream.listen((String? link) {
      _handleLink(link!);
    }, onError: (dynamic err) {});
  }

  void _handleLink(String link) {
    if (link != null && link.startsWith('taal://hoodadtech.taal')) {
      final params = Uri.parse(link).queryParameters;

      if (params.containsKey('OK')) {
        CustomBottomSheet.showCustomBottomSheetWidgets(
            context: context, widget: const SuccessPaymentBottomSheet());
        debtAmount = null;
      } else {
        CustomBottomSheet.showCustomBottomSheetWidgets(
            context: context, widget: const UnSuccessPaymentBottomSheet());
      }
    }
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future<void>.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future<void>.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future<void>.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    try {
      final Position location = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
      );

      if (location != null && location.longitude != null) {
        currentUserLocation = LatLng(location.latitude, location.longitude);
        customPrint(name: 'User Location', data: currentUserLocation);

        mapController.center = currentUserLocation!;
      }
    } catch (e) {
      customPrint(name: 'getUserLocation - Error', data: e);
    }
  }

  Future<void> getScooters() async {
    final List<List<double>> tehranCoordinates = [
      [35.6892, 51.3136],
      [35.7448, 51.3769],
      [35.6894, 51.3850],
      [35.6998, 51.3376],
      [35.7680, 51.4113],
      [35.7325, 51.4222],
      [35.7345, 51.3649],
      [35.7579, 51.4043],
      [35.7054, 51.3720],
      [35.7506, 51.3217],
    ];

    // List<Vehicle> listVehicle = [];

    for (var i = 0; i < tehranCoordinates.length; i++) {
      // final Scooter scooter = Scooter(
      //     id: '${i + 1}',
      //     short: 'short',
      //     imei: 'imei',
      //     name: 'name',
      //     zone: 1,
      //     type: 'type',
      //     status: 'status',
      //     bounty: 1,
      //     location: tehranCoordinates[i],
      //     battery: 1,
      //     locked: false,
      //     updated: DateTime.now(),
      //     mileage: 1);

      //listVehicle.add(Vehicle(scooter: scooter, etag: 'etag'));
    }

    final VehicleProvider vehicleProvider = context.read<VehicleProvider>();
    final List<Scooter> _scooters = await VehicleAPIController().findAllScooter(
      lat: '35.707758',
      lng: '51.419801',
      radius: '10000',
      errorHandler: (dynamic error) {},
    );
    // final List<Vehicle> scooters = listVehicle;
    final List<Scooter> scooters = _scooters;
    if (scooters.isNotEmpty) {
      log('scooter is not empty the count of this is : ${scooters.length}');
      vehicleProvider.clearVehicles();
      for (final Scooter _scooter in scooters) {
        if (_scooter != null) {
          customPrint(name: 'Vehicle', data: _scooter);
          vehicleProvider.addVehicles(_scooter);
        }
      }
      notifyListeners();
    }
  }

  void gotoUserLocation() {
    if (currentUserLocation != null) {
      mapController.center = currentUserLocation!;
      notifyListeners();
    } else {
      getUserLocation();
    }
  }

  double clamp(double x, double min, double max) {
    if (x < min) {
      x = min;
    }
    if (x > max) {
      x = max;
    }

    return x;
  }

  void onMapDoubleTap(MapTransformer transformer, Offset position) {
    const double delta = 0.5;
    final double zoom = clamp(mapController.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    notifyListeners();
  }

  void onMapScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void onMapScaleUpdate(
    ScaleUpdateDetails details,
    MapTransformer transformer,
  ) {
    final double scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      mapController.zoom += 0.02;

      notifyListeners();
    } else if (scaleDiff < 0) {
      mapController.zoom -= 0.02;
      if (mapController.zoom < 1) {
        mapController.zoom = 1;
      }
      notifyListeners();
    } else {
      final Offset now = details.focalPoint;
      Offset diff = now - _dragStart!;
      _dragStart = now;
      final double h = transformer.constraints.maxHeight;

      final Rect vp = transformer.getViewport();
      if (diff.dy < 0 && vp.bottom - diff.dy < h) {
        diff = Offset(diff.dx, 0);
      }

      if (diff.dy > 0 && vp.top - diff.dy > 0) {
        diff = Offset(diff.dx, 0);
      }

      transformer.drag(diff.dx, diff.dy);
      notifyListeners();
    }
  }

  void onPointerSignal(PointerSignalEvent event, MapTransformer transformer) {
    if (event is PointerScrollEvent) {
      final double delta = event.scrollDelta.dy / -1000.0;
      final double zoom = clamp(mapController.zoom + delta, 2, 18);

      transformer.setZoomInPlace(zoom, event.localPosition);
      notifyListeners();
    }
  }

  void goToScanCodeScreen() {
    //uncomment these lines later
    // debtAmount != null
    //     ? CustomAlertDialog.showMessageDialog(
    //         context: context,
    //         title: Strings.payDebt,
    //         description: Strings.payDebtBeforeNextTrip,
    //         textColor: AppColors.dark,
    //         textButton: Strings.returnBack,
    //         onPressed: () {
    //           context.pop();
    //         })
    //     :context.push(RoutesPath.scanCode)

    //context.push(RoutesPath.tripWillStart);
    context.push(RoutesPath.scanCode);
  }

  Future<void> stopRide() async {
    log('stop Ride Method occured');
    final endRide = await VehicleAPIController().endRideScooter(
      errorHandler: (e) {
        log('Error happened in StopRidding $e');
      },
    );

    if (endRide is EndRideModel) {
      // End Ride Scooter

      context.read<RideProvider>().stopRide();
      notifyListeners();
      context.pop();
    } else {
      log('Error Occured in ');
    }
    // final Scooter? scooter = await VehicleAPIController().getInfoByShortKey(
    //   shortKey: Storage.instance.scooterShortKey!,
    //   errorHandler: (dynamic error) => _error = true,
    // );
    // if (scooter != null) {
    //   final TripCost? tripCost =
    //       await CalculateTripCostAPIController().calculateTripCost(
    //     scooterImei: int.parse(scooter.imei!),
    //     errorHandler: (dynamic error) => _error = true,
    //   );
    //   debtAmount = tripCost!.cost;
    //   notifyListeners();
    //   final bool scooterResponse =
    //       await VehicleAPIController().startStopScooter(
    //     imei: scooter.imei!,
    //     shouldStart: false,
    //     errorHandler: (dynamic error) => _error = true,
    //   );
    //   if (scooterResponse) {
    //     context.read<RideProvider>().stopRide();
    //     isRiding = false;
    //   } else {}
    // } else {
    //   _error = true;
    // }
    // notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    _sub.cancel();
    super.dispose();
  }
}
