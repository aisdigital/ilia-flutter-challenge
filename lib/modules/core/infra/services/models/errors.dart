import 'package:ilia_challenge/modules/core/infra/interfaces/int_error.dart';

class ServerError implements IntError {
  @override
  String? message;
  ServerError({
    this.message = 'Não foi possível completar esta requisição.',
  });
}
