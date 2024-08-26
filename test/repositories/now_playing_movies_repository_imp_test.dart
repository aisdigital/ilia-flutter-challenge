import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_flutter_challenge/repositories/now_playing_movies_repository_imp.dart';
import 'package:ilia_flutter_challenge/service/dio_service.dart';
import 'package:ilia_flutter_challenge/service/dio_service_imp.dart';
import 'package:ilia_flutter_challenge/shared/models/api_response_model.dart';
import 'package:ilia_flutter_challenge/shared/utils/api_utils.dart';
import 'package:mockito/mockito.dart';

// class DioMock extends Mock implements Dio {}

// class DioTestService implements DioService {
//   @override
//   Dio MovieApiDio() {
//     return DioMock();
//   }
// }

void main() {
  final repository = NowPlayingMoviesRepositoryImp(DioServiceImp());

  // group("dio test", () {
  //   test("error timeout test", () async {
  //     when(DioTestService().MovieApiDio().get(any)).thenThrow((_) async =>
  //         DioException.connectionError(
  //             requestOptions: RequestOptions(), reason: "no internet"));
  //     final res = await repository.fetchByPage(1);
  //     expect(res, isA<String>());
  //   });
  // });

  group("api calls", () {
    test(
      "api call should return a Dio Response",
      () async {
        final res = await repository.fetchByPage(null);
        expect(res, isA<Response<dynamic>>());
      },
    );
    test(
      "api call should return a status code 200",
      () async {
        final res = await repository.fetchByPage(null);
        expect(res.statusCode, 200);
      },
    );
    test(
      "api data return should be a Map",
      () async {
        final res = await repository.fetchByPage(null);
        expect(res.data, isA<Map<String, dynamic>>());
      },
    );
    test(
      "api data should be able to turn into a ApiResponseModel",
      () async {
        final res = await repository.fetchByPage(null);
        expect(ApiResponseModel.fromMap(res.data), isA<ApiResponseModel>());
      },
    );
  });
}
