import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/constants/constants.dart';
import 'package:ilia_challenge/app/features/details/screens/details_screen.dart';
import '../../../models/movie.dart';
import '../bloc/home_bloc.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key,
    required this.homeBloc,
    required this.movies,
  });
  final HomeBloc homeBloc;
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, itemIndex) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                homeBloc.add(HomeNavigateToDetailsEvent(
                    clickedMovie: movies[itemIndex]));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${movies[itemIndex].posterPath}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
