enum HttpMethod { get, post, put, delete, patch }

class HttpRequestData {
  final String baseUrl;
  final String endpoint;
  final Map<String, dynamic>? body;
  final Map<String, String>? headers;
  final HttpMethod method;

  HttpRequestData({
    required this.endpoint,
    required this.baseUrl,
    this.body,
    this.headers,
    this.method = HttpMethod.get,
  });
}
