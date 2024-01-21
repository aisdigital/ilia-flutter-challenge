import 'package:flutter_modular/flutter_modular.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/presenter/pages/movies_details_page.dart';
import 'package:ilia_flutter_challenge/utils/app_routes.dart';

class MoviesDetailsModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => MoviesDetailsPage(movieId: r.args.data),
    );
  }
}
