import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ilia_flutter_challenge/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio MovieApiDio() {
    return Dio(
      BaseOptions(
          baseUrl: "https://api.themoviedb.org/3/",
          headers: {
            "content-type": 'application/json',
            "authorization": dotenv.env['AUTHORIZATION_BEARER']
          },
          connectTimeout: const Duration(seconds: 5)),
    );
  }
}
