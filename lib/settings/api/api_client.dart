import 'dart:async';
import 'dart:convert';

import 'package:artec_solar_app/settings/exceptions/exceptions.dart';
import 'package:artec_solar_app/settings/mixins/mixins.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part 'env.dart';

abstract class ApiClient {
  Future<Map<String, dynamic>> get(
    String path,
  );
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> data,
  });
  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic> data,
  });
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? data,
  });
  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic> data,
  });

  void setToken(String token);
}

const _defaultTimeOut = Duration(seconds: 15);

class ApiClientImpl with ErrorCallbacksMixin implements ApiClient {
  ApiClientImpl({http.Client? httpClient}) {
    _httpClient = httpClient ?? http.Client();
  }

  late final http.Client _httpClient;

  @override
  Future<Map<String, dynamic>> delete(String url,
      {Map<String, dynamic>? data}) async {
    late http.Response response;
    try {
      response = await _httpClient
          .delete(
            _urlToUri(url),
            body: data,
            headers: _getHeaders(),
          )
          .timeout(_defaultTimeOut);
    } on TimeoutException catch (_) {
      throw RequestTimeoutException();
    }
    _verifyResponseBody(response.body);
    final responseParsed = await compute(jsonDecode, response.body);
    _verifyStatusCode(response.statusCode, responseParsed);
    return responseParsed;
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    late http.Response response;
    try {
      response = await _httpClient
          .get(
            _urlToUri(url),
            headers: _getHeaders(),
          )
          .timeout(_defaultTimeOut);
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    _verifyResponseBody(response.body);
    final responseParsed = await compute(jsonDecode, response.body);
    _verifyStatusCode(response.statusCode, responseParsed);
    return responseParsed;
  }

  @override
  Future<Map<String, dynamic>> post(String url,
      {Map<String, dynamic>? data}) async {
    late http.Response response;
    try {
      response = await _httpClient
          .post(
            _urlToUri(url),
            body: jsonEncode(data),
            // headers: _getHeaders(),
          )
          .timeout(_defaultTimeOut);
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    _verifyResponseBody(response.body);
    final responseParsed = await compute(jsonDecode, response.body);
    _verifyStatusCode(response.statusCode, responseParsed);
    return responseParsed;
  }

  @override
  Future<Map<String, dynamic>> put(String url,
      {Map<String, dynamic>? data}) async {
    late http.Response response;
    try {
      response = await _httpClient
          .put(
            _urlToUri(url),
            body: jsonEncode(data),
            headers: _getHeaders(),
          )
          .timeout(_defaultTimeOut);
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    _verifyResponseBody(response.body);
    final responseParsed = await compute(jsonDecode, response.body);
    _verifyStatusCode(response.statusCode, responseParsed);
    return responseParsed;
  }

  @override
  Future<Map<String, dynamic>> patch(String url,
      {Map<String, dynamic>? data}) async {
    late http.Response response;
    try {
      response = await _httpClient
          .patch(
            _urlToUri(url),
            body: jsonEncode(data),
            headers: _getHeaders(),
          )
          .timeout(_defaultTimeOut);
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    _verifyResponseBody(response.body);
    final responseParsed = await compute(jsonDecode, response.body);
    _verifyStatusCode(response.statusCode, responseParsed);
    return responseParsed;
  }

  Uri _urlToUri(String url) {
    final uriFromUrl = Uri.parse(url);
    return uriFromUrl;
  }

  void _verifyResponseBody(String body) {
    if (body.isEmpty) {
      final error = InvalidRequestException('Erro inesperado');
      notifyErrorListeners(error);
      throw error;
    }
  }

  void _verifyStatusCode(int statusCode, Map<String, dynamic> responseBody) {
    Object? error;
    switch (statusCode) {
      case 400:
        error = InvalidRequestException(
            responseBody[ApiResponseKeys.message].toString());
        break;
      case 401:
        error = UnauthorizedException('Sem autorização');
        break;
      case 500:
      case 501:
      case 503:
        error = ServerException(message: 'Erro interno no servidor');
        break;
      case 200:
        try {
          final success = responseBody[ApiResponseKeys.payload] != null;
          if (success) {
            return;
          }
          error =
              InvalidRequestException(responseBody[ApiResponseKeys.message]);
        } catch (_) {
          error = InvalidRequestException('Erro inesperado');
        }
        break;
      default:
        return;
    }
    notifyErrorListeners(error);
    throw error;
  }

  Map<String, String> _getHeaders() {
    return {
      // 'Authorization': '${User.token}',
    };
  }

  @override
  void setToken(String token) {
    // User.token = token;
  }
}
