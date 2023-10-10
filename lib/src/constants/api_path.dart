import '/src/config/environments.dart';

class Endpoints {
  Endpoints._();

  // static const String LOGIN =
  //     '${Environments.BASE_SERVER_ADDRESS}auth/passwd/login';
  static const String SESSION =
      '${Environments.BASE_SERVER_ADDRESS}auth/session/';

  //Sign Up Login & Verify OTP Url

  // static const String SIGNUP = '${Environments.BASE_SERVER_UMS}User/SignUp';
  static const String SIGNUP =
      '${Environments.BASE_SERVER_AUTHENTICATION}/api/User/Sms/Send';

  //static const String LOGIN = '${Environments.BASE_SERVER_UMS}User/Login';
  static const String LOGIN =
      '${Environments.BASE_SERVER_ADDRESS}/v1/auth/passwd/login';

  static const String VERIFY_OTP =
      '${Environments.BASE_SERVER_AUTHENTICATION}/api/User/Sms/Verify';

  static const String RESEND_OTP =
      '${Environments.BASE_SERVER_AUTHENTICATION}/api/User/Sms/ResendSend';

  static const String VERIFICATION_VERIFICATION_REQUEST =
      'https://tvc.hoodadtechnology.ir/api/Verification/VerificationRequest';
  static const String VERIFICATION_CHECK_OTP =
      'https://tvc.hoodadtechnology.ir/api/Verification/checkOtp';

  // Vehicle
  static const String VEHICLE_FIND_ALL =
      '${Environments.BASE_SERVER_ADDRESS}/v1/vehicle/status/ready';
  static const String VEHICLE_ID =
      '${Environments.BASE_SERVER_ADDRESS}vehicle/info/';
  static const String VEHICLE_SHORT =
      '${Environments.BASE_SERVER_ADDRESS}/v1/vehicle/short/';
  static const String VEHICLE_STATUS =
      '${Environments.BASE_SERVER_ADDRESS}vehicle/status/';
  static const String CALCULATE_TRIP_COST =
      'http://194.5.175.128:9080/price?imei=';

  // Payment
  static const String PAYMENT_ENDRIDE =
      '${Environments.PAYMENT_SERVICE}Payment/payment-request';

  // rules and conditions
  static const String RUELS_CONDITIONS = 'https://mytaal.ir/#ghavanin';

  // fetch token
  static const String FETCH_TOKEN =
      '${Environments.BASE_SERVER_ADDRESS}/v1/auth/account/token';

  // start Ride Scooter
  static const String START_RIDE_SCOOTER =
      '${Environments.BASE_SERVER_ADDRESS}/v1/rides/start/vehicle/';

  // End Ride Scooter
  static const String End_RIDE_SCOOTER =
      '${Environments.BASE_SERVER_ADDRESS}/v1/rides/end/';

  // Get Current User
  static const String GET_CURRENT_USER =
      '${Environments.BASE_SERVER_ADDRESS}/v1/backoffice/user';

  // Get Ride History
  static const String GET_RIDE_HISTORY =
      '${Environments.BASE_SERVER_ADDRESS}/v1/rides/history';

  // Get Active Info
  static const String GET_ACTIVE_INFO =
      '${Environments.BASE_SERVER_ADDRESS}/v1/rides/active';
}
