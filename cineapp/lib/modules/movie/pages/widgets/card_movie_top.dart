import 'package:cineapp/core/definitions/constraints.dart';
import 'package:cineapp/modules/movie/models/movie.dart';
import 'package:flutter/material.dart';

class CardMovieTop extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback? onTap;

  const CardMovieTop({
    Key? key,
    required this.movie,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            child: Image.network(
              'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(Constraints.borderRadiusSmall),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(Constraints.borderRadiusSmall),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(Constraints.paddingNormal),
            child: Text(
              movie.title!.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Constraints.fontSizeNormal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
