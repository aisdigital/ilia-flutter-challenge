import 'package:core/client/http_response.dart';
import 'package:core/client/request_data.dart';

abstract class HttpClient {
  Future<HttpResponse<Map<String, dynamic>>> request(HttpRequestData requestData);
}
