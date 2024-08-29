import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/models/movie_model.dart';

import '../../../bloc/home_cubit.dart';
import 'movie_banner_widget.dart';
import 'movie_description_widget.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    final HomeCubit _cubit = Modular.get<HomeCubit>();

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          items: movies.map((movie) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    final trailerKey = _cubit.getTrailer(movie.id.toString());
                    _cubit.setSelectedMovie(movie);
                    Navigator.of(context).pushNamed('/details/:$trailerKey');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MovieBannerWidget(posterPath: movie.posterPath),
                      const SizedBox(height: 20),
                      Text(
                        movie.title,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MovieDescriptionWidget(
                        movie: movie,
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
