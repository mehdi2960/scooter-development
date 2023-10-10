import 'package:http/http.dart' as http;

import '/src/error/api_error_exceptions.dart';

class APIErrorHandler {
  dynamic getAPIExceptionHandler(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorizedException(response.body);
      case 403:
        throw ForbiddenException(response.body);
      case 500:
        throw InternalServerError(response.body);
      default:
        throw FetchDataException(
          'Error occured while communicating with server with status code : ${response.statusCode}',
        );
    }
  }
}
