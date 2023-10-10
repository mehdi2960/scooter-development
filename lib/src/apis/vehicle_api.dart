import 'dart:developer';

import 'package:arna_logger/arna_logger.dart';
import 'package:scooter/src/models/end_ride_model.dart';
import 'package:scooter/src/models/failed_start_ride_model.dart';
import 'package:scooter/src/models/ride_history_model.dart';
import 'package:scooter/src/models/ride_model.dart';
import 'package:scooter/src/models/user_model.dart';
import 'package:scooter/src/models/vehicle.dart';
import 'package:web_service/web_service.dart';

import '/src/constants/api_path.dart';
import '/src/models/scooter.dart';
import '/src/services/storage.dart';

class VehicleAPIController extends APIControllerTools {
  Future<List<Scooter>> findAllScooter({
    required String lat,
    required String lng,
    required String radius,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      // final Response? response = await coreAPI.post(
      //   Uri.parse(Endpoints.VEHICLE_FIND_ALL),
      //   token: Storage.instance.accessToken,
      // );

      final Response response = await Client().get(
          Uri.parse(
              '${Endpoints.VEHICLE_FIND_ALL}?lat=$lat&lng=$lng&radius=$radius'),
          headers: _headers);

      log('send end point is ${Endpoints.VEHICLE_FIND_ALL}?lat=$lat&lng=$lng&radius=$radius , headers: $_headers');

      log('response get All Scooter is ${response.body}');

      final List<Map<String, dynamic>> rawData =
          APIValidation().listValidation(response);

      // return vehicleListFromJson(rawData);
      return scooterListFromJson(rawData);
    } catch (e) {
      arnaLogger(title: 'findAllScooter - error', data: e);
      errorHandler(e);
    }
    return <Scooter>[];
  }

  Future<Scooter?> getInfoById({
    required String id,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.get(
        Uri.parse('${Endpoints.VEHICLE_ID}$id'),
        token: Storage.instance.accessToken,
      );

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      return Scooter.fromRawJson(rawData);
    } catch (e) {
      arnaLogger(title: 'getInfoById - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  Future<String?> getToken({
    //required String id,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.get(
        Uri.parse(Endpoints.FETCH_TOKEN),
        token: Storage.instance.accessToken,
      );

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      log('token response body is is ${response!.body} ');

      // return Scooter.fromJson(rawData);

      log('auth token is ${rawData['authenticationToken']}');

      return rawData['authenticationToken'].toString();
    } catch (e) {
      arnaLogger(title: 'getInfoById - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  // Future<Scooter?> getInfoByShortKey({
  //   required String shortKey,
  //   required void Function(dynamic e) errorHandler,
  // }) async {
  //   try {
  //     final Response? response = await coreAPI.get(
  //       Uri.parse('${Endpoints.VEHICLE_SHORT}$shortKey'),
  //       token: Storage.instance.accessToken,
  //     );

  //     final Map<String, dynamic> rawData = APIValidation().validation(
  //       response,
  //     ) as Map<String, dynamic>;

  //     return Scooter.fromRawJson(rawData);
  //   } catch (e) {
  //     arnaLogger(title: 'getInfoByShortKey - error', data: e);
  //     errorHandler(e);
  //   }
  //   return null;
  // }

// get scooter info by shortKey
  Future<Vehicle?> getInfoByShortKey({
    required String shortKey,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.get(
          Uri.parse('${Endpoints.VEHICLE_SHORT}$shortKey'),
          headers: _headers);

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      return Vehicle.fromRawJson(rawData);
    } catch (e) {
      arnaLogger(title: 'getInfoByShortKey - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  Future<List<Scooter>> getInfoByStatus({
    required String status,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.get(
        Uri.parse('${Endpoints.VEHICLE_SHORT}$status'),
        token: Storage.instance.accessToken,
      );

      final List<Map<String, dynamic>> rawData =
          APIValidation().listValidation(response);

      return scooterListFromJson(rawData);
    } catch (e) {
      arnaLogger(title: 'getInfoByStatus - error', data: e);
      errorHandler(e);
    }
    return <Scooter>[];
  }

  Future<bool> startStopScooter({
    required String imei,
    required bool shouldStart,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.post(
        body: <String, dynamic>{
          'set_modes': <String, dynamic>{
            'unlock': shouldStart ? 2 : 1,
          }
        },
        Uri.parse('http://194.5.175.148:10098/v1/iotdevice/command/imei/$imei'),
        token: Storage.instance.accessToken,
      );

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      arnaLogger(data: rawData, title: 'scooter start response');
      return true;
    } catch (e) {
      arnaLogger(title: 'startScooter - error', data: e);
      errorHandler(e);
    }
    return true;
  }

  // start ride scooter
  Future<dynamic> startRideScooter({
    required String id,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.post(
          Uri.parse('${Endpoints.START_RIDE_SCOOTER}$id'),
          headers: _headers);

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      arnaLogger(data: rawData, title: 'start_ride_scooter response');

      if (response!.statusCode == 201) {
        log('status code1 is .. ${response.statusCode}');
        return Ride.fromJson(rawData);
      } else {
        log('status code2 is .. ${response.statusCode}');
        return FailedStartRide.fromJson(rawData);
      }
    } catch (e) {
      arnaLogger(title: 'startScooter - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  // End ride scooter
  Future<dynamic> endRideScooter({
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI
          .post(Uri.parse(Endpoints.End_RIDE_SCOOTER), headers: _headers);

      log(' EndRide request ${Endpoints.End_RIDE_SCOOTER} , headers: $_headers');
      log(' EndRide response is ${response!.body}');

      if (response.statusCode == 200) {
        log(' status code 1  is : ${response.statusCode} ');

        log(' response 1  is : ${response.body} ');

        final Map<String, dynamic> rawData = APIValidation().validation(
          response,
        ) as Map<String, dynamic>;

        arnaLogger(data: rawData, title: 'end_ride_scooter  response');

        return EndRideModel.fromJson(rawData);
      } else {
        log(' status code 2  is : ${response.statusCode} ');

        log(' response 2  is : ${response.body} ');

        return response.body.toString();
      }
    } catch (e) {
      arnaLogger(title: 'startScooter - error', data: e);
      errorHandler(e);
    }
  }

// Get Current User
  Future<User?> getcurrentUser({
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI
          .get(Uri.parse(Endpoints.GET_CURRENT_USER), headers: _headers);

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      arnaLogger(title: 'get Current User - response', data: response!.body);

      return User.fromJson(rawData);
    } catch (e) {
      arnaLogger(title: 'get Current User - error', data: e);
      errorHandler(e);
    }
    return null;
  }

// Get Ride History
  Future<HistoryModel?> getRideHistory({
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI
          .get(Uri.parse(Endpoints.GET_RIDE_HISTORY), headers: _headers);

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      arnaLogger(title: 'get Ride History - response', data: response!.body);

      return HistoryModel.fromJson(rawData);
    } catch (e) {
      arnaLogger(title: 'get Ride History - error', data: e);
      errorHandler(e);
    }
    return null;
  }

// Get Active Info
  Future<dynamic> getActiveInfo({
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI
          .get(Uri.parse(Endpoints.GET_ACTIVE_INFO), headers: _headers);

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      arnaLogger(title: 'get Active Info - response', data: response!.body);

      return rawData;
    } catch (e) {
      arnaLogger(title: 'get Active Info - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  final Map<String, String> _headers = <String, String>{
    'X-Access-Token': Storage.instance.accessToken!
  };
}
