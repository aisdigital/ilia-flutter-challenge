import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../models/movie.dart';
import '../bloc/home_bloc.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    Key? key,
    required this.movies,
    required this.homeBloc,
  }) : super(key: key);

  final HomeBloc homeBloc;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: movies.length,
        options: CarouselOptions(
          height: 280,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              homeBloc.add(
                  HomeNavigateToDetailsEvent(clickedMovie: movies[itemIndex]));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 299,
                width: 200,
                child: Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${movies[itemIndex].posterPath}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
