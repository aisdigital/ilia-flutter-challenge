import 'package:ilia_challenge/core/infra/services/config/constants/const_config.dart';
import 'package:ilia_challenge/core/infra/services/models/api_config.dart';

class Config {
//TODO: Adicionar links conforme disponibilidade
  static const tmdbBaseUrl = TMDBConfig.tmdbBaseUrl;
  static const apiKey = TMDBConfig.tmdbApiKey;
  static const bearerToken = TMDBConfig.tmdbBearerToken;
  static String? storeLink = StoreConfig.linkForCurrentPlatform;
  static const privacyPolicy = TermsOfUse.privacyPolicy;
  static const termsOfService = TermsOfUse.termsOfService;
}
