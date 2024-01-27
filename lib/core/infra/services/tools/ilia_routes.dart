import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/view/home_page.dart';
import 'package:ilia_challenge/modules/movie/view/movie_page.dart';

class SystemRoutes {
  static String get root => IliaApp.route;
  static String get home => HomePage.route;
  static String get movies => '$home${MoviePage.route}';
}

enum IliaRoutes {
  root,
  home,
  movies;

  String get path {
    return switch (this) {
      root => SystemRoutes.root,
      home => SystemRoutes.home,
      movies => SystemRoutes.movies,
    };
  }
}
