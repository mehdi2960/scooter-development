import 'package:arna_logger/arna_logger.dart';
import 'package:scooter/src/constants/api_path.dart';
import 'package:scooter/src/models/trip_cost.dart';
import 'package:web_service/web_service.dart';

class CalculateTripCostAPIController extends APIControllerTools {
  Future<TripCost?> calculateTripCost({
    required int scooterImei,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response response = await Client().get(
        Uri.parse('${Endpoints.CALCULATE_TRIP_COST}$scooterImei'),
      );
      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;
      arnaLogger(data: rawData, title: 'calculate cost response***');
      return TripCost.fromJson(rawData);
    } catch (e) {
      arnaLogger(title: 'calculate trip cost - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  Future<String> payEndRide({
    required String amount,
    required String userId,
    required void Function(dynamic e) errorHandler,
  }) async {
    late String result;
    try {
      final Response? response = await coreAPI.post(
        Uri.parse('${Endpoints.PAYMENT_ENDRIDE}?amount=$amount&userId=$userId'),
      );

      if (response!.statusCode == 200) {
        //go to browser
        result = response.body;
      }

      return result;

      //final Map<String, dynamic> rawData = APIValidation().validation(response) as Map<String, dynamic>;

      // final GeneralResponse generalResponse = GeneralResponse.fromJson(rawData);

      // if (generalResponse.status.success == null) {
      //   return false;
      // }
      // if (!generalResponse.status.success!) {
      //   return false;
      // }

      // return generalResponse.result as bool? ?? false;
    } catch (e) {
      arnaLogger(title: 'checkPayment - error', data: e);
      errorHandler(e);
    }
    return result;
  }
}
