import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/const/api_const.dart';
import '../../../../core/utils/extensions/screen_extension.dart';
import '../../domain/entities/movie_entity.dart';
import '../controller/home_controller.dart';

class MoviePosterCard extends StatefulWidget {
  final Movie movie;

  MoviePosterCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  _MoviePosterCardState createState() => _MoviePosterCardState();
}

class _MoviePosterCardState
    extends ModularState<MoviePosterCard, HomeController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => controller.handleTapMovie(movieId: widget.movie.movieId),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.scale),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              '${ApiConst.imageApiUrl('w200')}${widget.movie.moviePoster}',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Container(
                width: 50.scale,
                height: 50.scale,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.scale),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${widget.movie.rating}',
                    style: TextStyle(
                      color: theme.colorScheme.onSecondary,
                      fontSize: 18.scale,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
