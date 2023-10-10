import '/src/error/error_interface.dart';

class APIException implements ErrorInterface {
  APIException(this._message);

  final String _message;

  @override
  String toString() => _message;
}

class FetchDataException extends APIException {
  FetchDataException(super.message);
}

class BadRequestException extends APIException {
  BadRequestException(dynamic message) : super(message.toString());
}

class UnauthorizedException extends APIException {
  UnauthorizedException(dynamic message) : super(message.toString());
}

class ForbiddenException extends APIException {
  ForbiddenException(dynamic message) : super(message.toString());
}

class InvalidInputException extends APIException {
  InvalidInputException(super.message);
}

class InternalServerError extends APIException {
  InternalServerError(super.message);
}

class NullResponse extends APIException {
  NullResponse(super.message);
}

class NullResponseBody extends APIException {
  NullResponseBody(super.message);
}

class ServerError extends APIException {
  ServerError(super.message);
}

class SuccessError extends APIException {
  SuccessError(super.message);
}
