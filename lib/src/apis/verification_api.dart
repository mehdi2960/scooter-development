import 'dart:developer';
import 'package:arna_logger/arna_logger.dart';
import 'package:scooter/src/config/environments.dart';
import 'package:scooter/src/services/storage.dart';
import 'package:web_service/web_service.dart';
import '/src/constants/api_path.dart';
import '/src/models/general_response.dart';

class VerificationAPIController extends APIControllerTools {
  // Resend OTP
  Future<GeneralResponse?> resendOtp({
    required String phoneNumber,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.post(
        Uri.parse(Endpoints.RESEND_OTP),
        body: <String, dynamic>{
          'phone': phoneNumber,
        },
      );

      final Map<String, dynamic> rawData = APIValidation().validation(
        response,
      ) as Map<String, dynamic>;

      final GeneralResponse generalResponse = GeneralResponse.fromJson(rawData);
      // if (generalResponse.status == null) {
      //   return null;
      // }
      // if (!generalResponse.status.success!) {
      //   return null;
      // }
      return generalResponse;
    } catch (e) {
      arnaLogger(title: 'verificationRequest - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  // Future<bool> checkOtp({
  //   required int id,
  //   required String otp,
  //   required void Function(dynamic e) errorHandler,
  // }) async {
  //   try {
  //     final Response? response = await coreAPI.post(
  //       Uri.parse(Endpoints.VERIFICATION_CHECK_OTP),
  //       body: <String, dynamic>{
  //         'id': id,
  //         'otp': otp,
  //       },
  //     );

  //     final Map<String, dynamic> rawData = APIValidation().validation(
  //       response,
  //     ) as Map<String, dynamic>;

  //     final GeneralResponse generalResponse = GeneralResponse.fromJson(rawData);
  //     if (generalResponse.status.success == null) {
  //       return false;
  //     }
  //     if (!generalResponse.status.success!) {
  //       return false;
  //     }

  //     return generalResponse.result as bool? ?? false;
  //   } catch (e) {
  //     arnaLogger(title: 'checkOtp - error', data: e);
  //     errorHandler(e);
  //   }
  //   return false;
  // }

//sign-up User
  Future<GeneralResponse?> signUpUser({
    required String phone,
    // required String email,
    // required String phoneNumber,
    // required String password,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI
          .post(Uri.parse(Endpoints.SIGNUP), body: <String, dynamic>{
        'phone': phone,
        // 'email': email,
        // 'phoneNumber': phoneNumber,
        // 'password': password,
        // 'appVersion': Environments.APP_VERSION,
        // 'role': 0
      });

      log('sign up response : ${response!.body}');

      // arnaLogger(title: 'user sign up response', data: response!.body);

      final Map<String, dynamic> rawData =
          APIValidation().validation(response) as Map<String, dynamic>;

      final GeneralResponse generalResponse = GeneralResponse.fromJson(rawData);

      return generalResponse;
    } catch (e) {
      arnaLogger(title: 'Sign Up Request - error', data: e);
      errorHandler(e);
    }
    return null;
  }

//verify User
  Future<GeneralResponse?> verifyOTP({
    // required String phone,
    required String smsCode,
    // required String userId,
    // required String otpId,
    // required String otpCode,
    // required String deviceId,
    // required int mode,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI
          .post(Uri.parse(Endpoints.VERIFY_OTP), body: <String, dynamic>{
        // 'userId': userId,
        // 'otpId': otpId,
        // 'otpCode': otpCode,
        // 'deviceId': deviceId,
        // 'mood': mode
        'phone': Storage.instance.phoneNumber,
        'smsCode': smsCode
      });

      log('phone is ${Storage.instance.phoneNumber} , smsCod : $smsCode');

      arnaLogger(title: 'verrifyOTP response', data: response!.body);

      final Map<String, dynamic> rawData =
          APIValidation().validation(response) as Map<String, dynamic>;

      final GeneralResponse generalResponse = GeneralResponse.fromJson(rawData);

      return generalResponse;
    } catch (e) {
      // arnaLogger(title: 'Verify User Request - error', data: e);
      log('error occured in verify otp $e');
      errorHandler(e);
    }
    return null;
  }

// Login User
  Future<GeneralResponse?> loginUser({
    required String phoneNumber,
    required int role,
    required void Function(dynamic e) errorHandler,
  }) async {
    try {
      final Response? response = await coreAPI.post(Uri.parse(Endpoints.LOGIN),
          body: <String, dynamic>{
            'phoneNumber': phoneNumber,
            'appVersion': Environments.APP_VERSION,
            'role': role
          });

      final Map<String, dynamic> rawData =
          APIValidation().validation(response) as Map<String, dynamic>;

      final GeneralResponse generalResponse = GeneralResponse.fromJson(rawData);

      arnaLogger(title: 'login test response', data: response!.body);

      return generalResponse;
    } catch (e) {
      arnaLogger(title: 'Login User Request - error', data: e);
      errorHandler(e);
    }
    return null;
  }

  // Future<Tokens?> passwordLogin({
  //   required void Function(dynamic e) errorHandler,
  // }) async {
  //   try {
  //     final Response? response = await coreAPI.post(
  //       Uri.parse(Endpoints.LOGIN),
  //       body: <String, dynamic>{
  //         'email': 'taal@mailinator.com',
  //         'password': '12345678'
  //       },
  //     );

  //     final Map<String, dynamic> rawData = APIValidation().validation(
  //       response,
  //     ) as Map<String, dynamic>;

  //     return Tokens.fromRawJson(rawData);
  //   } catch (e) {
  //     arnaLogger(title: 'passwordLogin - error', data: e);
  //     errorHandler(e);
  //   }
  //   return null;
  // }

  // Future<Tokens?> session({
  //   required String authenticationToken,
  //   required void Function(dynamic e) errorHandler,
  // }) async {
  //   try {
  //     final Response? response = await coreAPI.post(
  //       Uri.parse(Endpoints.SESSION),
  //       body: <String, dynamic>{
  //         'authenticationToken': authenticationToken,
  //       },
  //     );

  //     final Map<String, dynamic> rawData = APIValidation().validation(
  //       response,
  //     ) as Map<String, dynamic>;

  //     return Tokens.fromRawJson(rawData);
  //   } catch (e) {
  //     customPrint(name: 'session - error', data: e);
  //     errorHandler(e);
  //   }
  //   return null;
  // }
}
