import 'package:ilia_challenge/core/domain/interfaces/int_error.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/main.dart';

class SignInRepository {
  final IntHttpService client = injector.find<IntHttpService>();

  Future<(IntError?, IntResponse?)> getConfig(
      {required String route}) async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: route);
    return (error, response);
  }
}
