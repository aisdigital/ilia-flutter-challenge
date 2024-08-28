import 'api_error_model.dart';

class ApiResult<T> {
  final int code;
  final bool success;
  final String status;
  final dynamic value;
  
  ApiResult.success(dynamic response)
      : code = 0,
        success = true,
        status = 'Sucesso',
        value = response as T;

  ApiResult.error(String errorMessage)
      : code = 9999,
        success = false,
        status = 'Erro',
        value = errorMessage;
  
  ApiResult.codeError(ApiErrorModel? error)
      : code = error?.code ?? 9999,
        success = false,
        status = 'Erro',
        value = error?.message ?? 'Unexpected error';

}