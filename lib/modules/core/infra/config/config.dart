import 'package:ilia_challenge/modules/core/infra/config/constants/const_config.dart';

class Config {
//TODO: Adicionar links conforme disponibilidade
  static const apiKey = TMDBConfig.tmdbApiKey;
  static const bearerToken = TMDBConfig.tmdbBearerToken;
  static String? storeLink = StoreConfig.linkForCurrentPlatform;
  static const privacyPolicy = TermsOfUse.privacyPolicy;
  static const termsOfService = TermsOfUse.termsOfService;
}
