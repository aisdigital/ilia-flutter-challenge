import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

import 'carousel_widget.dart';

class HomeCarouselView extends StatelessWidget {
  const HomeCarouselView({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF612CCC), Color(0xFF9771FF)],
          ),
        ),
      ),
      CarouselWidget(movies: movies),
    ]);
  }
}
