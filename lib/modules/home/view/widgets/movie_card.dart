import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/modules/home/view/bloc/home_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final (poster, backdrop) = context
        .read<HomeBloc>()
        .getImageUri(backdrop: movie.posterPath, poster: movie.backdropPath);

    return Container(
      height: 200,
      width: IliaLayout(context).width * .96,
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/nobanner.jpeg'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                imageUrl: backdrop),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: SizedBox(
                  height: 150,
                  width: 90,
                  child: CachedNetworkImage(
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/images/nobanner.jpeg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      imageUrl: poster),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 40,
              color: Colors.black26,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  Text(
                    '${movie.releaseDate?.substring(0, 4)}  /',
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${AppLocalizations.of(context)?.score ?? ''}:',
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${movie.voteAverage?.toStringAsPrecision(2)}',
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.black26,
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              alignment: Alignment.topRight,
              child: Text(
                movie.title ?? '',
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
