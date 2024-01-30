import 'package:ilia_challenge/core/domain/interfaces/int_error.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';

abstract class IntHttpService {
  Future<(IntError?, IntResponse?)> get({required String route});
  Future<(IntError?, IntResponse?)> post(
      {required String route, required Map payload});
  Future<(IntError?, IntResponse?)> put(
      {required String route, required Map payload});
  Future<(IntError?, IntResponse?)> delete({
    required String route,
  });
}
