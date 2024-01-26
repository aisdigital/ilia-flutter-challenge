

// class DependenciesInjector implements IntDepInjector {
//   final getIt = GetIt.instance;

// @override
// init() {
//   getIt.registerSingleton<IntCacheAdapter>(CacheAdapter());
//   getIt.registerSingleton<IntHttpClient>(DioClient());
// }

// @override
// find<T>() {
//   switch (T) {
//     case IntHttpClient:
//       return getIt<DioClient>();
//     case IntCache:
//       return getIt<CacheAdapter>();
//     default:
//       return null;
//   }
// }
// }
