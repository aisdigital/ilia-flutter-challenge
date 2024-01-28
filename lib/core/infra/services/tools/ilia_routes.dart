import 'package:ilia_challenge/modules/auth/view/pages/signin_page.dart';
import 'package:ilia_challenge/modules/home/view/home_page.dart';
import 'package:ilia_challenge/modules/movie/view/movie_page.dart';

class SystemRoutes {
  static String get signin => SignInPage.route;
  static String get home => HomePage.route;
  static String get movies => '$home${MoviePage.route}';
}

enum IliaRoutes {
  signin,
  home,
  movies;

  String get path {
    return switch (this) {
      signin => SystemRoutes.signin,
      home => SystemRoutes.home,
      movies => SystemRoutes.movies,
    };
  }
}
