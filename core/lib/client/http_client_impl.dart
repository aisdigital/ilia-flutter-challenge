import 'dart:convert';

import 'package:core/client/http_client.dart';
import 'package:core/client/http_response.dart';
import 'package:core/client/request_data.dart';
import 'package:core/error/default_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpClientImpl implements HttpClient {
  final http.Client client;

  HttpClientImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<HttpResponse<Map<String, dynamic>>> request(HttpRequestData requestData) async {
    try {
      final uri = Uri.parse('${requestData.baseUrl}${requestData.endpoint}');
      final headers = _buildHeaders(requestData.headers);

      final response = await _sendHttpRequest(requestData, uri, headers);

      return HttpResponse.success(
        json.decode(response.body),
        statusCode: response.statusCode,
      );
    } catch (e) {
      return HttpResponse.error(
        DefaultException(
          message: kDebugMode
              ? 'An error occurred while processing the request: $e'
              : "An error occurred while performing the action.",
        ),
      );
    }
  }

  Map<String, String> _buildHeaders(Map<String, String>? requestHeaders) {
    final defaultHeaders = {'Content-Type': 'application/json'};
    return {...defaultHeaders, ...?requestHeaders};
  }

  Future<http.Response> _sendHttpRequest(HttpRequestData requestData, Uri uri, Map<String, String> headers) {
    switch (requestData.method) {
      case HttpMethod.put:
        return client.put(uri, headers: headers, body: json.encode(requestData.body));
      case HttpMethod.get:
        return client.get(uri, headers: headers);
      case HttpMethod.post:
        return client.post(uri, headers: headers, body: json.encode(requestData.body));
      case HttpMethod.delete:
        return client.delete(uri, headers: headers);
      case HttpMethod.patch:
        return client.patch(uri, headers: headers, body: json.encode(requestData.body));
      default:
        throw ArgumentError('Invalid HTTP method');
    }
  }
}
