class TMDBConfig {
  static const String tmdbBaseUrl = String.fromEnvironment('API_BASE_URL');
  static const String imageApi = String.fromEnvironment('IMAGE_API');
  static const String tmdbApiKey = String.fromEnvironment('API_KEY');
  static const String tmdbBearerToken = String.fromEnvironment('BEARER_TOKEN');
}
