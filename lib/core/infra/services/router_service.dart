import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/modules/auth/view/pages/signin_page.dart';
import 'package:ilia_challenge/modules/home/view/home_page.dart';
import 'package:ilia_challenge/modules/movie/view/movie_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class IliaRouter {
  static Route<dynamic>? service(RouteSettings settings) {
    switch (settings.name) {
      case SignInPage.route:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case MoviePage.route:
        return MaterialPageRoute(
            builder: (_) => MoviePage(movie: settings.arguments as Movie));
      default:
        return MaterialPageRoute(builder: (_) => const SignInPage());
    }
  }
}
