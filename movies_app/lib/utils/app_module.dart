import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/screens/details/details_screen.dart';
import 'package:movies_app/services/api_configurations/get_configurations_client.dart';
import 'package:movies_app/services/movies/get_movies_request.dart';
import '../bloc/home_cubit.dart';
import '../services/api_configurations/get_configurations_request.dart';
import '../services/movies/get_movies_client.dart';
import '../services/videos/get_videos_client.dart';
import '../services/videos/get_videos_request.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton<HomeCubit>(() => HomeCubit(i.get<IGetMoviesClient>(), i.get<IGetConfigurationsClient>(), i.get<IGetVideosClient>()));
    i.addSingleton<IGetMoviesClient>(() => GetMoviesImpl());
    i.addSingleton<IGetConfigurationsClient>(() => GetConfigurationsImpl());
    i.addSingleton<IGetVideosClient>(() => GetVideosImpl());
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomeScreen());
    r.child('/details/:trailerKey', child: (_) => DetailsScreen(trailerKey: r.args.params['trailerKey']));
  }

}
