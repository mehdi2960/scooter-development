import 'package:flutter/foundation.dart' show protected;

abstract class ErrorInterface implements Exception {
  ErrorInterface(this._message);

  @protected
  final String _message;

  @override
  String toString() => _message;
}
