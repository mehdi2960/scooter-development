// ignore_for_file: only_throw_errors

import 'dart:convert';

import 'package:http/http.dart' as http;

import '/src/error/api_error_exceptions.dart';
import '/src/error/api_error_handler.dart';

class APIValidation {
  dynamic _validation(http.Response? response) {
    if (response == null) {
      throw NullResponse('');
    }

    if (response.statusCode < 200 || response.statusCode >= 300) {
      APIErrorHandler().getAPIExceptionHandler(response);
    }

    final dynamic rawData = jsonDecode(utf8.decode(response.bodyBytes));

    if (rawData == null) {
      throw NullResponseBody('');
    }

    return rawData;
  }

  dynamic validation(http.Response? response) {
    final dynamic rawData = _validation(response);
    return rawData;
  }

  List<Map<String, dynamic>> listValidation(http.Response? response) {
    final List<dynamic> rawData = _validation(response) as List<dynamic>;
    return List<Map<String, dynamic>>.from(rawData);
  }
}
