import '../../models/api_configuration_model.dart';
import '../../models/api_result_model.dart';

abstract class IGetConfigurationsClient {
  Future<ApiResult<ApiConfigurationModel>> requestConfigurations();
}
