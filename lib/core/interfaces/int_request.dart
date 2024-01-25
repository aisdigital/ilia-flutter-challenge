import 'package:ilia_challenge/core/interfaces/int_response.dart';
import 'package:ilia_challenge/core/interfaces/int_error.dart';

abstract class IntRequest {
  String route;
  Future<(IntError?, IntResponse)> get();
  Future<(IntError?, IntResponse)> post({required Map payload});
  Future<(IntError?, IntResponse)> put({required Map payload});
  Future<(IntError?, IntResponse)> delete();

  IntRequest({required this.route});
}
