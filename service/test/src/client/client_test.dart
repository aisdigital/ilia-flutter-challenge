import 'package:core/client/http_client_impl.dart';
import 'package:core/client/request_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late HttpClientImpl httpClientImpl;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    httpClientImpl = HttpClientImpl(client: mockClient);
  });

  group('HttpClientImpl', () {
    test('should return HttpResponse.success when the request is successful', () async {
      // Arrange
      final requestData = HttpRequestData(
        baseUrl: 'https://api.example.com',
        endpoint: '/test',
        method: HttpMethod.get,
      );

      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{"key": "value"}', 200));

      final result = await httpClientImpl.request(requestData);

      expect(result.isSuccess, true);
      expect(result.data, {'key': 'value'});
    });

    test('should return HttpResponse.error when the request fails', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenThrow(Exception('Failed to load'));

      final result = await httpClientImpl.request(HttpRequestData(
        baseUrl: 'https://api.example.com',
        endpoint: '/test',
        method: HttpMethod.get,
      ));

      expect(result.isSuccess, false);
      expect(result.errorMessage, contains('An error occurred while processing the request'));
    });
  });
}
