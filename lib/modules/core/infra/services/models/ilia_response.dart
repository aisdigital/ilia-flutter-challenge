import 'package:ilia_challenge/modules/core/infra/interfaces/int_error.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_response.dart';

class IliaResponse implements IntResponse {
  @override
  final Result result;

  @override
  final IntError? error;

  @override
  final Map<String, dynamic> data;

  IliaResponse({
    this.result = Result.waiting,
    this.data = const {},
    this.error,
  });
}
