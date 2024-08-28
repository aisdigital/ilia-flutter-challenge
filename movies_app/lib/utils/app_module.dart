import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/screens/details/details_screen.dart';
import 'package:movies_app/services/get_configurations_client.dart';
import 'package:movies_app/services/get_movies_request.dart';
import '../blocs/home_bloc/home_cubit.dart';
import '../services/get_configurations_request.dart';
import '../services/get_movies_client.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton<HomeCubit>(() => HomeCubit(i.get<IGetMoviesClient>(), i.get<IGetConfigurationsClient>()));
    i.addSingleton<IGetMoviesClient>(() => GetMoviesImpl());
    i.addSingleton<IGetConfigurationsClient>(() => GetConfigurationsImpl());
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomeScreen());
    r.child('/details', child: (_) => const DetailsScreen());
  }

}
