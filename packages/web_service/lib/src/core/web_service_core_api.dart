import 'dart:convert';
import 'dart:io';

import 'package:custom_logger/custom_logger.dart';
import 'package:http/http.dart';

class WebServiceCoreApi {
  WebServiceCoreApi._();
  factory WebServiceCoreApi.getCoreAPI() => _coreAPI;

  static final WebServiceCoreApi _coreAPI = WebServiceCoreApi._();
  final Client _client = Client();
  final String _serverTokenKey = 'Authorization';
  final Map<String, String> _headers = <String, String>{
    HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
  };

  Future<Response?> head(
    Uri url, {
    Map<String, String>? headers,
    String? serverTokenKey,
    String? token,
  }) async {
    final String serverKey = serverTokenKey ?? _serverTokenKey;
    if (token != null) {
      _headers.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    try {
      final Map<String, String> finalHeaders = _headers
        ..addAll(headers ?? <String, String>{});
      customPrint(name: 'Head - Headers', data: finalHeaders);

      return await _client.head(url, headers: finalHeaders);
    } catch (e) {
      customPrint(name: 'Head - Error', data: e);
      return null;
    }
  }

  Future<Response?> get(
    Uri url, {
    Map<String, String>? headers,
    String? serverTokenKey,
    String? token,
  }) async {
    final String serverKey = serverTokenKey ?? _serverTokenKey;
    if (token != null) {
      _headers.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    try {
      final Map<String, String> finalHeaders = _headers
        ..addAll(headers ?? <String, String>{});
      customPrint(name: 'Get - Headers', data: finalHeaders);

      return await _client.get(url, headers: finalHeaders);
    } catch (e) {
      customPrint(name: 'Get - Error', data: e);
      return null;
    }
  }

  Future<Response?> post(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? serverTokenKey,
    String? token,
  }) async {
    final String serverKey = serverTokenKey ?? _serverTokenKey;
    if (token != null) {
      _headers.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    try {
      final String? finalBody = body == null ? null : jsonEncode(body);
      customPrint(name: 'Post - Body', data: finalBody);

      final Map<String, String> finalHeaders = _headers
        ..addAll(headers ?? <String, String>{});
      customPrint(name: 'Post - Headers', data: finalHeaders);

      return await _client.post(url, headers: finalHeaders, body: finalBody);
    } catch (e) {
      customPrint(name: 'Post - Error', data: e);
      return null;
    }
  }

  Future<Response?> put(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? serverTokenKey,
    String? token,
  }) async {
    final String serverKey = serverTokenKey ?? _serverTokenKey;
    if (token != null) {
      _headers.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    try {
      final String? finalBody = body == null ? null : jsonEncode(body);
      customPrint(name: 'Put - Body', data: finalBody);

      final Map<String, String> finalHeaders = _headers
        ..addAll(headers ?? <String, String>{});
      customPrint(name: 'Put - Headers', data: finalHeaders);

      return await _client.put(url, headers: finalHeaders, body: finalBody);
    } catch (e) {
      customPrint(name: 'Put - Error', data: e);
      return null;
    }
  }

  Future<Response?> patch(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? serverTokenKey,
    String? token,
  }) async {
    final String serverKey = serverTokenKey ?? _serverTokenKey;
    if (token != null) {
      _headers.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    try {
      final String? finalBody = body == null ? null : jsonEncode(body);
      customPrint(name: 'Patch - Body', data: finalBody);

      final Map<String, String> finalHeaders = _headers
        ..addAll(headers ?? <String, String>{});
      customPrint(name: 'Patch - Headers', data: finalHeaders);

      return await _client.patch(url, headers: finalHeaders, body: finalBody);
    } catch (e) {
      customPrint(name: 'Patch - Error', data: e);
      return null;
    }
  }

  Future<Response?> delete(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? serverTokenKey,
    String? token,
  }) async {
    final String serverKey = serverTokenKey ?? _serverTokenKey;
    if (token != null) {
      _headers.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    try {
      final String? finalBody = body == null ? null : jsonEncode(body);
      customPrint(name: 'Delete - Body', data: finalBody);

      final Map<String, String> finalHeaders = _headers
        ..addAll(headers ?? <String, String>{});
      customPrint(name: 'Delete - Headers', data: finalHeaders);

      return await _client.delete(url, headers: finalHeaders, body: finalBody);
    } catch (e) {
      customPrint(name: 'Delete - Error', data: e);
      return null;
    }
  }

  Future<Response?> multipartPost(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, String>? fields,
    List<MultipartFile>? files,
    String? serverToken,
    String? token,
  }) async {
    final String serverKey = serverToken ?? _serverTokenKey;
    if (token != null) {
      _headers.addAll(<String, String>{serverKey: 'Bearer $token'});
    }
    try {
      final MultipartRequest request = MultipartRequest('POST', url);

      if (fields != null) {
        request.fields.addAll(fields);
      }

      if (files != null) {
        request.files.addAll(files);
      }

      final StreamedResponse response = await request.send();

      return await Response.fromStream(response);
    } catch (e) {
      customPrint(name: 'Multipart Post - Error', data: e);
      return null;
    }
  }
}
